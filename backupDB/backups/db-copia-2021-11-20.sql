

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO administradores VALUES("1","1","Roberto","Orellana","Masculino","roberore99@gmail.com","2021-11-04","admin","12341","1");
INSERT INTO administradores VALUES("2","2","Juan","Perez","Femenino","JuanPeres@gmail.com","2021-11-04","juan","1213","3");
INSERT INTO administradores VALUES("3","12345","Roberto","Orellana","Masculino","roberore99@gmail.com","2021-11-06","Roberto","12345","1");
INSERT INTO administradores VALUES("4","12412","Pedro","Castillo","Masculino","castillo@gmail.com","2021-11-06","Pedroadmin","12345","3");
INSERT INTO administradores VALUES("5","1231","Pedro","Orellana","Masculino","rober@gmail.com","2021-11-20","Pedro","123456","3");
INSERT INTO administradores VALUES("6","0983341","Angel","Torres","Masculino","torres@gmail.com","2021-11-20","Angel","123456","3");





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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

INSERT INTO libros VALUES("1","7033","Informatica General","Nestor Fernandez","2007","5","a1","Fisico","2","3","1","../../file/pdf/","1");
INSERT INTO libros VALUES("2","7034","Introduccion a phyton","Gonzalo Pennino","2021","10","a1","Fisico","2","1","1","../../file/pdf/","1");
INSERT INTO libros VALUES("3","7075","El lenguaje PHP","Eugenia Bahit","2021","20","a1","PDF","2","1","1","../../file/pdf/El lenguaje PHP.pdf","1");
INSERT INTO libros VALUES("4","7076","Introduccion a JavaScript","Javier Eguíluz Pérez","2008","30","a1","PDF","2","1","1","../../file/pdf/introduccion_javascript.pdf","1");
INSERT INTO libros VALUES("5","7500","Hardware","aaron","2000","10","a1","Fisico","1","1","1","../../file/pdf/","1");
INSERT INTO libros VALUES("6","1231","Programacion l","Anonimo","1902","2","a1","Fisico-PDF","1","1","1","../../file/pdf/CUADRO DE VARIABLES. terminado.pdf","1");
INSERT INTO libros VALUES("7","123123","Algebra1","Baldor","1901","5","a1","Fisico-PDF","1","2","3","../../file/pdf/diccionario.pdf","1");
INSERT INTO libros VALUES("8","12313","Oliver Twits","Anonimo","1231","4","E1/R2","Fisico","2","3","1","../../file/pdf/","1");
INSERT INTO libros VALUES("9","13123","Don Quijote de la Mancha","Miguel de Cerbantes","1918","2","Estante1/Repisa3","Fisico","3","2","1","../../file/pdf/","1");





CREATE TABLE `prestamos` (
  `idPrestamo` int(8) NOT NULL AUTO_INCREMENT,
  `idLibroPrestamo` int(8) DEFAULT NULL,
  `idUsuarioPrestamo` int(8) DEFAULT NULL,
  `idAdminPrestamo` int(8) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

INSERT INTO prestamos VALUES("18","3","4","1","2021-11-19 20:25:22","2021-11-20","2021-11-19 20:44:34"," prueba","DEVUELTO");
INSERT INTO prestamos VALUES("19","7","3","1","2021-11-19 20:26:24","2021-11-20","2021-11-19 20:44:38"," prueba","DEVUELTO");
INSERT INTO prestamos VALUES("20","7","4","1","2021-11-19 20:26:41","2021-11-20","2021-11-20 09:16:28"," prueba","DEVUELTO");
INSERT INTO prestamos VALUES("21","6","4","1","2021-11-19 20:27:01","2021-11-20","0000-00-00 00:00:00"," prueba","PENDIENTE");
INSERT INTO prestamos VALUES("22","5","3","1","2021-11-19 20:27:57","2021-11-20","0000-00-00 00:00:00","prueba","PENDIENTE");
INSERT INTO prestamos VALUES("23","7","3","1","2021-11-19 20:28:16","2021-11-27","0000-00-00 00:00:00"," prueba","PENDIENTE");
INSERT INTO prestamos VALUES("24","2","5","1","2021-11-20 13:31:57","2021-11-25","0000-00-00 00:00:00"," ejemplo","PENDIENTE");
INSERT INTO prestamos VALUES("25","9","6","1","2021-11-20 15:08:52","2021-11-27","2021-11-20 15:09:22"," prestamo de prueba","DEVUELTO");





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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios VALUES("1","Carnet","121057","Luis","Zavala","Masculino","Docente","1");
INSERT INTO usuarios VALUES("2","carnet","121057","Alexa","Rodriguez","Femenino","Estudiante","1");
INSERT INTO usuarios VALUES("3","DUI","12342","Angel","Torres","Masculino","Estudiante","1");
INSERT INTO usuarios VALUES("4","Carnet","13121","Jonathan","Arce","Masculino","Estudiante","1");
INSERT INTO usuarios VALUES("5","DUI","12131","Roberto","Orellana","Masculino","Otro","1");
INSERT INTO usuarios VALUES("6","DUI","123131","Josue","Arce","Masculino","Otro","1");



