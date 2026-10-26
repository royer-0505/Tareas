<?php
require 'config.php';
if (!empty($_SESSION['u'])) {
  header('Location: citas.php');
  exit;
}
$err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $s = $pdo->prepare("SELECT * FROM usuarios WHERE usuario=? AND estado='Activo'");
  $s->execute([$_POST['usuario']]);
  $u = $s->fetch();
  // La BD guarda contraseñas en texto plano; también acepta hashes (password_hash) para cuando las migres.
  $ok = $u && ($_POST['clave'] === $u['contraseña'] || password_verify($_POST['clave'], $u['contraseña']));
  if (!$ok && MODO_DEMO) { // modo demo: entra como el primer usuario activo
    $u = $pdo->query("SELECT * FROM usuarios WHERE estado='Activo' ORDER BY id_usuario LIMIT 1")->fetch();
    $ok = (bool)$u;
  }
  if ($ok) {
    session_regenerate_id(true);
    unset($u['contraseña']);
    $_SESSION['u'] = $u;
    header('Location: citas.php');
    exit;
  }
  $err = 'Usuario o contraseña incorrectos.';
}
?>
<!doctype html>
<html lang="es">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Iniciar sesión · VetCare</title>
<link rel="stylesheet" href="style.css">

<body class="login">
  <form method="post" class="card login-box">
    <h1>🐾 VetCare</h1>
    <p class="muted">Ingresa para ver las citas y los pacientes de hoy.</p>
    <?php if ($err) echo '<p class="err">' . e($err) . '</p>';
    echo tok(); ?>
    <label>Usuario<input name="usuario" required autofocus></label>
    <label>Contraseña<input name="clave" type="password" required></label>
    <button>Iniciar sesión</button>
  </form>
</body>

</html>

