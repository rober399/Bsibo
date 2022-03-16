

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

INSERT INTO administradores VALUES("1","1","Roberto","Orellana","Masculino","roberore99@gmail.com","2021-11-04","admin","12345","1");
INSERT INTO administradores VALUES("3","12345","Roberto","Orellana","Masculino","roberore@gmail.com","2021-11-06","Roberto","12345","1");
INSERT INTO administradores VALUES("6","0983341","Angel","Torres","Masculino","torres@gmail.com","2021-11-20","Angel","123456","3");
INSERT INTO administradores VALUES("7","2331","Carlos","Melendez","Masculino","melende@gmail.com","2021-11-25","carlos","1234","2");
INSERT INTO administradores VALUES("11","11","prueba","prueba","Masculino","robeeeerore99@gmail.com","2021-11-25","prueba","1231","2");
INSERT INTO administradores VALUES("12","102341-1","rober","orellana","Masculino","robearore99@gmail.com","2021-11-27","rober3","admin","2");





CREATE TABLE `categorias` (
  `idCategoria` int(8) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(250) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias VALUES("1","Algoritmo","1");
INSERT INTO categorias VALUES("2","Programacion","1");
INSERT INTO categorias VALUES("3","Ejemplo de categoria","1");
INSERT INTO categorias VALUES("4","Cuento infantiles","1");
INSERT INTO categorias VALUES("5","Ciencias Practicas","1");





CREATE TABLE `editoriales` (
  `idEditorial` int(8) NOT NULL AUTO_INCREMENT,
  `editorial` varchar(250) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idEditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO editoriales VALUES("1","SERVITE","1");
INSERT INTO editoriales VALUES("2","Pruebas","1");
INSERT INTO editoriales VALUES("3","ejemplo editorial","1");
INSERT INTO editoriales VALUES("4","Ejemplo de Editorial","1");
INSERT INTO editoriales VALUES("5","Editorial del Futuro","1");





CREATE TABLE `libros` (
  `idLibro` int(8) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) DEFAULT NULL,
  `titulo` varchar(250) NOT NULL,
  `autor` varchar(250) NOT NULL,
  `anioPublicacion` varchar(4) DEFAULT NULL,
  `numEjemplares` int(8) NOT NULL,
  `ubicacion` varchar(25) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

INSERT INTO libros VALUES("11","12313","matematica2","anonimo","1231","10","Estante1/Repisa2","Fisico-PDF","2","2","1","../../file/pdf/","1");
INSERT INTO libros VALUES("12","1231","Algebra","Baldor","1231","0","Estante3/Repisa2","Fisico-PDF","3","2","1","../../file/pdf/Variables-1.0.pdf","1");





CREATE TABLE `prestamos` (
  `idPrestamo` int(8) NOT NULL AUTO_INCREMENT,
  `idLibroPrestamo` int(8) DEFAULT NULL,
  `idUsuarioPrestamo` int(8) DEFAULT NULL,
  `idAdminPrestamo` int(8) DEFAULT NULL,
  `cantidadLibros` int(2) NOT NULL,
  `fechaPrestamo` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaLimite` date NOT NULL,
  `fechaEntrega` datetime NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(100) NOT NULL,
  `estadoPrestamo` varchar(15) NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`idPrestamo`),
  KEY `idLibroPrestamo` (`idLibroPrestamo`),
  KEY `idUsuarioPrestamo` (`idUsuarioPrestamo`),
  KEY `idAdminPrestamo` (`idAdminPrestamo`),
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`idLibroPrestamo`) REFERENCES `libros` (`idLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamos_ibfk_3` FOREIGN KEY (`idUsuarioPrestamo`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

INSERT INTO prestamos VALUES("57","11","2","1","5","2021-11-28 17:03:48","2021-11-30","2021-11-28 17:04:28"," ","DEVUELTO");
INSERT INTO prestamos VALUES("58","12","2","1","3","2021-11-28 17:09:36","2021-11-30","2021-11-28 17:12:27"," ","DEVUELTO");
INSERT INTO prestamos VALUES("59","12","3","1","3","2021-11-28 17:23:30","2021-11-30","2021-11-28 17:29:39"," ","DEVUELTO");
INSERT INTO prestamos VALUES("60","12","3","1","3","2021-11-28 17:44:40","2021-11-30","0000-00-00 00:00:00"," ","PENDIENTE");





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
  `carnet` varchar(13) NOT NULL,
  `nombreUs` varchar(250) NOT NULL,
  `apellidoUs` varchar(250) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `tipoUs` varchar(25) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios VALUES("1","Carnet","121057","Luis","Zavala","Masculino","Docente","1");
INSERT INTO usuarios VALUES("2","carnet","121057","Alexa","Rodriguez","Femenino","Estudiante","1");
INSERT INTO usuarios VALUES("3","DUI","12342","Angel","Torres","Masculino","Estudiante","1");
INSERT INTO usuarios VALUES("4","Carnet","13121","Jonathan","Arce","Masculino","Estudiante","1");
INSERT INTO usuarios VALUES("5","DUI","12131","Roberto","Orellana","Masculino","Otro","1");
INSERT INTO usuarios VALUES("6","DUI","123131","Josue","Arce","Masculino","Otro","1");
INSERT INTO usuarios VALUES("7","DUI","131341","roberto","melendez","Masculino","Estudiante","1");



