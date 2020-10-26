CREATE TABLE `taekwondo`.`usuario` (
  `id_usuario` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `password` text,
  `tipo` varchar(13)
);

CREATE TABLE `taekwondo`.`tipo_evento` (
  `id_tipo_evento` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `descripcion` text
);

CREATE TABLE `taekwondo`.`evento` (
  `id_evento` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_alumno` integer,
  `nombre` varchar(13),
  `id_tipo_evento` integer,
  `fecha_inicio` date,
  `fecha_fin` date,
  `costo` float(6.2),
  `enlace` text,
  `lista_alumnos` text
);

CREATE TABLE `taekwondo`.`examen` (
  `id_examen` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_alumno` integer,
  `nombre` text,
  `tipo_examen` varchar(255),
  `fecha` date,
  `costo` float(6.2),
  `horario` datetime,
  `enlace` text,
  `lista_alumnos` text,
  `solicitud` text
);

CREATE TABLE `taekwondo`.`alumno` (
  `id_alumno` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_usuario` integer,
  `nombre` text,
  `apellidos` text,
  `fecha_nacimiento` date,
  `fotografia` text,
  `actividad` text,
  `grado` text,
  `seguro_medico` text,
  `certificado_medico` text,
  `carta_responsiva` text,
  `historial_examen` text,
  `historial_evento` text
);

CREATE TABLE `taekwondo`.`administrador` (
  `id_administrador` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_usuario` integer,
  `nombre` text,
  `apellidos` text,
  `fecha_nacimiento` date,
  `fotografia` text,
  `seguro_medico` text
);

ALTER TABLE `taekwondo`.`evento` ADD FOREIGN KEY (`id_alumno`) REFERENCES `taekwondo`.`alumno` (`id_alumno`);

ALTER TABLE `taekwondo`.`evento` ADD FOREIGN KEY (`id_tipo_evento`) REFERENCES `taekwondo`.`tipo_evento` (`id_tipo_evento`);

ALTER TABLE `taekwondo`.`examen` ADD FOREIGN KEY (`id_alumno`) REFERENCES `taekwondo`.`alumno` (`id_alumno`);

ALTER TABLE `taekwondo`.`alumno` ADD FOREIGN KEY (`id_usuario`) REFERENCES `taekwondo`.`usuario` (`id_usuario`);

ALTER TABLE `taekwondo`.`administrador` ADD FOREIGN KEY (`id_usuario`) REFERENCES `taekwondo`.`usuario` (`id_usuario`);