S<?php
require 'config.php';
auth();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (isset($_POST['add'])) $pdo->prepare('INSERT INTO productos(nombre_productos,categoria,precio,stock,estado,peso_medida) VALUES(?,?,?,?,"Activo",?)')
    ->execute([$_POST['nombre'], $_POST['cat'], $_POST['precio'], $_POST['stock'], $_POST['medida']]);
  else $pdo->prepare('UPDATE productos SET stock=stock+? WHERE id_Productos=?')->execute([(int)$_POST['sumar'], $_POST['id']]);
  header('Location: productos.php');
  exit;
}
$cat = $_GET['cat'] ?? '';
$q = '%' . ($_GET['q'] ?? '') . '%';
$s = $pdo->prepare("SELECT * FROM productos WHERE (?='' OR categoria=?) AND nombre_productos LIKE ? ORDER BY categoria, nombre_productos");
$s->execute([$cat, $cat, $q]);
$rows = $s->fetchAll();
$cats = $pdo->query('SELECT DISTINCT categoria FROM productos ORDER BY 1')->fetchAll(PDO::FETCH_COLUMN);
head('Productos en venta'); ?>
<details class="card">
  <summary>Agregar producto</summary>
  <form method="post" class="grid"><?= tok() ?><input type="hidden" name="add" value="1">
    <label>Nombre<input name="nombre" required></label><label>Categoría<input name="cat" list="cats" required></label>
    <label>Precio<input type="number" step="0.01" name="precio" required></label><label>Stock<input type="number" name="stock" required value="0"></label>
    <label>Presentación<input name="medida" placeholder="500 ml, 1 pieza…"></label><button>Guardar producto</button>
  </form>
  <datalist id="cats"><?php foreach ($cats as $c) echo '<option>' . e($c); ?></datalist>
</details>
<form class="filters"><input name="q" placeholder="Buscar producto" value="<?= e($_GET['q'] ?? '') ?>"><select name="cat">
    <option value="">Todas las categorías</option>
    <?php foreach ($cats as $c) echo '<option' . ($c === $cat ? ' selected' : '') . '>' . e($c) . '</option>'; ?>
  </select><button>Filtrar</button></form>
<div class="scroll">
  <table>
    <tr>
      <th>Producto</th>
      <th>Categoría</th>
      <th>Presentación</th>
      <th>Precio</th>
      <th>Stock</th>
      <th>Reabastecer</th>
    </tr>
    <?php foreach ($rows as $r): ?><tr>
        <td><?= e($r['nombre_productos']) ?></td>
        <td><?= e($r['categoria']) ?></td>
        <td><?= e($r['peso_medida']) ?></td>
        <td><?= money($r['precio']) ?></td>
        <td><span class="tag <?= $r['stock'] < 10 ? 'cancelada' : 'completada' ?>"><?= (int)$r['stock'] ?><?= $r['stock'] < 10 ? ' · bajo' : '' ?></span></td>
        <td>
          <form method="post" class="inline"><?= tok() ?><input type="hidden" name="id" value="<?= $r['id_Productos'] ?>"><input type="number" name="sumar" value="5" min="1" style="width:70px"><button>Sumar</button></form>
        </td>
      </tr>
    <?php endforeach;
    if (!$rows) echo '<tr><td colspan="6" class="muted">Sin productos.</td></tr>'; ?>
  </table>
</div>
<?php foot();
