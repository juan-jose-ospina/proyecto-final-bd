CREATE DATABASE gestion_proyectos;
USE gestion_proyectos;

SELECT DATABASE();


CREATE TABLE Cliente (
    codigo_cliente VARCHAR(10) PRIMARY KEY,
    telefono VARCHAR(15) NOT NULL,
    domicilio VARCHAR(200) NOT NULL,
    razon VARCHAR(100) NOT NULL
);

CREATE TABLE Banco (
    codigo_banco VARCHAR(10) PRIMARY KEY,
    nombre_banco VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Tipo_pago (
    codigo VARCHAR(10) PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Proyecto (
    codigo_proyecto VARCHAR(10) PRIMARY KEY,
    descripcion TEXT NOT NULL,
    cuantia DECIMAL(15,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    codigo_cliente VARCHAR(10) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo_cliente)
);

CREATE TABLE Colaborador (
    NIF VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo_banco VARCHAR(10) NOT NULL,
    domicilio VARCHAR(200) NOT NULL,
    cuenta VARCHAR(30) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (codigo_banco) REFERENCES Banco(codigo_banco)
);


CREATE TABLE Participa (
    codigo_proyecto VARCHAR(10) NOT NULL,
    NIF VARCHAR(15) NOT NULL,
    PRIMARY KEY (codigo_proyecto, NIF),
    FOREIGN KEY (codigo_proyecto) REFERENCES Proyecto(codigo_proyecto),
    FOREIGN KEY (NIF) REFERENCES Colaborador(NIF)
);

CREATE TABLE Pago (
    num_pago INT PRIMARY KEY AUTO_INCREMENT,
    concepto VARCHAR(200) NOT NULL,
    cantidad DECIMAL(15,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    NIF VARCHAR(15) NOT NULL,
    codigo_tipo_pago VARCHAR(10) NOT NULL,
    FOREIGN KEY (NIF) REFERENCES Colaborador(NIF),
    FOREIGN KEY (codigo_tipo_pago) REFERENCES Tipo_pago(codigo)
);

SHOW TABLES;


INSERT INTO Banco VALUES ('B001', 'Banco Santander');
INSERT INTO Banco VALUES ('B002', 'BBVA');
INSERT INTO Banco VALUES ('B003', 'Bancolombia');
INSERT INTO Banco VALUES ('B004', 'Banco de Bogotá');
INSERT INTO Banco VALUES ('B005', 'Davivienda');

INSERT INTO Cliente VALUES ('CLI001', '555-0001', 'Calle 45 #23-10, Pereira', 'Empresa ABC Ltda');
INSERT INTO Cliente VALUES ('CLI002', '555-0002', 'Carrera 7 #15-30, Dosquebradas', 'Constructora XYZ S.A.');
INSERT INTO Cliente VALUES ('CLI003', '555-0003', 'Avenida 30 de Agosto #50-25, Pereira', 'Tecnología Digital SAS');
INSERT INTO Cliente VALUES ('CLI004', '555-0004', 'Calle 14 #8-45, Santa Rosa', 'Comercializadora 123');
INSERT INTO Cliente VALUES ('CLI005', '555-0005', 'Carrera 10 #20-15, Pereira', 'Servicios Integrales SA');

INSERT INTO Proyecto VALUES ('PRO001', 'Desarrollo de aplicación web para gestión de inventarios', 25000000.00, '2024-01-15', '2024-06-30', 'CLI001');
INSERT INTO Proyecto VALUES ('PRO002', 'Construcción de edificio comercial de 5 pisos', 850000000.00, '2024-02-01', '2025-01-31', 'CLI002');
INSERT INTO Proyecto VALUES ('PRO003', 'Implementación de sistema ERP empresarial', 45000000.00, '2024-03-10', '2024-09-10', 'CLI003');
INSERT INTO Proyecto VALUES ('PRO004', 'Campaña de marketing digital y redes sociales', 12000000.00, '2024-04-01', '2024-08-01', 'CLI004');
INSERT INTO Proyecto VALUES ('PRO005', 'Consultoría en transformación digital', 30000000.00, '2024-05-15', NULL, 'CLI005');
INSERT INTO Proyecto VALUES ('PRO006', 'Desarrollo de app móvil iOS y Android', 35000000.00, '2024-06-01', '2024-12-15', 'CLI001');

INSERT INTO Colaborador VALUES ('10123456', 'Juan Carlos Pérez García', 'B001', 'Calle 25 #12-34, Pereira', '1234567890', '310-555-0001');
INSERT INTO Colaborador VALUES ('20234567', 'María Fernanda López Ruiz', 'B001', 'Carrera 8 #18-22, Dosquebradas', '1234567891', '311-555-0002');
INSERT INTO Colaborador VALUES ('30345678', 'Pedro Antonio Martínez Silva', 'B002', 'Avenida Circunvalar #45-10, Pereira', '9876543210', '312-555-0003');
INSERT INTO Colaborador VALUES ('40456789', 'Ana María Rodríguez Castro', 'B003', 'Calle 50 #30-15, Pereira', '5555666677', '313-555-0004');
INSERT INTO Colaborador VALUES ('50567890', 'Luis Fernando Gómez Vargas', 'B002', 'Carrera 15 #28-40, Santa Rosa', '4444333322', '314-555-0005');
INSERT INTO Colaborador VALUES ('60678901', 'Carolina Jiménez Moreno', 'B004', 'Calle 30 #20-18, Pereira', '7777888899', '315-555-0006');
INSERT INTO Colaborador VALUES ('70789012', 'Diego Alejandro Torres Díaz', 'B001', 'Carrera 12 #35-50, Dosquebradas', '1111222233', '316-555-0007');
INSERT INTO Colaborador VALUES ('80890123', 'Sandra Patricia Herrera Muñoz', 'B005', 'Avenida 30 Agosto #60-25, Pereira', '9999000011', '317-555-0008');

INSERT INTO Tipo_pago VALUES ('TP001', 'Transferencia Bancaria');
INSERT INTO Tipo_pago VALUES ('TP002', 'Cheque');
INSERT INTO Tipo_pago VALUES ('TP003', 'Efectivo');
INSERT INTO Tipo_pago VALUES ('TP004', 'Pago Electrónico PSE');
INSERT INTO Tipo_pago VALUES ('TP005', 'Consignación');

INSERT INTO Participa VALUES ('PRO001', '10123456');
INSERT INTO Participa VALUES ('PRO001', '20234567');
INSERT INTO Participa VALUES ('PRO001', '70789012');
INSERT INTO Participa VALUES ('PRO002', '30345678');
INSERT INTO Participa VALUES ('PRO002', '40456789');
INSERT INTO Participa VALUES ('PRO002', '50567890');
INSERT INTO Participa VALUES ('PRO002', '60678901');
INSERT INTO Participa VALUES ('PRO003', '10123456');
INSERT INTO Participa VALUES ('PRO003', '80890123');
INSERT INTO Participa VALUES ('PRO004', '20234567');
INSERT INTO Participa VALUES ('PRO004', '40456789');
INSERT INTO Participa VALUES ('PRO005', '30345678');
INSERT INTO Participa VALUES ('PRO005', '50567890');
INSERT INTO Participa VALUES ('PRO005', '70789012');
INSERT INTO Participa VALUES ('PRO006', '10123456');
INSERT INTO Participa VALUES ('PRO006', '20234567');

INSERT INTO Pago (concepto, cantidad, fecha_pago, NIF, codigo_tipo_pago) VALUES
('Anticipo desarrollo frontend proyecto inventarios', 5000000.00, '2024-01-20', '10123456', 'TP001'),
('Pago mensual construcción edificio - Enero', 30000000.00, '2024-02-15', '30345678', 'TP001'),
('Honorarios consultoría ERP - Fase 1', 8000000.00, '2024-03-20', '10123456', 'TP004'),
('Pago diseño gráfico campaña marketing', 3500000.00, '2024-04-10', '20234567', 'TP001'),
('Pago mensual construcción edificio - Febrero', 30000000.00, '2024-03-15', '40456789', 'TP001'),
('Desarrollo backend app móvil', 10000000.00, '2024-06-15', '10123456', 'TP001'),
('Honorarios arquitecto edificio comercial', 15000000.00, '2024-02-28', '50567890', 'TP002'),
('Consultoría transformación digital - Avance 1', 12000000.00, '2024-05-25', '30345678', 'TP001'),
('Community manager redes sociales', 2500000.00, '2024-04-20', '40456789', 'TP004'),
('Testing y QA aplicación web', 4000000.00, '2024-06-25', '70789012', 'TP001'),
('Pago mensual construcción edificio - Marzo', 30000000.00, '2024-04-15', '30345678', 'TP001'),
('Capacitación usuarios sistema ERP', 3000000.00, '2024-09-05', '80890123', 'TP003'),
('Diseño UI/UX app móvil', 6000000.00, '2024-06-20', '20234567', 'TP001'),
('Pago final campaña marketing digital', 5000000.00, '2024-07-30', '20234567', 'TP001'),
('Honorarios ingeniero civil - Supervisión', 12000000.00, '2024-05-10', '60678901', 'TP002');



SELECT 
    Proyecto.codigo_proyecto,
    Proyecto.descripcion,
    Proyecto.cuantia,
    Cliente.razon AS cliente,
    Colaborador.nombre AS colaborador
FROM Proyecto
JOIN Cliente ON Proyecto.codigo_cliente = Cliente.codigo_cliente
JOIN Participa ON Proyecto.codigo_proyecto = Participa.codigo_proyecto
JOIN Colaborador ON Participa.NIF = Colaborador.NIF
ORDER BY Proyecto.codigo_proyecto;


SELECT 
    Cliente.razon AS cliente,
    COUNT(Proyecto.codigo_proyecto) AS total_proyectos
FROM Cliente
JOIN Proyecto ON Cliente.codigo_cliente = Proyecto.codigo_cliente
GROUP BY Cliente.razon
ORDER BY total_proyectos DESC;



SELECT 
    Colaborador.nombre AS colaborador,
    COUNT(Pago.num_pago) AS cantidad_pagos,
    SUM(Pago.cantidad) AS total_pagado,
    AVG(Pago.cantidad) AS promedio_pago
FROM Colaborador
JOIN Pago ON Colaborador.NIF = Pago.NIF
GROUP BY Colaborador.nombre
ORDER BY total_pagado DESC;



SELECT 
    Pago.num_pago,
    Pago.concepto,
    Pago.cantidad,
    Pago.fecha_pago,
    Colaborador.nombre AS colaborador,
    Tipo_pago.descripcion AS tipo_pago
FROM Pago
JOIN Colaborador ON Pago.NIF = Colaborador.NIF
JOIN Tipo_pago ON Pago.codigo_tipo_pago = Tipo_pago.codigo
ORDER BY Pago.fecha_pago DESC;


SELECT 
    Proyecto.codigo_proyecto,
    Proyecto.descripcion,
    Proyecto.cuantia AS cuantia_original,
    Proyecto.cuantia * 0.10 AS comision,
    Proyecto.cuantia + (Proyecto.cuantia * 0.10) AS total_con_comision
FROM Proyecto
ORDER BY Proyecto.cuantia DESC;



SELECT 
    Banco.nombre_banco AS banco,
    COUNT(Colaborador.NIF) AS total_colaboradores
FROM Banco
JOIN Colaborador ON Banco.codigo_banco = Colaborador.codigo_banco
GROUP BY Banco.nombre_banco
ORDER BY total_colaboradores DESC;



INSERT INTO Pago (concepto, cantidad, fecha_pago, NIF, codigo_tipo_pago)
VALUES ('Pago por servicios de consultoría', 7500000.00, '2024-11-28', '10123456', 'TP001');
SELECT * FROM Pago ORDER BY num_pago DESC LIMIT 1;

UPDATE Cliente
SET telefono = '555-9999'
WHERE codigo_cliente = 'CLI001';
SELECT * FROM Cliente WHERE codigo_cliente = 'CLI001';




UPDATE Proyecto
SET cuantia = cuantia * 1.15
WHERE codigo_proyecto = 'PRO001';

SELECT codigo_proyecto, descripcion, cuantia 
FROM Proyecto 
WHERE codigo_proyecto = 'PRO001';




SELECT * FROM Pago ORDER BY num_pago DESC LIMIT 3;
DELETE FROM Pago
WHERE num_pago = 16;
SELECT COUNT(*) AS total_pagos FROM Pago;