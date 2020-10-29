CREATE DATABASE IF NOT EXISTS consultorios;

CREATE TABLE pacientes(
paciente_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
genero ENUM("F", "M") NOT NULL,
telefono VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
fecha_nacimiento DATE NOT NULL,
PRIMARY KEY (paciente_id),
UNIQUE KEY (email)
);

CREATE TABLE especialidades(
especialidad_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
nombre_especialidad VARCHAR(50) NOT NULL,
PRIMARY KEY (especialidad_id),
UNIQUE KEY (nombre_especialidad)
);

CREATE TABLE medicos(
medico_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
especialidad_id INTEGER(15) UNSIGNED NOT NULL,
telefono VARCHAR(50) NOT NULL,
PRIMARY KEY (medico_id),
FOREIGN KEY(especialidad_id) REFERENCES especialidades(especialidad_id)
);


CREATE TABLE turnos(
turno_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
paciente_id INTEGER UNSIGNED NOT NULL,
medico_id INTEGER UNSIGNED NOT NULL,
fecha_hora DATETIME NOT NULL,
precio DECIMAL(6,2) NOT NULL,
PRIMARY KEY (turno_id),
FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
UNIQUE KEY (fecha_hora)
);


CREATE TABLE historia_medica(
historia_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
medico_id INTEGER UNSIGNED NOT NULL,
turno_id INTEGER UNSIGNED NOT NULL,
diagnostico TEXT,
actualizada TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (historia_id),
FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
FOREIGN KEY (turno_id) REFERENCES turnos(turno_id)
);

