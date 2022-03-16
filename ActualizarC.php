<?php 
include'BD/conexionBD.php';
$email=$_POST['email'];
$contraseña=($_POST['contraseña']);
$contraseñac=($_POST['confirmar']);

if ($contraseña==$contraseñac) {
	$query_update=mysqli_query($mysqli,"UPDATE administradores SET contraseña='$contraseña'
                                     WHERE email='$email'");
    echo '<script language="javascript">alert("Contraseña Actualizada");window.location.href="index.php"</script>';
}else{


  ?>