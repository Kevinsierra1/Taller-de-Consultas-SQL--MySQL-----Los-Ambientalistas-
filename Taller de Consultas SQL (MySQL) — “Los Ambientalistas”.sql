create database ambientalistas;

use ambientalistas;

-- ## tabla departamento ##
CREATE TABLE departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(45) NOT NULL,
    departamentos TEXT NOT NULL
) ENGINE=InnoDB;

-- ## tabla entidad ##
CREATE TABLE entidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
) ENGINE=InnoDB;

-- ## tabla parque_natural ##
CREATE TABLE parque_natural (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    dia_declarado DATE,
    superficie_total DECIMAL(10,2),
    entidad_id INT,
    departamento_id INT,
    FOREIGN KEY (entidad_id) REFERENCES entidad(id),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
) ENGINE=InnoDB;

-- ## tabla alojamiento ##
CREATE TABLE alojamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidad INT,
    categoria VARCHAR(45),
    precio_x_noche DECIMAL(10,2),
    parque_natural_id INT,
    FOREIGN KEY (parque_natural_id) REFERENCES parque_natural(id)
) ENGINE=InnoDB;

-- ## tabla personal_parque ##
CREATE TABLE personal_parque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(100),
    celular VARCHAR(20),
    telefono VARCHAR(20),
    sueldo DECIMAL(10,2),
    parque_natural_id INT,
    FOREIGN KEY (parque_natural_id) REFERENCES parque_natural(id)
) ENGINE=InnoDB;

-- ## tabla entrada ##
CREATE TABLE entrada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque_natural(id)
) ENGINE=InnoDB;

-- ## tabla personal_de_gestion ##
CREATE TABLE personal_de_gestion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_identificacion_de_entrada INT,
    personal_parque_id INT,
    entrada_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (entrada_id) REFERENCES entrada(id)
) ENGINE=InnoDB;

-- ## tabla visitante ##
CREATE TABLE visitante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(100),
    profesion VARCHAR(45),
    alojamiento_id INT,
    personal_de_gestion_id INT,
    FOREIGN KEY (alojamiento_id) REFERENCES alojamiento(id),
    FOREIGN KEY (personal_de_gestion_id) REFERENCES personal_de_gestion(id)
) ENGINE=InnoDB;

-- ## tabla vehiculo ##
CREATE TABLE vehiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(255),
    tipo VARCHAR(45)
) ENGINE=InnoDB;

-- ## tabla area2 ##
CREATE TABLE area2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    extension DECIMAL(10,2),
    parque_id INT,
    FOREIGN KEY (parque_id) REFERENCES parque_natural(id)
) ENGINE=InnoDB;

-- ## tabla personal_de_vigilancia ##
CREATE TABLE personal_de_vigilancia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personal_parque_id INT,
    area2_id INT,
    vehiculo_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (area2_id) REFERENCES area2(id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id)
) ENGINE=InnoDB;

-- ## tabla titulacion ##
CREATE TABLE titulacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    fecha DATE
) ENGINE=InnoDB;

-- ## tabla personal_investigador ##
CREATE TABLE personal_investigador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funciones VARCHAR(45),
    personal_parque_id INT,
    titulacion_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (titulacion_id) REFERENCES titulacion(id)
) ENGINE=InnoDB;

-- ## tabla proyectos_de_investigacion ##
CREATE TABLE proyectos_de_investigacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    presupuesto DECIMAL(10,2),
    periodo_de_realizacion DATE
) ENGINE=InnoDB;

-- ## tabla proyecto ##
CREATE TABLE proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto_de_investigacion INT,
    FOREIGN KEY (id_proyecto_de_investigacion) REFERENCES proyectos_de_investigacion(id)
) ENGINE=InnoDB;

-- ## tabla especie ##
CREATE TABLE especie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Vegetal','Animal','Mineral') NOT NULL,
    denominacion_cientifica VARCHAR(45),
    denominacion_vulgar VARCHAR(45),
    num_de_inventario INT,
    area2_id INT,
    personal_investigador_id INT,
    id_proyecto INT,
    FOREIGN KEY (area2_id) REFERENCES area2(id),
    FOREIGN KEY (personal_investigador_id) REFERENCES personal_investigador(id),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id)
) ENGINE=InnoDB;

-- ## tabla personal_de_conservacion ##
CREATE TABLE personal_de_conservacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    especialidad ENUM('Limpieza','Organizacion','Alimentacion') NOT NULL,
    personal_parque_id INT,
    area2_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (area2_id) REFERENCES area2(id)
) ENGINE=InnoDB;

-- INSERTS: departamento (50)
INSERT INTO departamento (region, departamentos) VALUES
('Caribe','Departamento 01'),
('Andina','Departamento 02'),
('Pacifica','Departamento 03'),
('Orinoquia','Departamento 04'),
('Amazonia','Departamento 05'),
('Caribe','Departamento 06'),
('Andina','Departamento 07'),
('Pacifica','Departamento 08'),
('Orinoquia','Departamento 09'),
('Amazonia','Departamento 10'),
('Caribe','Departamento 11'),
('Andina','Departamento 12'),
('Pacifica','Departamento 13'),
('Orinoquia','Departamento 14'),
('Amazonia','Departamento 15'),
('Caribe','Departamento 16'),
('Andina','Departamento 17'),
('Pacifica','Departamento 18'),
('Orinoquia','Departamento 19'),
('Amazonia','Departamento 20'),
('Caribe','Departamento 21'),
('Andina','Departamento 22'),
('Pacifica','Departamento 23'),
('Orinoquia','Departamento 24'),
('Amazonia','Departamento 25'),
('Caribe','Departamento 26'),
('Andina','Departamento 27'),
('Pacifica','Departamento 28'),
('Orinoquia','Departamento 29'),
('Amazonia','Departamento 30'),
('Caribe','Departamento 31'),
('Andina','Departamento 32'),
('Pacifica','Departamento 33'),
('Orinoquia','Departamento 34'),
('Amazonia','Departamento 35'),
('Caribe','Departamento 36'),
('Andina','Departamento 37'),
('Pacifica','Departamento 38'),
('Orinoquia','Departamento 39'),
('Amazonia','Departamento 40'),
('Caribe','Departamento 41'),
('Andina','Departamento 42'),
('Pacifica','Departamento 43'),
('Orinoquia','Departamento 44'),
('Amazonia','Departamento 45'),
('Caribe','Departamento 46'),
('Andina','Departamento 47'),
('Pacifica','Departamento 48'),
('Orinoquia','Departamento 49'),
('Amazonia','Departamento 50');

-- INSERTS: entidad (50)
INSERT INTO entidad (nombre, departamento_id) VALUES
('Entidad 01', 1),
('Entidad 02', 2),
('Entidad 03', 3),
('Entidad 04', 4),
('Entidad 05', 5),
('Entidad 06', 6),
('Entidad 07', 7),
('Entidad 08', 8),
('Entidad 09', 9),
('Entidad 10', 10),
('Entidad 11', 11),
('Entidad 12', 12),
('Entidad 13', 13),
('Entidad 14', 14),
('Entidad 15', 15),
('Entidad 16', 16),
('Entidad 17', 17),
('Entidad 18', 18),
('Entidad 19', 19),
('Entidad 20', 20),
('Entidad 21', 21),
('Entidad 22', 22),
('Entidad 23', 23),
('Entidad 24', 24),
('Entidad 25', 25),
('Entidad 26', 26),
('Entidad 27', 27),
('Entidad 28', 28),
('Entidad 29', 29),
('Entidad 30', 30),
('Entidad 31', 31),
('Entidad 32', 32),
('Entidad 33', 33),
('Entidad 34', 34),
('Entidad 35', 35),
('Entidad 36', 36),
('Entidad 37', 37),
('Entidad 38', 38),
('Entidad 39', 39),
('Entidad 40', 40),
('Entidad 41', 41),
('Entidad 42', 42),
('Entidad 43', 43),
('Entidad 44', 44),
('Entidad 45', 45),
('Entidad 46', 46),
('Entidad 47', 47),
('Entidad 48', 48),
('Entidad 49', 49),
('Entidad 50', 50);

-- INSERTS: parque_natural (50)
INSERT INTO parque_natural (nombre, dia_declarado, superficie_total, entidad_id, departamento_id) VALUES
('Parque Natural 01','2010-01-31', 105.00, 1, 1),
('Parque Natural 02','2010-03-02', 110.00, 2, 2),
('Parque Natural 03','2010-04-01', 115.00, 3, 3),
('Parque Natural 04','2010-05-01', 120.00, 4, 4),
('Parque Natural 05','2010-05-31', 125.00, 5, 5),
('Parque Natural 06','2010-06-30', 130.00, 6, 6),
('Parque Natural 07','2010-07-30', 135.00, 7, 7),
('Parque Natural 08','2010-08-29', 140.00, 8, 8),
('Parque Natural 09','2010-09-28', 145.00, 9, 9),
('Parque Natural 10','2010-10-28', 150.00, 10, 10),
('Parque Natural 11','2010-11-27', 155.00, 11, 11),
('Parque Natural 12','2010-12-27', 160.00, 12, 12),
('Parque Natural 13','2011-01-26', 165.00, 13, 13),
('Parque Natural 14','2011-02-25', 170.00, 14, 14),
('Parque Natural 15','2011-03-27', 175.00, 15, 15),
('Parque Natural 16','2011-04-26', 180.00, 16, 16),
('Parque Natural 17','2011-05-26', 185.00, 17, 17),
('Parque Natural 18','2011-06-25', 190.00, 18, 18),
('Parque Natural 19','2011-07-25', 195.00, 19, 19),
('Parque Natural 20','2011-08-24', 200.00, 20, 20),
('Parque Natural 21','2011-09-23', 205.00, 21, 21),
('Parque Natural 22','2011-10-23', 210.00, 22, 22),
('Parque Natural 23','2011-11-22', 215.00, 23, 23),
('Parque Natural 24','2011-12-22', 220.00, 24, 24),
('Parque Natural 25','2012-01-21', 225.00, 25, 25),
('Parque Natural 26','2012-02-20', 230.00, 26, 26),
('Parque Natural 27','2012-03-21', 235.00, 27, 27),
('Parque Natural 28','2012-04-20', 240.00, 28, 28),
('Parque Natural 29','2012-05-20', 245.00, 29, 29),
('Parque Natural 30','2012-06-19', 250.00, 30, 30),
('Parque Natural 31','2012-07-19', 255.00, 31, 31),
('Parque Natural 32','2012-08-18', 260.00, 32, 32),
('Parque Natural 33','2012-09-17', 265.00, 33, 33),
('Parque Natural 34','2012-10-17', 270.00, 34, 34),
('Parque Natural 35','2012-11-16', 275.00, 35, 35),
('Parque Natural 36','2012-12-16', 280.00, 36, 36),
('Parque Natural 37','2013-01-15', 285.00, 37, 37),
('Parque Natural 38','2013-02-14', 290.00, 38, 38),
('Parque Natural 39','2013-03-16', 295.00, 39, 39),
('Parque Natural 40','2013-04-15', 300.00, 40, 40),
('Parque Natural 41','2013-05-15', 305.00, 41, 41),
('Parque Natural 42','2013-06-14', 310.00, 42, 42),
('Parque Natural 43','2013-07-14', 315.00, 43, 43),
('Parque Natural 44','2013-08-13', 320.00, 44, 44),
('Parque Natural 45','2013-09-12', 325.00, 45, 45),
('Parque Natural 46','2013-10-12', 330.00, 46, 46),
('Parque Natural 47','2013-11-11', 335.00, 47, 47),
('Parque Natural 48','2013-12-11', 340.00, 48, 48),
('Parque Natural 49','2014-01-10', 345.00, 49, 49),
('Parque Natural 50','2014-02-09', 350.00, 50, 50);

-- INSERTS: area2 (50)
INSERT INTO area2 (nombre, extension, parque_id) VALUES
('Área 01', 10.50, 1),
('Área 02', 11.00, 2),
('Área 03', 11.50, 3),
('Área 04', 12.00, 4),
('Área 05', 12.50, 5),
('Área 06', 13.00, 6),
('Área 07', 13.50, 7),
('Área 08', 14.00, 8),
('Área 09', 14.50, 9),
('Área 10', 15.00, 10),
('Área 11', 15.50, 11),
('Área 12', 16.00, 12),
('Área 13', 16.50, 13),
('Área 14', 17.00, 14),
('Área 15', 17.50, 15),
('Área 16', 18.00, 16),
('Área 17', 18.50, 17),
('Área 18', 19.00, 18),
('Área 19', 19.50, 19),
('Área 20', 20.00, 20),
('Área 21', 20.50, 21),
('Área 22', 21.00, 22),
('Área 23', 21.50, 23),
('Área 24', 22.00, 24),
('Área 25', 22.50, 25),
('Área 26', 23.00, 26),
('Área 27', 23.50, 27),
('Área 28', 24.00, 28),
('Área 29', 24.50, 29),
('Área 30', 25.00, 30),
('Área 31', 25.50, 31),
('Área 32', 26.00, 32),
('Área 33', 26.50, 33),
('Área 34', 27.00, 34),
('Área 35', 27.50, 35),
('Área 36', 28.00, 36),
('Área 37', 28.50, 37),
('Área 38', 29.00, 38),
('Área 39', 29.50, 39),
('Área 40', 30.00, 40),
('Área 41', 30.50, 41),
('Área 42', 31.00, 42),
('Área 43', 31.50, 43),
('Área 44', 32.00, 44),
('Área 45', 32.50, 45),
('Área 46', 33.00, 46),
('Área 47', 33.50, 47),
('Área 48', 34.00, 48),
('Área 49', 34.50, 49),
('Área 50', 35.00, 50);

-- INSERTS: alojamiento (50)
INSERT INTO alojamiento (capacidad, categoria, precio_x_noche, parque_natural_id) VALUES
(3, 'Camping', 85.00, 1),
(4, 'Glamping', 90.00, 2),
(5, 'Hostel', 95.00, 3),
(6, 'Hotel', 100.00, 4),
(7, 'Cabaña', 105.00, 5),
(2, 'Camping', 110.00, 6),
(3, 'Glamping', 115.00, 7),
(4, 'Hostel', 120.00, 8),
(5, 'Hotel', 125.00, 9),
(6, 'Cabaña', 130.00, 10),
(7, 'Camping', 135.00, 11),
(2, 'Glamping', 140.00, 12),
(3, 'Hostel', 145.00, 13),
(4, 'Hotel', 150.00, 14),
(5, 'Cabaña', 155.00, 15),
(6, 'Camping', 160.00, 16),
(7, 'Glamping', 165.00, 17),
(2, 'Hostel', 170.00, 18),
(3, 'Hotel', 175.00, 19),
(4, 'Cabaña', 80.00, 20),
(5, 'Camping', 85.00, 21),
(6, 'Glamping', 90.00, 22),
(7, 'Hostel', 95.00, 23),
(2, 'Hotel', 100.00, 24),
(3, 'Cabaña', 105.00, 25),
(4, 'Camping', 110.00, 26),
(5, 'Glamping', 115.00, 27),
(6, 'Hostel', 120.00, 28),
(7, 'Hotel', 125.00, 29),
(2, 'Cabaña', 130.00, 30),
(3, 'Camping', 135.00, 31),
(4, 'Glamping', 140.00, 32),
(5, 'Hostel', 145.00, 33),
(6, 'Hotel', 150.00, 34),
(7, 'Cabaña', 155.00, 35),
(2, 'Camping', 160.00, 36),
(3, 'Glamping', 165.00, 37),
(4, 'Hostel', 170.00, 38),
(5, 'Hotel', 175.00, 39),
(6, 'Cabaña', 80.00, 40),
(7, 'Camping', 85.00, 41),
(2, 'Glamping', 90.00, 42),
(3, 'Hostel', 95.00, 43),
(4, 'Hotel', 100.00, 44),
(5, 'Cabaña', 105.00, 45),
(6, 'Camping', 110.00, 46),
(7, 'Glamping', 115.00, 47),
(2, 'Hostel', 120.00, 48),
(3, 'Hotel', 125.00, 49),
(4, 'Cabaña', 130.00, 50);

-- INSERTS: entrada (50)
INSERT INTO entrada (nombre, ubicacion, id_parque) VALUES
('Entrada 01', 'Sector 1', 1),
('Entrada 02', 'Sector 2', 2),
('Entrada 03', 'Sector 3', 3),
('Entrada 04', 'Sector 4', 4),
('Entrada 05', 'Sector 5', 5),
('Entrada 06', 'Sector 6', 6),
('Entrada 07', 'Sector 7', 7),
('Entrada 08', 'Sector 8', 8),
('Entrada 09', 'Sector 9', 9),
('Entrada 10', 'Sector 10', 10),
('Entrada 11', 'Sector 1', 11),
('Entrada 12', 'Sector 2', 12),
('Entrada 13', 'Sector 3', 13),
('Entrada 14', 'Sector 4', 14),
('Entrada 15', 'Sector 5', 15),
('Entrada 16', 'Sector 6', 16),
('Entrada 17', 'Sector 7', 17),
('Entrada 18', 'Sector 8', 18),
('Entrada 19', 'Sector 9', 19),
('Entrada 20', 'Sector 10', 20),
('Entrada 21', 'Sector 1', 21),
('Entrada 22', 'Sector 2', 22),
('Entrada 23', 'Sector 3', 23),
('Entrada 24', 'Sector 4', 24),
('Entrada 25', 'Sector 5', 25),
('Entrada 26', 'Sector 6', 26),
('Entrada 27', 'Sector 7', 27),
('Entrada 28', 'Sector 8', 28),
('Entrada 29', 'Sector 9', 29),
('Entrada 30', 'Sector 10', 30),
('Entrada 31', 'Sector 1', 31),
('Entrada 32', 'Sector 2', 32),
('Entrada 33', 'Sector 3', 33),
('Entrada 34', 'Sector 4', 34),
('Entrada 35', 'Sector 5', 35),
('Entrada 36', 'Sector 6', 36),
('Entrada 37', 'Sector 7', 37),
('Entrada 38', 'Sector 8', 38),
('Entrada 39', 'Sector 9', 39),
('Entrada 40', 'Sector 10', 40),
('Entrada 41', 'Sector 1', 41),
('Entrada 42', 'Sector 2', 42),
('Entrada 43', 'Sector 3', 43),
('Entrada 44', 'Sector 4', 44),
('Entrada 45', 'Sector 5', 45),
('Entrada 46', 'Sector 6', 46),
('Entrada 47', 'Sector 7', 47),
('Entrada 48', 'Sector 8', 48),
('Entrada 49', 'Sector 9', 49),
('Entrada 50', 'Sector 10', 50);

-- INSERTS: vehiculo (50)
INSERT INTO vehiculo (marca, tipo) VALUES
('Nissan','Pickup'),
('Chevrolet','Sedan'),
('Ford','4x4'),
('Renault','Moto'),
('Hyundai','Camioneta'),
('Kia','Pickup'),
('Mazda','Sedan'),
('Toyota','4x4'),
('Nissan','Moto'),
('Chevrolet','Camioneta'),
('Ford','Pickup'),
('Renault','Sedan'),
('Hyundai','4x4'),
('Kia','Moto'),
('Mazda','Camioneta'),
('Toyota','Pickup'),
('Nissan','Sedan'),
('Chevrolet','4x4'),
('Ford','Moto'),
('Renault','Camioneta'),
('Hyundai','Pickup'),
('Kia','Sedan'),
('Mazda','4x4'),
('Toyota','Moto'),
('Nissan','Camioneta'),
('Chevrolet','Pickup'),
('Ford','Sedan'),
('Renault','4x4'),
('Hyundai','Moto'),
('Kia','Camioneta'),
('Mazda','Pickup'),
('Toyota','Sedan'),
('Nissan','4x4'),
('Chevrolet','Moto'),
('Ford','Camioneta'),
('Renault','Pickup'),
('Hyundai','Sedan'),
('Kia','4x4'),
('Mazda','Moto'),
('Toyota','Camioneta'),
('Nissan','Pickup'),
('Chevrolet','Sedan'),
('Ford','4x4'),
('Renault','Moto'),
('Hyundai','Camioneta'),
('Kia','Pickup'),
('Mazda','Sedan'),
('Toyota','4x4'),
('Nissan','Moto'),
('Chevrolet','Camioneta');

-- INSERTS: personal_parque (50)
INSERT INTO personal_parque (cedula, nombre, direccion, celular, telefono, sueldo, parque_natural_id) VALUES
(10000001,'Empleado 01','Calle 1 # 2-2','3000000001','6070000001',1600000,1),
(10000002,'Empleado 02','Calle 2 # 3-3','3000000002','6070000002',1700000,2),
(10000003,'Empleado 03','Calle 3 # 4-4','3000000003','6070000003',1800000,3),
(10000004,'Empleado 04','Calle 4 # 5-5','3000000004','6070000004',1900000,4),
(10000005,'Empleado 05','Calle 5 # 6-6','3000000005','6070000005',2000000,5),
(10000006,'Empleado 06','Calle 6 # 7-7','3000000006','6070000006',2100000,6),
(10000007,'Empleado 07','Calle 7 # 8-8','3000000007','6070000007',2200000,7),
(10000008,'Empleado 08','Calle 8 # 9-9','3000000008','6070000008',2300000,8),
(10000009,'Empleado 09','Calle 9 # 10-10','3000000009','6070000009',2400000,9),
(10000010,'Empleado 10','Calle 10 # 11-11','3000000010','6070000010',1500000,10),
(10000011,'Empleado 11','Calle 11 # 12-12','3000000011','6070000011',1600000,11),
(10000012,'Empleado 12','Calle 12 # 13-13','3000000012','6070000012',1700000,12),
(10000013,'Empleado 13','Calle 13 # 14-14','3000000013','6070000013',1800000,13),
(10000014,'Empleado 14','Calle 14 # 15-15','3000000014','6070000014',1900000,14),
(10000015,'Empleado 15','Calle 15 # 16-16','3000000015','6070000015',2000000,15),
(10000016,'Empleado 16','Calle 16 # 17-17','3000000016','6070000016',2100000,16),
(10000017,'Empleado 17','Calle 17 # 18-18','3000000017','6070000017',2200000,17),
(10000018,'Empleado 18','Calle 18 # 19-19','3000000018','6070000018',2300000,18),
(10000019,'Empleado 19','Calle 19 # 20-20','3000000019','6070000019',2400000,19),
(10000020,'Empleado 20','Calle 20 # 1-21','3000000020','6070000020',1500000,20),
(10000021,'Empleado 21','Calle 21 # 2-22','3000000021','6070000021',1600000,21),
(10000022,'Empleado 22','Calle 22 # 3-23','3000000022','6070000022',1700000,22),
(10000023,'Empleado 23','Calle 23 # 4-24','3000000023','6070000023',1800000,23),
(10000024,'Empleado 24','Calle 24 # 5-25','3000000024','6070000024',1900000,24),
(10000025,'Empleado 25','Calle 25 # 6-26','3000000025','6070000025',2000000,25),
(10000026,'Empleado 26','Calle 26 # 7-27','3000000026','6070000026',2100000,26),
(10000027,'Empleado 27','Calle 27 # 8-28','3000000027','6070000027',2200000,27),
(10000028,'Empleado 28','Calle 28 # 9-29','3000000028','6070000028',2300000,28),
(10000029,'Empleado 29','Calle 29 # 10-30','3000000029','6070000029',2400000,29),
(10000030,'Empleado 30','Calle 30 # 11-31','3000000030','6070000030',1500000,30),
(10000031,'Empleado 31','Calle 31 # 12-32','3000000031','6070000031',1600000,31),
(10000032,'Empleado 32','Calle 32 # 13-33','3000000032','6070000032',1700000,32),
(10000033,'Empleado 33','Calle 33 # 14-34','3000000033','6070000033',1800000,33),
(10000034,'Empleado 34','Calle 34 # 15-35','3000000034','6070000034',1900000,34),
(10000035,'Empleado 35','Calle 35 # 16-36','3000000035','6070000035',2000000,35),
(10000036,'Empleado 36','Calle 36 # 17-37','3000000036','6070000036',2100000,36),
(10000037,'Empleado 37','Calle 37 # 18-38','3000000037','6070000037',2200000,37),
(10000038,'Empleado 38','Calle 38 # 19-39','3000000038','6070000038',2300000,38),
(10000039,'Empleado 39','Calle 39 # 20-40','3000000039','6070000039',2400000,39),
(10000040,'Empleado 40','Calle 40 # 1-41','3000000040','6070000040',1500000,40),
(10000041,'Empleado 41','Calle 41 # 2-42','3000000041','6070000041',1600000,41),
(10000042,'Empleado 42','Calle 42 # 3-43','3000000042','6070000042',1700000,42),
(10000043,'Empleado 43','Calle 43 # 4-44','3000000043','6070000043',1800000,43),
(10000044,'Empleado 44','Calle 44 # 5-45','3000000044','6070000044',1900000,44),
(10000045,'Empleado 45','Calle 45 # 6-46','3000000045','6070000045',2000000,45),
(10000046,'Empleado 46','Calle 46 # 7-47','3000000046','6070000046',2100000,46),
(10000047,'Empleado 47','Calle 47 # 8-48','3000000047','6070000047',2200000,47),
(10000048,'Empleado 48','Calle 48 # 9-49','3000000048','6070000048',2300000,48),
(10000049,'Empleado 49','Calle 49 # 10-50','3000000049','6070000049',2400000,49),
(10000050,'Empleado 50','Calle 50 # 11-1','3000000050','6070000050',1500000,50);

-- INSERTS: personal_de_gestion (50)
INSERT INTO personal_de_gestion (num_identificacion_de_entrada, personal_parque_id, entrada_id) VALUES
(5001,1,1),
(5002,2,2),
(5003,3,3),
(5004,4,4),
(5005,5,5),
(5006,6,6),
(5007,7,7),
(5008,8,8),
(5009,9,9),
(5010,10,10),
(5011,11,11),
(5012,12,12),
(5013,13,13),
(5014,14,14),
(5015,15,15),
(5016,16,16),
(5017,17,17),
(5018,18,18),
(5019,19,19),
(5020,20,20),
(5021,21,21),
(5022,22,22),
(5023,23,23),
(5024,24,24),
(5025,25,25),
(5026,26,26),
(5027,27,27),
(5028,28,28),
(5029,29,29),
(5030,30,30),
(5031,31,31),
(5032,32,32),
(5033,33,33),
(5034,34,34),
(5035,35,35),
(5036,36,36),
(5037,37,37),
(5038,38,38),
(5039,39,39),
(5040,40,40),
(5041,41,41),
(5042,42,42),
(5043,43,43),
(5044,44,44),
(5045,45,45),
(5046,46,46),
(5047,47,47),
(5048,48,48),
(5049,49,49),
(5050,50,50);

-- INSERTS: titulacion (50)
INSERT INTO titulacion (titulo, fecha) VALUES
('Ecólogo','2010-04-11'),
('Zootecnista','2010-07-20'),
('Ingeniero Forestal','2010-10-28'),
('Geógrafo','2011-02-05'),
('Ambientalista','2011-05-16'),
('Biólogo','2011-08-24'),
('Ecólogo','2011-12-02'),
('Zootecnista','2012-03-11'),
('Ingeniero Forestal','2012-06-19'),
('Geógrafo','2012-09-27'),
('Ambientalista','2013-01-05'),
('Biólogo','2013-04-15'),
('Ecólogo','2013-07-24'),
('Zootecnista','2013-11-01'),
('Ingeniero Forestal','2014-02-09'),
('Geógrafo','2014-05-20'),
('Ambientalista','2014-08-28'),
('Biólogo','2014-12-06'),
('Ecólogo','2015-03-16'),
('Zootecnista','2015-06-24'),
('Ingeniero Forestal','2015-10-02'),
('Geógrafo','2016-01-10'),
('Ambientalista','2016-04-19'),
('Biólogo','2016-07-28'),
('Ecólogo','2016-11-05'),
('Zootecnista','2017-02-13'),
('Ingeniero Forestal','2017-05-24'),
('Geógrafo','2017-09-01'),
('Ambientalista','2017-12-10'),
('Biólogo','2018-03-20'),
('Ecólogo','2018-06-28'),
('Zootecnista','2018-10-06'),
('Ingeniero Forestal','2019-01-14'),
('Geógrafo','2019-04-24'),
('Ambientalista','2019-08-02'),
('Biólogo','2019-11-10'),
('Ecólogo','2020-02-18'),
('Zootecnista','2020-05-28'),
('Ingeniero Forestal','2020-09-05'),
('Geógrafo','2020-12-14'),
('Ambientalista','2021-03-24'),
('Biólogo','2021-07-02'),
('Ecólogo','2021-10-10'),
('Zootecnista','2022-01-18'),
('Ingeniero Forestal','2022-04-28'),
('Geógrafo','2022-08-06'),
('Ambientalista','2022-11-14'),
('Biólogo','2023-02-22'),
('Ecólogo','2023-06-02'),
('Zootecnista','2023-09-10');

-- INSERTS: personal_investigador (50)
INSERT INTO personal_investigador (funciones, personal_parque_id, titulacion_id) VALUES
('Muestreo', 1, 1),
('Anillado', 2, 2),
('Cartografía', 3, 3),
('Fototrampeo', 4, 4),
('Monitoreo', 5, 5),
('Muestreo', 6, 6),
('Anillado', 7, 7),
('Cartografía', 8, 8),
('Fototrampeo', 9, 9),
('Monitoreo', 10, 10),
('Muestreo', 11, 11),
('Anillado', 12, 12),
('Cartografía', 13, 13),
('Fototrampeo', 14, 14),
('Monitoreo', 15, 15),
('Muestreo', 16, 16),
('Anillado', 17, 17),
('Cartografía', 18, 18),
('Fototrampeo', 19, 19),
('Monitoreo', 20, 20),
('Muestreo', 21, 21),
('Anillado', 22, 22),
('Cartografía', 23, 23),
('Fototrampeo', 24, 24),
('Monitoreo', 25, 25),
('Muestreo', 26, 26),
('Anillado', 27, 27),
('Cartografía', 28, 28),
('Fototrampeo', 29, 29),
('Monitoreo', 30, 30),
('Muestreo', 31, 31),
('Anillado', 32, 32),
('Cartografía', 33, 33),
('Fototrampeo', 34, 34),
('Monitoreo', 35, 35),
('Muestreo', 36, 36),
('Anillado', 37, 37),
('Cartografía', 38, 38),
('Fototrampeo', 39, 39),
('Monitoreo', 40, 40),
('Muestreo', 41, 41),
('Anillado', 42, 42),
('Cartografía', 43, 43),
('Fototrampeo', 44, 44),
('Monitoreo', 45, 45),
('Muestreo', 46, 46),
('Anillado', 47, 47),
('Cartografía', 48, 48),
('Fototrampeo', 49, 49),
('Monitoreo', 50, 50);

-- INSERTS: proyectos_de_investigacion (50)
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion) VALUES
(5250000, '2010-03-02'),
(5500000, '2010-05-01'),
(5750000, '2010-06-30'),
(6000000, '2010-08-29'),
(6250000, '2010-10-28'),
(6500000, '2010-12-27'),
(6750000, '2011-02-25'),
(7000000, '2011-04-26'),
(7250000, '2011-06-25'),
(7500000, '2011-08-24'),
(7750000, '2011-10-23'),
(8000000, '2011-12-22'),
(8250000, '2012-02-20'),
(8500000, '2012-04-20'),
(8750000, '2012-06-19'),
(9000000, '2012-08-18'),
(9250000, '2012-10-17'),
(9500000, '2012-12-16'),
(9750000, '2013-02-14'),
(10000000, '2013-04-15'),
(10250000, '2013-06-14'),
(10500000, '2013-08-13'),
(10750000, '2013-10-12'),
(11000000, '2013-12-11'),
(11250000, '2014-02-09'),
(11500000, '2014-04-10'),
(11750000, '2014-06-09'),
(12000000, '2014-08-08'),
(12250000, '2014-10-07'),
(12500000, '2014-12-06'),
(12750000, '2015-02-04'),
(13000000, '2015-04-05'),
(13250000, '2015-06-04'),
(13500000, '2015-08-03'),
(13750000, '2015-10-02'),
(14000000, '2015-12-01'),
(14250000, '2016-01-30'),
(14500000, '2016-03-30'),
(14750000, '2016-05-29'),
(15000000, '2016-07-28'),
(15250000, '2016-09-26'),
(15500000, '2016-11-25'),
(15750000, '2017-01-24'),
(16000000, '2017-03-25'),
(16250000, '2017-05-24'),
(16500000, '2017-07-23'),
(16750000, '2017-09-21'),
(17000000, '2017-11-20'),
(17250000, '2018-01-19'),
(17500000, '2018-03-20');

-- INSERTS: proyecto (50)
INSERT INTO proyecto (id_proyecto_de_investigacion) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);

-- INSERTS: especie (50)
INSERT INTO especie (tipo, denominacion_cientifica, denominacion_vulgar, num_de_inventario, area2_id, personal_investigador_id, id_proyecto) VALUES
('Animal','Spec_01_scientificus','Especie 01',1001,1,1,1),
('Mineral','Spec_02_scientificus','Especie 02',1002,2,2,2),
('Vegetal','Spec_03_scientificus','Especie 03',1003,3,3,3),
('Animal','Spec_04_scientificus','Especie 04',1004,4,4,4),
('Mineral','Spec_05_scientificus','Especie 05',1005,5,5,5),
('Vegetal','Spec_06_scientificus','Especie 06',1006,6,6,6),
('Animal','Spec_07_scientificus','Especie 07',1007,7,7,7),
('Mineral','Spec_08_scientificus','Especie 08',1008,8,8,8),
('Vegetal','Spec_09_scientificus','Especie 09',1009,9,9,9),
('Animal','Spec_10_scientificus','Especie 10',1010,10,10,10),
('Mineral','Spec_11_scientificus','Especie 11',1011,11,11,11),
('Vegetal','Spec_12_scientificus','Especie 12',1012,12,12,12),
('Animal','Spec_13_scientificus','Especie 13',1013,13,13,13),
('Mineral','Spec_14_scientificus','Especie 14',1014,14,14,14),
('Vegetal','Spec_15_scientificus','Especie 15',1015,15,15,15),
('Animal','Spec_16_scientificus','Especie 16',1016,16,16,16),
('Mineral','Spec_17_scientificus','Especie 17',1017,17,17,17),
('Vegetal','Spec_18_scientificus','Especie 18',1018,18,18,18),
('Animal','Spec_19_scientificus','Especie 19',1019,19,19,19),
('Mineral','Spec_20_scientificus','Especie 20',1020,20,20,20),
('Vegetal','Spec_21_scientificus','Especie 21',1021,21,21,21),
('Animal','Spec_22_scientificus','Especie 22',1022,22,22,22),
('Mineral','Spec_23_scientificus','Especie 23',1023,23,23,23),
('Vegetal','Spec_24_scientificus','Especie 24',1024,24,24,24),
('Animal','Spec_25_scientificus','Especie 25',1025,25,25,25),
('Mineral','Spec_26_scientificus','Especie 26',1026,26,26,26),
('Vegetal','Spec_27_scientificus','Especie 27',1027,27,27,27),
('Animal','Spec_28_scientificus','Especie 28',1028,28,28,28),
('Mineral','Spec_29_scientificus','Especie 29',1029,29,29,29),
('Vegetal','Spec_30_scientificus','Especie 30',1030,30,30,30),
('Animal','Spec_31_scientificus','Especie 31',1031,31,31,31),
('Mineral','Spec_32_scientificus','Especie 32',1032,32,32,32),
('Vegetal','Spec_33_scientificus','Especie 33',1033,33,33,33),
('Animal','Spec_34_scientificus','Especie 34',1034,34,34,34),
('Mineral','Spec_35_scientificus','Especie 35',1035,35,35,35),
('Vegetal','Spec_36_scientificus','Especie 36',1036,36,36,36),
('Animal','Spec_37_scientificus','Especie 37',1037,37,37,37),
('Mineral','Spec_38_scientificus','Especie 38',1038,38,38,38),
('Vegetal','Spec_39_scientificus','Especie 39',1039,39,39,39),
('Animal','Spec_40_scientificus','Especie 40',1040,40,40,40),
('Mineral','Spec_41_scientificus','Especie 41',1041,41,41,41),
('Vegetal','Spec_42_scientificus','Especie 42',1042,42,42,42),
('Animal','Spec_43_scientificus','Especie 43',1043,43,43,43),
('Mineral','Spec_44_scientificus','Especie 44',1044,44,44,44),
('Vegetal','Spec_45_scientificus','Especie 45',1045,45,45,45),
('Animal','Spec_46_scientificus','Especie 46',1046,46,46,46),
('Mineral','Spec_47_scientificus','Especie 47',1047,47,47,47),
('Vegetal','Spec_48_scientificus','Especie 48',1048,48,48,48),
('Animal','Spec_49_scientificus','Especie 49',1049,49,49,49),
('Mineral','Spec_50_scientificus','Especie 50',1050,50,50,50);

-- INSERTS: personal_de_vigilancia (50)
INSERT INTO personal_de_vigilancia (personal_parque_id, area2_id, vehiculo_id) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10),
(11,11,11),
(12,12,12),
(13,13,13),
(14,14,14),
(15,15,15),
(16,16,16),
(17,17,17),
(18,18,18),
(19,19,19),
(20,20,20),
(21,21,21),
(22,22,22),
(23,23,23),
(24,24,24),
(25,25,25),
(26,26,26),
(27,27,27),
(28,28,28),
(29,29,29),
(30,30,30),
(31,31,31),
(32,32,32),
(33,33,33),
(34,34,34),
(35,35,35),
(36,36,36),
(37,37,37),
(38,38,38),
(39,39,39),
(40,40,40),
(41,41,41),
(42,42,42),
(43,43,43),
(44,44,44),
(45,45,45),
(46,46,46),
(47,47,47),
(48,48,48),
(49,49,49),
(50,50,50);

-- INSERTS: personal_de_conservacion (50)
INSERT INTO personal_de_conservacion (especialidad, personal_parque_id, area2_id) VALUES
('Organizacion',1,1),
('Alimentacion',2,2),
('Limpieza',3,3),
('Organizacion',4,4),
('Alimentacion',5,5),
('Limpieza',6,6),
('Organizacion',7,7),
('Alimentacion',8,8),
('Limpieza',9,9),
('Organizacion',10,10),
('Alimentacion',11,11),
('Limpieza',12,12),
('Organizacion',13,13),
('Alimentacion',14,14),
('Limpieza',15,15),
('Organizacion',16,16),
('Alimentacion',17,17),
('Limpieza',18,18),
('Organizacion',19,19),
('Alimentacion',20,20),
('Limpieza',21,21),
('Organizacion',22,22),
('Alimentacion',23,23),
('Limpieza',24,24),
('Organizacion',25,25),
('Alimentacion',26,26),
('Limpieza',27,27),
('Organizacion',28,28),
('Alimentacion',29,29),
('Limpieza',30,30),
('Organizacion',31,31),
('Alimentacion',32,32),
('Limpieza',33,33),
('Organizacion',34,34),
('Alimentacion',35,35),
('Limpieza',36,36),
('Organizacion',37,37),
('Alimentacion',38,38),
('Limpieza',39,39),
('Organizacion',40,40),
('Alimentacion',41,41),
('Limpieza',42,42),
('Organizacion',43,43),
('Alimentacion',44,44),
('Limpieza',45,45),
('Organizacion',46,46),
('Alimentacion',47,47),
('Limpieza',48,48),
('Organizacion',49,49),
('Alimentacion',50,50);

-- INSERTS: visitante (50)
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) VALUES
(90000001,'Visitante 01','Carrera 1 #2-2','Ingeniero',1,1),
(90000002,'Visitante 02','Carrera 2 #3-3','Abogado',2,2),
(90000003,'Visitante 03','Carrera 3 #4-4','Médico',3,3),
(90000004,'Visitante 04','Carrera 4 #5-5','Estudiante',4,4),
(90000005,'Visitante 05','Carrera 5 #6-6','Diseñador',5,5),
(90000006,'Visitante 06','Carrera 6 #7-7','Administrador',6,6),
(90000007,'Visitante 07','Carrera 7 #8-8','Turista',7,7),
(90000008,'Visitante 08','Carrera 8 #9-9','Docente',8,8),
(90000009,'Visitante 09','Carrera 9 #10-10','Ingeniero',9,9),
(90000010,'Visitante 10','Carrera 10 #11-11','Abogado',10,10),
(90000011,'Visitante 11','Carrera 11 #12-12','Médico',11,11),
(90000012,'Visitante 12','Carrera 12 #13-13','Estudiante',12,12),
(90000013,'Visitante 13','Carrera 13 #14-14','Diseñador',13,13),
(90000014,'Visitante 14','Carrera 14 #15-15','Administrador',14,14),
(90000015,'Visitante 15','Carrera 15 #16-16','Turista',15,15),
(90000016,'Visitante 16','Carrera 16 #17-17','Docente',16,16),
(90000017,'Visitante 17','Carrera 17 #18-18','Ingeniero',17,17),
(90000018,'Visitante 18','Carrera 18 #19-19','Abogado',18,18),
(90000019,'Visitante 19','Carrera 19 #20-20','Médico',19,19),
(90000020,'Visitante 20','Carrera 20 #21-21','Estudiante',20,20),
(90000021,'Visitante 21','Carrera 21 #22-22','Diseñador',21,21),
(90000022,'Visitante 22','Carrera 22 #23-23','Administrador',22,22),
(90000023,'Visitante 23','Carrera 23 #24-24','Turista',23,23),
(90000024,'Visitante 24','Carrera 24 #25-25','Docente',24,24),
(90000025,'Visitante 25','Carrera 25 #26-26','Ingeniero',25,25),
(90000026,'Visitante 26','Carrera 26 #27-27','Abogado',26,26),
(90000027,'Visitante 27','Carrera 27 #28-28','Médico',27,27),
(90000028,'Visitante 28','Carrera 28 #29-29','Estudiante',28,28),
(90000029,'Visitante 29','Carrera 29 #30-30','Diseñador',29,29),
(90000030,'Visitante 30','Carrera 30 #1-31','Administrador',30,30),
(90000031,'Visitante 31','Carrera 31 #2-32','Turista',31,31),
(90000032,'Visitante 32','Carrera 32 #3-33','Docente',32,32),
(90000033,'Visitante 33','Carrera 33 #4-34','Ingeniero',33,33),
(90000034,'Visitante 34','Carrera 34 #5-35','Abogado',34,34),
(90000035,'Visitante 35','Carrera 35 #6-36','Médico',35,35),
(90000036,'Visitante 36','Carrera 36 #7-37','Estudiante',36,36),
(90000037,'Visitante 37','Carrera 37 #8-38','Diseñador',37,37),
(90000038,'Visitante 38','Carrera 38 #9-39','Administrador',38,38),
(90000039,'Visitante 39','Carrera 39 #10-40','Turista',39,39),
(90000040,'Visitante 40','Carrera 40 #11-1','Docente',40,40),
(90000041,'Visitante 41','Carrera 41 #12-2','Ingeniero',41,41),
(90000042,'Visitante 42','Carrera 42 #13-3','Abogado',42,42),
(90000043,'Visitante 43','Carrera 43 #14-4','Médico',43,43),
(90000044,'Visitante 44','Carrera 44 #15-5','Estudiante',44,44),
(90000045,'Visitante 45','Carrera 45 #16-6','Diseñador',45,45),
(90000046,'Visitante 46','Carrera 46 #17-7','Administrador',46,46),
(90000047,'Visitante 47','Carrera 47 #18-8','Turista',47,47),
(90000048,'Visitante 48','Carrera 48 #19-9','Docente',48,48),
(90000049,'Visitante 49','Carrera 49 #20-10','Ingeniero',49,49),
(90000050,'Visitante 50','Carrera 50 #21-11','Abogado',50,50);

SELECT id, nombre
FROM parque_natural
ORDER BY nombre ASC
LIMIT 10;

SELECT *
FROM departamento;

SELECT id, tipo
FROM vehiculo
WHERE tipo = '4x4';

SELECT *
FROM alojamiento
WHERE capacidad >= 4
ORDER BY precio_x_noche DESC;

-- No hay fechas mas allá de 2015

SELECT *
FROM parque_natural
WHERE dia_declarado >= 2010-01-01;

SELECT id, nombre, cedula
FROM visitante
ORDER BY cedula DESC
LIMIT 5;

SELECT id, nombre, extension
FROM area2
WHERE extension BETWEEN 15 AND 25;

SELECT *
FROM personal_parque
WHERE sueldo BETWEEN 1800000 AND 2200000;

SELECT *
FROM visitante
WHERE profesion IN ('Ingeniero', 'Docente');

SELECT id, categoria, precio_x_noche
FROM alojamiento
ORDER BY precio_x_noche DESC;

SELECT COUNT(*) AS total_parques
FROM parque_natural;

SELECT profesion, COUNT(*) AS total
FROM visitante
GROUP BY profesion;

SELECT categoria, AVG(precio_x_noche) AS promedio_precio, MAX(precio_x_noche) AS maximo_precio
FROM alojamiento
GROUP BY categoria;

-- no hay datos superiores o iguales a 2

SELECT parque_id, COUNT(*) AS total_areas
FROM area2
GROUP BY parque_id
having count(*) >= 2
order by parque_id;

SELECT id, AVG(sueldo) AS promedio_sueldo
FROM personal_parque
GROUP BY id;

SELECT YEAR(periodo_de_realizacion) AS anio, SUM(presupuesto) AS total_presupuesto
FROM proyectos_de_investigacion
GROUP BY YEAR(periodo_de_realizacion);

SELECT tipo, COUNT(*) AS total_especies
FROM especie
GROUP BY tipo
HAVING COUNT(*) >= 10;

SELECT parque_natural_id, 
       MIN(precio_x_noche) AS precio_minimo, 
       MAX(precio_x_noche) AS precio_maximo, 
       AVG(precio_x_noche) AS precio_promedio
FROM alojamiento
GROUP BY parque_natural_id;

SELECT v.nombre AS nombre_visitante,
       a.categoria AS categoria_alojamiento,
       p.nombre AS nombre_parque
FROM visitante v
JOIN alojamiento a ON v.alojamiento_id = a.id
JOIN area2 p ON a.parque_natural_id = p.id;

SELECT e.nombre AS nombre_entrada,
       e.ubicacion,
       p.nombre AS nombre_parque
FROM entrada e
JOIN area2 p ON e.id_parque = p.id;

SELECT pp.nombre AS nombre_empleado,
       a.nombre AS nombre_area,
       v.marca AS marca_vehiculo
FROM personal_parque pp
JOIN area2 a ON pp.id = a.parque_id
JOIN vehiculo v ON v.tipo = '4x4'
WHERE pp.rol = 'Vigilancia';

SELECT pp.nombre AS nombre_empleado,
       a.nombre AS nombre_area,
       v.marca AS marca_vehiculo
FROM personal_parque pp
JOIN area2 a ON pp.id = a.parque_id
JOIN vehiculo v ON v.tipo = '4x4';

SELECT e.nombre AS nombre_especie,
       a.nombre AS nombre_parque
FROM especie e
JOIN area2 a ON e.area2_id = a.id;

SELECT 
    e.denominacion_cientifica AS nombre_especie,
    e.personal_investigador_id AS id_investigador,
    a.nombre AS nombre_parque
FROM especie e
JOIN area2 a ON e.area2_id = a.id;

SELECT en.nombre AS nombre_entidad,
       d.departamentos AS nombre_departamento
FROM entidad en
CROSS JOIN departamento d;

show columns from investigador;

SELECT titulo, fecha
FROM titulacion;