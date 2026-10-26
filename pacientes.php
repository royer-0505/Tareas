<?php
require 'config.php';
auth();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $pdo->prepare('INSERT INTO pacientes(nombre,especie,raza,sexo,fecha_nacimiento,peso,estado,Id_Clientes) VALUES(?,?,?,?,?,?,"Activo",?)')
    ->execute([$_POST['nombre'], $_POST['especie'], $_POST['raza'] ?: null, $_POST['sexo'] ?: null, $_POST['nac'] ?: null, $_POST['peso'] ?: null, $_POST['cliente'] ?: null]);
  header('Location: pacientes.php');
  exit;
}
$b = '%' . ($_GET['q'] ?? '') . '%';
$s = $pdo->prepare("SELECT p.*, CONCAT(c.nombre,' ',c.apellido_paterno) dueno FROM pacientes p LEFT JOIN clientes c ON c.Id_Clientes=p.Id_Clientes
  WHERE p.nombre LIKE ? OR p.raza LIKE ? OR c.nombre LIKE ? OR c.apellido_paterno LIKE ? ORDER BY p.nombre");
$s->execute([$b, $b, $b, $b]);
$rows = $s->fetchAll();
$cli = $pdo->query('SELECT Id_Clientes, nombre, apellido_paterno FROM clientes ORDER BY nombre')->fetchAll();
head('Pacientes (mascotas)'); ?>
<details class="card">
  <summary>Registrar nueva mascota</summary>
  <form method="post" class="grid"><?= tok() ?>
    <label>Nombre<input name="nombre" required></label>
    <label>Especie<select name="especie">
        <option>Perro
        <option>Gato
        <option>Conejo
        <option>Otro
      </select></label>
    <label>Raza<input name="raza"></label>
    <label>Sexo<select name="sexo">
        <option value="">—
        <option>Macho
        <option>Hembra
      </select></label>
    <label>Fecha de nacimiento<input type="date" name="nac"></label>
    <label>Peso (kg)<input type="number" step="0.01" name="peso"></label>
    <label>Dueño<select name="cliente">
        <option value="">Sin asignar</option><?php foreach ($cli as $c) echo '<option value="' . $c['Id_Clientes'] . '">' . e($c['nombre'] . ' ' . $c['apellido_paterno']) . '</option>'; ?>
      </select></label>
    <button>Guardar mascota</button>
  </form>
</details>
<form class="filters"><input name="q" placeholder="Buscar por mascota, raza o dueño" value="<?= e($_GET['q'] ?? '') ?>"><button>Buscar</button></form>
<div class="scroll">
  <table>
    <tr>
      <th>Mascota</th>
      <th>Especie / raza</th>
      <th>Sexo</th>
      <th>Nacimiento</th>
      <th>Peso</th>
      <th>Dueño</th>
      <th></th>
    </tr>
    <?php foreach ($rows as $r): ?><tr>
        <td><b><?= e($r['nombre']) ?></b></td>
        <td><?= e($r['especie'] . ' · ' . $r['raza']) ?></td>
        <td><?= e($r['sexo']) ?></td>
        <td><?= e($r['fecha_nacimiento']) ?></td>
        <td><?= $r['peso'] ? e($r['peso']) . ' kg' : '' ?></td>
        <td><?= e($r['dueno']) ?></td>
        <td><a href="historial.php?id=<?= $r['id_Pacientes'] ?>">Ver historial</a></td>
      </tr>
    <?php endforeach;
    if (!$rows) echo '<tr><td colspan="7" class="muted">Sin resultados.</td></tr>'; ?>
  </table>
</div>
<?php foot();
