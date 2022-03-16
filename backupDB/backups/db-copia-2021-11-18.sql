

CREATE TABLE `administradores` (
  `idAdmin` int(8) NOT NULL AUTO_INCREMENT,
  `DUI` varchar(10) NOT NULL,
  `adminNombre` varchar(250) NOT NULL,
  `adminApellido` varchar(250) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaRegistro` date NOT NULL DEFAULT current_timestamp(),
  `usuario` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `rol` int(8) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  KEY `rol` (`rol`),
  CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO administradores VALUES("1","1","RobertoC","Orellana","Masculino","roberore99@gmail.com","2021-11-04","admin","12345","3");
INSERT INTO administradores VALUES("2","564545","Juan","Perez","Masculino","JuanPeres@gmail.com","2021-11-04","juan","123456","3");
INSERT INTO administradores VALUES("3","12345","Roberto","Orellana","Masculino","roberore99@gmail.com","2021-11-06","Roberto","12345","1");
INSERT INTO administradores VALUES("4","12412","Pedro","Castillo","Masculino","castillo@gmail.com","2021-11-06","Pedroadmin","12345","3");





CREATE TABLE `categorias` (
  `idCategoria` int(8) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(250) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias VALUES("1","Algoritmo","1");
INSERT INTO categorias VALUES("2","Programacion","1");
INSERT INTO categorias VALUES("3","Ejemplo de categoria","1");
INSERT INTO categorias VALUES("4","Cuento infantiles","1");





CREATE TABLE `editoriales` (
  `idEditorial` int(8) NOT NULL AUTO_INCREMENT,
  `editorial` varchar(250) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idEditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO editoriales VALUES("1","SERVITE","1");
INSERT INTO editoriales VALUES("2","Pruebas","1");
INSERT INTO editoriales VALUES("3","ejemplo editorial","1");
INSERT INTO editoriales VALUES("4","Ejemplo de Editorial","1");





CREATE TABLE `libros` (
  `idLibro` int(8) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) DEFAULT NULL,
  `titulo` varchar(250) NOT NULL,
  `autor` varchar(250) NOT NULL,
  `anioPublicacion` varchar(4) DEFAULT NULL,
  `numEjemplares` int(8) NOT NULL,
  `ubicacion` varchar(11) NOT NULL,
  `estado_libro` varchar(15) NOT NULL,
  `idCategoriaLibro` int(8) NOT NULL,
  `idEditorialLibro` int(8) NOT NULL,
  `idAdminLibro` int(8) NOT NULL,
  `archivo` text CHARACTER SET utf32 NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idLibro`),
  KEY `idCategoriaLibro` (`idCategoriaLibro`),
  KEY `idEditorialLibro` (`idEditorialLibro`),
  KEY `idAdminLibro` (`idAdminLibro`),
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`idEditorialLibro`) REFERENCES `editoriales` (`idEditorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libros_ibfk_3` FOREIGN KEY (`idCategoriaLibro`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO libros VALUES("1","7033","Informatica General","Nestor Fernandez","2006","5","a1","PDF","1","1","1","../../file/pdf/48_InformaticaGeneral.pdf","1");
INSERT INTO libros VALUES("2","7034","Introduccion a phyton","Gonzalo Pennino","2021","10","a1","Fisico","2","1","1","../../file/pdf/","1");
INSERT INTO libros VALUES("3","7075","El lenguaje PHP","Eugenia Bahit","2021","20","a1","PDF","2","1","1","../../file/pdf/El lenguaje PHP.pdf","1");
INSERT INTO libros VALUES("4","7076","Introduccion a JavaScript","Javier Eguíluz Pérez","2008","30","a1","PDF","2","1","1","../../file/pdf/introduccion_javascript.pdf","1");
INSERT INTO libros VALUES("5","7500","Hardware","aaron","2000","10","a1","Fisico","1","1","1","../../file/pdf/","1");
INSERT INTO libros VALUES("6","1231","Programacion l","Anonimo","1902","2","a1","Fisico-PDF","1","1","1","../../file/pdf/CUADRO DE VARIABLES. terminado.pdf","1");
INSERT INTO libros VALUES("7","123123","Algebra1","Baldor","1901","5","a1","Fisico-PDF","1","2","3","../../file/pdf/diccionario.pdf","1");





CREATE TABLE `prestamos` (
  `idPrestamo` int(8) NOT NULL AUTO_INCREMENT,
  `idLibroPrestamo` int(8) DEFAULT NULL,
  `idUsuarioPrestamo` int(8) DEFAULT NULL,
  `idAdminPrestamo` int(8) DEFAULT NULL,
  `fechaPrestamo` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaEntrega` datetime NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(100) NOT NULL,
  `estadoPrestamo` varchar(15) NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`idPrestamo`),
  KEY `idLibroPrestamo` (`idLibroPrestamo`),
  KEY `idUsuarioPrestamo` (`idUsuarioPrestamo`),
  KEY `idAdminPrestamo` (`idAdminPrestamo`),
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idLibroPrestamo`) REFERENCES `libros` (`idLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamos_ibfk_3` FOREIGN KEY (`idUsuarioPrestamo`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO prestamos VALUES("1","2","1","1","2021-11-02 10:51:02","2021-11-02 16:17:59","","DEVUELTO");
INSERT INTO prestamos VALUES("2","1","1","1","2021-11-04 16:10:26","2021-11-05 12:48:37"," nhgfdhn","DEVUELTO");
INSERT INTO prestamos VALUES("3","2","1","2","2021-11-05 12:49:04","2021-11-05 12:49:12"," Prestamo ejemplo","DEVUELTO");
INSERT INTO prestamos VALUES("4","1","1","1","2021-11-05 21:16:52","2021-11-05 22:19:25"," Prestamo de prueba","DEVUELTO");
INSERT INTO prestamos VALUES("5","3","2","1","2021-11-06 08:44:18","2021-11-06 08:45:11"," Ejemplo para observacion","DEVUELTO");
INSERT INTO prestamos VALUES("6","2","1","1","2021-11-06 08:46:04","2021-11-06 15:17:00"," ejemplo","DEVUELTO");
INSERT INTO prestamos VALUES("7","3","4","3","2021-11-06 15:08:23","0000-00-00 00:00:00"," Observacion ejemplo","PENDIENTE");





CREATE TABLE `rol` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO rol VALUES("1","Bibliotecario");
INSERT INTO rol VALUES("2","Director");
INSERT INTO rol VALUES("3","Docente");





CREATE TABLE `usuarios` (
  `idUsuario` int(8) NOT NULL AUTO_INCREMENT,
  `tipo_identificacion` varchar(15) NOT NULL,
  `carnet` varchar(6) NOT NULL,
  `nombreUs` varchar(250) NOT NULL,
  `apellidoUs` varchar(250) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `tipoUs` varchar(25) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios VALUES("1","Carnet","121057","Luis","Zavala","Masculino","Docente","1");
INSERT INTO usuarios VALUES("2","carnet","121057","Alexa","Rodriguez","Femenino","Estudiante","1");
INSERT INTO usuarios VALUES("3","DUI","12342","Angel","Torres","Masculino","Estudiante","1");
INSERT INTO usuarios VALUES("4","Carnet","13121","Jonathan","Arce","Masculino","Estudiante","1");



