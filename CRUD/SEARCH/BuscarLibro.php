<?php 
session_start();
if (empty($_SESSION['active'])) {
    header('location: ../../system/salir.php');
}
$busqueda=strtolower($_REQUEST['busqueda']);
            if (empty($busqueda)) {
                header('location:ListaLibros.php');
                }
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Lista de Libros</title>

   <?php include'../../INCLUDES/link2.php'; ?>


</head>


<body>
    <!-- Main container -->
    <main class="full-box main-container">
        <!-- Nav lateral -->
       <section class="full-box nav-lateral">
            <div class="full-box nav-lateral-bg show-nav-lateral"></div>
            <div class="full-box nav-lateral-content">
            
            
            
                               <img src="../../assets/img/LOGO.png" height="180px" width="300px">

                
                
                
                <div class="full-box nav-lateral-bar"></div>
                <!--- menu -->
            <div class="full-box nav-lateral-bar"></div>
                <nav class="full-box nav-lateral-menu">
                    <ul>
                        
                        <li>
                        <a href="../../system/index.php"><i class="fas fa-home"></i>

                        &nbsp; Inicio</a>
                        </li>
                    
                    <?php 
                    if ($_SESSION['rol'] <2) {
                        ?>
                            <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-user"></i>

                            &nbsp; Administrador <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                 <li>
                                 <a href="../CREATE/CrearAdmin.php"><i class="fas fa-plus-circle"></i>

                                  &nbsp; Nuevo Administrador</a>
                                </li>
                                
                                <li>
                                    <a href="../READ/ListaAdmin.php"><i class="fas fa-list-alt"></i>

                                   &nbsp; Lista de Administradores</a>
                                </li>
                            </ul>
                        </li>

                     <?php } ?>
                    

                        <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-book"></i>

                            &nbsp; Libros <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                 <?php 
                        if ($_SESSION['rol'] <2) {
                        ?>
                                <li>
                                    <a href="../CREATE/CrearLibro.php"><i class="fas fa-plus-circle"></i>Agregar Libro</a>
                                </li>

                                  <?php } ?>
                                <li>
                                    <a href="../READ/ListaLibro.php"><i class="fas fa-list-alt"></i> &nbsp; Lista de Libros</a>
                                </li>
                            </ul>
                        </li>

                         <?php 
                    if ($_SESSION['rol'] <=2) {
                        ?>

                    <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-book-reader"></i>

                             &nbsp; Lectores <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                <li>
                                    <a href="../CREATE/CrearLector.php"><i class="fas fa-plus-circle"></i>&nbsp; Agregar Lector</a>
                                </li>
                                <li>
                                    <a href="../READ/ListaLector.php"><i class="fas fa-list-alt"></i> &nbsp; Lista de Lectores</a>
                                </li>
                            </ul>
                        </li>

                       

                        <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-file-upload"></i>

                               &nbsp; Pr??stamos <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                <li>
                                    <a href="../CREATE/CrearPrestamo.php"><i class="fas fa-plus-circle"></i>&nbsp; Nuevo pr??stamo</a>
                                </li>
                                <li>
                                    <a href="../READ/ListaPrestamo.php"><i class="fas fa-list-alt"></i> &nbsp; Lista de pr??stamos</a>
                                </li>
                               
                            </ul>
                        </li>

                         <?php } ?>
                       
                        
                        
                        <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-atlas"></i>

                             &nbsp; Categor??as <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                <li>
                                    <a href="../CREATE/CrearCategoria.php"><i class="fas fa-plus-circle"></i> &nbsp; Agregar categor??a</a>
                                </li>
                                <li>
                                    <a href="../READ/ListaCategoria.php"><i class="fas fa-list-alt"></i> &nbsp; Lista de Categor??as</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="nav-btn-submenu"><i class="fas fa-university"></i>

                             &nbsp; Editoriales <i class="fas fa-chevron-down"></i></a>
                            <ul>
                                <li>
                                    <a href="../CREATE/CrearEditorial.php"><i class="fas fa-plus-circle"></i> &nbsp; Agregar editorial</a>
                                </li>
                                <li>
                                    <a href="../READ/ListaEditorial.php"><i class="fas fa-list-alt"></i> &nbsp; Lista de Editoriales</a>
                                </li>
                                
                            </ul>
                        </li>

                         <?php 
                    if ($_SESSION['rol'] <2) {
                        ?>
                       
            
                     <li>
                        <a href="../../backupDB/descarga.php"><i class="fas fa-copy"></i>

                        &nbsp; Backup</a>
                        </li>
                        
                         <?php } ?>


                    </ul>
                </nav>
            </div>
            </div>
        </section>

        <section class="full-box page-content">
            <nav class="full-box navbar-info">
               
                
                <a href="../../system/salir.php" class="btn-exit">
                    <i class="fas fa-power-off"></i>
                </a>
            </nav>
            <!-- Page header -->
           <div class="full-box page-header">
                <h3 class="text-left">
                     &nbsp; Lista de Libros
                </h3>
            </div>


            <div class="container-fluid">

                         <?php 
                    if ($_SESSION['rol'] <2) {
                        ?>
                <ul class="full-box list-unstyled page-nav-tabs">
                    <li>
                        <a href="../CREATE/CrearLibro.php" style="border-color: blue;"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Libro</a>
                    </li>
                    <li>
                        <a href="../CREATE/CrearPrestamo.php" style="border-color: blue;"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Prestamo</a>
                    </li>
                   
                </ul> 
                 <?php } ?>  
            </div>
          <form action="BuscarLibro.php" method="POST">
                <div class="col-12 col-md-12">
                <div class="form-group">
                    <label for="numEjemplares" class="bmd-label text-dark">Buscar Libro</label><br>
                    <input  type="text"  class="form-control" name="busqueda">
                    <div class="invalid-feedback">
                        *El Campo Numero de ejemplares es obligatorio
                    </div>
                </div>
            </div>
          </form>
            <!--CONTENT-->
            <div class="container-fluid">
               <br><br><br>
              
                
                       <table class="table table-striped">
                        <thead>
                            <tr class="text-center roboto-medium">
                                <th>Id</th>
                                <th>ISBN</th>
                                <th>Titulo</th>
                                <th>Autor</th>
                                <th>Publicacion</th>
                                <th>Ejemplares</th>
                                <th>Estado</th>
                                
                                <th>PDF</th>

                         <?php 
                    if ($_SESSION['rol'] <2) {
                        ?>
                                <th>Acci??n</th>

                                 <?php } ?>
                            </tr>
                        </thead>
                        <?php 
            //paginador
                  include'../../BD/conexionBD.php';
        $sql_register = mysqli_query($mysqli, "SELECT COUNT(*) as total_registros FROM libros WHERE (  idLibro    LIKE   '%$busqueda%'  OR 
        isbn     LIKE   '%$busqueda%'  OR 
        titulo       LIKE   '%$busqueda%' OR
        autor       LIKE   '%$busqueda%' OR
        anioPublicacion      LIKE   '%$busqueda%' OR 
        numEjemplares      LIKE   '%$busqueda%' OR
        estado_libro      LIKE   '%$busqueda%' 

    )");

$result_register=mysqli_fetch_array($sql_register);
$total_registros=$result_register['total_registros'];

$por_pagina=2;
if (empty($_GET['pagina'])) 
{
                $pagina=1;
}else{
                $pagina=$_GET['pagina'];
}
$desde=($pagina-1)*$por_pagina;
$total_paginas= ceil($total_registros / $por_pagina);


$query=mysqli_query($mysqli,"SELECT * FROM libros
                                            WHERE  (    idLibro    LIKE   '%$busqueda%'  OR 
        isbn     LIKE   '%$busqueda%'  OR 
        titulo       LIKE   '%$busqueda%' OR
        autor       LIKE   '%$busqueda%' OR
        anioPublicacion      LIKE   '%$busqueda%' OR 
        numEjemplares      LIKE   '%$busqueda%' OR
        estado_libro      LIKE   '%$busqueda%' 
                                                        ) 
                                            ORDER BY idLibro ASC LIMIT $desde , $por_pagina");
mysqli_close($mysqli);
            $resultado=mysqli_num_rows($query);
            if($resultado>0){
                while ($data= mysqli_fetch_array($query)) {
                              ?>
                        <tbody>
                        <tr class="text-center"> 
                            <td><?php echo $data['idLibro']; ?></td>
                            <td><?php echo $data['isbn']; ?></td>
                            <td><?php echo $data['titulo']; ?></td>
                            <td><?php echo $data['autor']; ?></td>
                            <td><?php echo $data['anioPublicacion']; ?></td>
                            <td><?php echo $data['numEjemplares']; ?></td>
                            <?php 
                                if($data['numEjemplares']==0){
                                echo "<td style='color:red;'>No disponible</td>";
                                }else{
                                echo "<td style='color:green;'> Disponible</td>";
                                }

                            ?>
                            <td><?php if($data['archivo']!='../../file/pdf/'){ ?>
                                <a href="<?php echo $data['archivo'] ?>"><i class="fas fa-eye"></i></a>
                            <?php }else{ ?>
                                <i class="fas fa-eye-slash"></i>
                                <?php } ?>
                            </td>
                             <?php 
                    if ($_SESSION['rol'] <2) {
                        ?>
                            <td><a href="../CREATE/CrearPrestamoL.php?id=<?php echo $data['idLibro']; ?>">Prestar</a></td>
                             <?php } ?>
                        </tr>
             </tbody>
              <?php
                 }
            }
            ?>
             </table>
              
              </div>
              <div class="container-fluid paginador">
          <ul>
            <?php 
            if ($pagina !=1 AND $total_registros != 0) {
             ?>
            <li><a href="?pagina= <?php echo 1; ?>&busqueda=<?php echo $busqueda; ?> ">|<</a></li>
            <li><a href="?pagina= <?php echo $pagina-1; ?>&busqueda=<?php echo $busqueda; ?>"><<</a></li>
            <?php 
        }
            for ($i=1; $i <= $total_paginas; $i++) { 
                if ($i==$pagina) {
                     echo '<li class="pageSelected">'.$i.'</li>';
                }else{
                    echo '<li><a href="?pagina='.$i.'&busqueda='.$busqueda.'">'.$i.'</a></li>';
                }
                
            }
            if ($pagina!=$total_paginas AND $total_registros != 0) {
             ?>
            <li><a href="?pagina= <?php echo $pagina+1; ?>&busqueda=<?php echo $busqueda; ?>">>></a></li>
            <li><a href="?pagina= <?php echo $total_paginas; ?>&busqueda=<?php echo $busqueda; ?>">>|</a></li>
            <?php 
        }
             ?>
        </ul>
        </div>
       
               </section>
            </div>
        </section>
    </main>
            
    	
	<!--=============================================
	=            Include JavaScript files           =
	==============================================-->
    <?php include '../../INCLUDES/js2.php'; ?>

</body>
</html>