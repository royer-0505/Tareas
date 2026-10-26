<?php
require 'config.php';
auth();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (isset($_POST['estado'])) {
    $pdo->prepare('UPDATE citas SET estado=? WHERE id_cita=?')->execute([$_POST['estado'], $_POST['id']]);
  } else {
    $pdo->prepare('INSERT INTO citas(id_Pacientes,id_usuario,fecha,hora,motivo,estado) VALUES(?,?,?,?,?,"Pendiente")')
      ->execute([$_POST['pac'], $_SESSION['u']['id_usuario'], $_POST['fecha'], $_POST['hora'], $_POST['motivo']]);
  }
  header('Location: citas.php');
  exit;
}
$f = $_GET['estado'] ?? '';
$q = $pdo->prepare("SELECT c.*, p.nombre mascota, p.especie, cl.nombre dueno, cl.apellido_paterno ap, cl.telefono1
  FROM citas c JOIN pacientes p ON p.id_Pacientes=c.id_Pacientes LEFT JOIN clientes cl ON cl.Id_Clientes=p.Id_Clientes
  WHERE (?='' OR c.estado=?) ORDER BY c.estado='Pendiente' DESC, c.fecha, c.hora");
$q->execute([$f, $f]);
$citas = $q->fetchAll();
$n = $pdo->query("SELECT SUM(estado='Pendiente') p, SUM(estado='Completada') c FROM citas")->fetch();
$pac = $pdo->query('SELECT id_Pacientes, nombre, especie FROM pacientes ORDER BY nombre')->fetchAll();
head('Citas agendadas'); ?>
<div class="stats">
  <div class="card"><b><?= (int)$n['p'] ?></b>Pendientes</div>
  <div class="card"><b><?= (int)$n['c'] ?></b>Completadas</div>
  <div class="card"><b><?= $pdo->query('SELECT COUNT(*) FROM pacientes')->fetchColumn() ?></b>Pacientes</div>
  <div class="card"><b><?= $pdo->query('SELECT COUNT(*) FROM productos WHERE stock<10')->fetchColumn() ?></b>Productos con stock bajo</div>
</div>

<details class="card">
  <summary>Agendar nueva cita</summary>
  <form method="post" class="grid"><?= tok() ?>
    <label>Paciente<select name="pac" required><?php foreach ($pac as $p) echo '<option value="' . $p['id_Pacientes'] . '">' . e($p['nombre']) . ' (' . e($p['especie']) . ')</option>'; ?></select></label>
    <label>Fecha<input type="date" name="fecha" required value="<?= date('Y-m-d') ?>"></label>
    <label>Hora<input type="time" name="hora" required value="09:00"></label>
    <label>Motivo<input name="motivo" required></label><button>Agendar cita</button>
  </form>
</details>

<p class="filters"><?php foreach (['' => 'Todas', 'Pendiente' => 'Pendientes', 'Completada' => 'Completadas', 'Cancelada' => 'Canceladas'] as $k => $l)
                      echo '<a href="?estado=' . $k . '"' . ($k === $f ? ' class="on"' : '') . '>' . $l . '</a>'; ?></p>
<div class="scroll">
  <table>
    <tr>
      <th>Fecha</th>
      <th>Hora</th>
      <th>Paciente</th>
      <th>Dueño</th>
      <th>Motivo</th>
      <th>Estado</th>
      <th></th>
    </tr>
    <?php foreach ($citas as $c): ?><tr>
        <td><?= e($c['fecha']) ?></td>
        <td><?= substr($c['hora'], 0, 5) ?></td>
        <td><a href="historial.php?id=<?= $c['id_Pacientes'] ?>"><?= e($c['mascota']) ?></a> <small class="muted"><?= e($c['especie']) ?></small></td>
        <td><?= e($c['dueno'] . ' ' . $c['ap']) ?><br><small class="muted"><?= e($c['telefono1']) ?></small></td>
        <td><?= e($c['motivo']) ?></td>
        <td><span class="tag <?= strtolower($c['estado']) ?>"><?= e($c['estado']) ?></span></td>
        <td><?php if ($c['estado'] === 'Pendiente'): ?><form method="post" class="inline"><?= tok() ?><input type="hidden" name="id" value="<?= $c['id_cita'] ?>">
              <button name="estado" value="Completada">Completar</button> <button name="estado" value="Cancelada" class="ghost">Cancelar</button>
            </form><?php endif; ?></td>
      </tr>
    <?php endforeach;
    if (!$citas) echo '<tr><td colspan="7" class="muted">No hay citas con este filtro.</td></tr>'; ?>
  </table>
</div>
<?php foot();
