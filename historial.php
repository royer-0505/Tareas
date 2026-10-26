<?php
require 'config.php';
auth();
$id = (int)($_GET['id'] ?? 0);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $id = (int)$_POST['pac'];
  if (isset($_POST['diag'])) $pdo->prepare('INSERT INTO historial_medico(id_Pacientes,fecha_apertura,diagnostico,tratamiento,observaciones) VALUES(?,CURDATE(),?,?,?)')
    ->execute([$id, $_POST['diag'], $_POST['trat'] ?: null, $_POST['obs'] ?: null]);
  if (isset($_POST['costo'])) $pdo->prepare('INSERT INTO consultas(id_historial,fecha,costos,notas) VALUES(?,CURDATE(),?,?)')
    ->execute([$_POST['hist'], $_POST['costo'], $_POST['notas']]);
  header('Location: historial.php?id=' . $id);
  exit;
}
$pac = $pdo->query('SELECT id_Pacientes, nombre, especie FROM pacientes ORDER BY nombre')->fetchAll();
$form = function ($sel) use ($pac) { ?>
  <details class="card">
    <summary>Abrir nuevo registro clínico</summary>
    <form method="post" class="grid"><?= tok() ?>
      <label>Paciente<select name="pac"><?php foreach ($pac as $p) echo '<option value="' . $p['id_Pacientes'] . '"' . ($p['id_Pacientes'] == $sel ? ' selected' : '') . '>' . e($p['nombre']) . ' (' . e($p['especie']) . ')</option>'; ?></select></label>
      <label>Diagnóstico<input name="diag" required></label><label>Tratamiento<input name="trat"></label><label>Observaciones<input name="obs"></label>
      <button>Guardar registro</button>
    </form>
  </details><?php };

          if (!$id) {
            head('Historial clínico');
            $form(0);
            $r = $pdo->query('SELECT h.*, p.nombre mascota FROM historial_medico h JOIN pacientes p ON p.id_Pacientes=h.id_Pacientes ORDER BY h.fecha_apertura DESC, h.id_historial DESC LIMIT 40')->fetchAll();
            echo '<p class="muted">Últimos registros. Para ver el expediente completo, entra desde un paciente.</p><div class="scroll"><table><tr><th>Fecha</th><th>Paciente</th><th>Diagnóstico</th><th>Tratamiento</th><th>Observaciones</th></tr>';
            foreach ($r as $x) echo '<tr><td>' . e($x['fecha_apertura']) . '</td><td><a href="?id=' . $x['id_Pacientes'] . '">' . e($x['mascota']) . '</a></td><td>' . e($x['diagnostico']) . '</td><td>' . e($x['tratamiento']) . '</td><td>' . e($x['observaciones']) . '</td></tr>';
            echo '</table></div>';
            foot();
            exit;
          }
          $s = $pdo->prepare("SELECT p.*, CONCAT(c.nombre,' ',c.apellido_paterno) dueno, c.telefono1 FROM pacientes p LEFT JOIN clientes c ON c.Id_Clientes=p.Id_Clientes WHERE id_Pacientes=?");
          $s->execute([$id]);
          $p = $s->fetch();
          if (!$p) {
            header('Location: historial.php');
            exit;
          }
          $h = $pdo->prepare('SELECT * FROM historial_medico WHERE id_Pacientes=? ORDER BY fecha_apertura DESC, id_historial DESC');
          $h->execute([$id]);
          $cs = $pdo->prepare('SELECT * FROM consultas WHERE id_historial=? ORDER BY fecha DESC, id_consultas DESC');
          head('Expediente de ' . $p['nombre']); ?>
<div class="card"><b><?= e($p['nombre']) ?></b> — <?= e($p['especie'] . ' ' . $p['raza']) ?>, <?= e($p['sexo'] ?: 'sexo sin registrar') ?>, <?= $p['peso'] ? e($p['peso']) . ' kg' : 'peso sin registrar' ?><br>
  <span class="muted">Dueño: <?= e($p['dueno'] ?: 'sin asignar') ?> <?= e($p['telefono1']) ?></span> · <a href="pacientes.php">Volver a pacientes</a>
</div>
<?php $form($id);
foreach ($h->fetchAll() as $x): $cs->execute([$x['id_historial']]); ?>
  <section class="card">
    <h3><?= e($x['fecha_apertura']) ?> · <?= e($x['diagnostico']) ?></h3>
    <p><b>Tratamiento:</b> <?= e($x['tratamiento'] ?: '—') ?><br><b>Observaciones:</b> <?= e($x['observaciones'] ?: '—') ?></p>
    <?php foreach ($cs->fetchAll() as $c) echo '<p class="consulta">' . e($c['fecha']) . ' · ' . money($c['costos']) . ' · ' . e($c['notas']) . '</p>'; ?>
    <form method="post" class="inline"><?= tok() ?><input type="hidden" name="pac" value="<?= $id ?>"><input type="hidden" name="hist" value="<?= $x['id_historial'] ?>">
      <input type="number" step="0.01" name="costo" placeholder="Costo" required><input name="notas" placeholder="Notas de la consulta" required><button>Agregar consulta</button>
    </form>
  </section>
<?php endforeach;
foot();
