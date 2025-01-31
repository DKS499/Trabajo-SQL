drop table if exists azafatos cascade;
drop table if exists embarcar cascade;
drop table if exists pasajeros cascade;
drop table if exists piloto cascade;
drop table if exists tiene cascade;
drop table if exists empleados cascade;
drop table if exists vuelos cascade;
drop table if exists lugar cascade;
drop view if exists antigüedad_empleados cascade;
/*
 creamos la tabla principal, le añadimos la llave primaria que es "código",
 y de paso añadimos las claves foráneas siendo estas "código_destino" y "código_origen"
 */
CREATE TABLE vuelos (
    código INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    numero_vuelo VARCHAR(10) NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    tipo ENUM ('Nacional', 'Internacional') NOT NULL,
    código_destino INT NOT NULL,
    código_origen INT NOT NULL
);
/*
  creamos la tabla pasajeros, siendo la llave primaria "dni"
 */
CREATE TABLE pasajeros (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR (50) NOT NULL,
    teléfono INT(9) NOT NULL,
    mail VARCHAR(35)
);
/*
 Creamos la tabla embarcar siendo una relación entre la tabla "pasajeros" y la tabla "vuelos"
 */
CREATE TABLE embarcar (
    código INT,
    dni CHAR(9)
);
/*
 Añadimos las claves foráneas a la tabla embarcar.
 */
ALTER TABLE embarcar
    ADD CONSTRAINT fk_1
        FOREIGN KEY (código) REFERENCES vuelos(código)
            ON DELETE RESTRICT
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_2
        FOREIGN KEY (dni) REFERENCES pasajeros(dni)
            ON DELETE CASCADE
            ON UPDATE CASCADE;
/*
 Creamos la tabla empleados con clave primaria "dni"
 */
CREATE TABLE empleados (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_contrato DATE NOT NULL,
    salario NUMERIC (7,2) NOT NULL,
    tipo ENUM ('Piloto', 'Azafatos') NOT NULL
);
/*
 Creamos una vista en para empleados para poder ver la antigüedad de un empleado de una forma más fácil.
 */
CREATE VIEW antigüedad_empleados AS
SELECT
    nombre,
    DATE(CURDATE()) - DATE(fecha_contrato) AS antigüedad
FROM
    empleados
WHERE
    fecha_contrato IS NOT NULL;
/*
 Creamos la tabla piloto siendo esta una jerárquica de la tabla empleados
 */
CREATE TABLE piloto (
    dni CHAR(9),
    dni_copiloto CHAR(9),
    numero_vuelos INT NOT NULL
);
/*
 añadimos las claves foráneas a piloto relacionándolo asi con los empleados
 */
ALTER TABLE piloto
    ADD CONSTRAINT fk_3
        FOREIGN KEY (dni) REFERENCES empleados(dni)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_4
        FOREIGN KEY (dni_copiloto) REFERENCES empleados(dni)
            ON DELETE CASCADE
            ON UPDATE CASCADE;
/*
 Creamos la tabla azafatos siendo una tabla jerárquica relacionada con empleados
 */
CREATE TABLE azafatos (
    dni CHAR(9),
    sexo ENUM ('H', 'M') NOT NULL,
    edad INT (3) NOT NULL
);
/*
 añadimos las claves foráneas a azafatos relacionándola asi con la tabla empleados
 */
ALTER TABLE azafatos
    ADD CONSTRAINT fk_5
        FOREIGN KEY (dni) REFERENCES empleados(dni)
            ON DELETE CASCADE
            ON UPDATE CASCADE;
/*
 creamos la tabla tiene, que esta relaciona los empleados con el vuelo
 */
CREATE TABLE tiene (
    dni CHAR(9),
    código INT
);
/*
 añadimos las claves foráneas a la tabla tiene relacionando "dni" con empleados y "código"
 con vuelos.
 */
ALTER TABLE tiene
    ADD CONSTRAINT fk_6
        FOREIGN KEY (dni) REFERENCES empleados(dni)
            ON DELETE RESTRICT
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_7
        FOREIGN KEY (código) REFERENCES vuelos(código)
            ON DELETE RESTRICT
            ON UPDATE CASCADE;
/*
 creamos la tabla lugar a la que añadimos la clave primaria "código"
 */
CREATE TABLE lugar (
    código INT AUTO_INCREMENT PRIMARY KEY,
    numero_pista INT(2) NOT NULL,
    numero_hangar INT(3) NOT NULL,
    localidad VARCHAR(20) NOT NULL,
    pais VARCHAR(20) NOT NULL
);

/*
 le añadimos las claves foráneas a vuelos relacionándola asi con lugar de destino y lugar de origen.
 */
ALTER TABLE vuelos
    ADD CONSTRAINT fk_8
        FOREIGN KEY (código_destino) REFERENCES lugar(código)
            ON DELETE RESTRICT
            ON UPDATE CASCADE,
    ADD CONSTRAINT fk_9
        FOREIGN KEY (código_origen) REFERENCES lugar(código)
            ON DELETE RESTRICT
            ON UPDATE CASCADE;

