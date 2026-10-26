<?php
session_start();
// true = entra con cualquier usuario/contraseña (solo para pruebas locales). Cambia a false para exigir login real.
define('MODO_DEMO', true);
$pdo = new PDO('mysql:host=127.0.0.1;dbname=base_veterinaria;charset=utf8mb4', 'root', '', [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
]);
$_SESSION['t'] ??= bin2hex(random_bytes(16));
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !hash_equals($_SESSION['t'], $_POST['t'] ?? '')) die('Sesión inválida. Recarga la página.');
function e($s)
{
  return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8');
}
function tok()
{
  return '<input type="hidden" name="t" value="' . $_SESSION['t'] . '">';
}
function auth()
{
  if (empty($_SESSION['u'])) {
    header('Location: index.php');
    exit;
  }
}
function money($n)
{
  return '$' . number_format((float)$n, 2);
}
function head($t)
{
  auth();
  $p = basename($_SERVER['PHP_SELF']);
  $n = ['citas.php' => 'Citas', 'pacientes.php' => 'Pacientes', 'historial.php' => 'Historial clínico', 'productos.php' => 'Productos'];
  echo '<!doctype html><html lang="es"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>' . e($t) . ' · VetCare</title><link rel="stylesheet" href="style.css"><body><header><b class="logo">🐾 VetCare</b><nav>';
  foreach ($n as $f => $l) echo '<a href="' . $f . '"' . ($f == $p ? ' class="on"' : '') . '>' . $l . '</a>';
  echo '</nav><span class="who">'. ' <a href="logout.php">Salir</a></span></header><main><h1>' . e($t) . '</h1>';
}
function foot()
{
  echo '</main></body></html>';
}
