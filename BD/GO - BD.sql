CREATE TABLE TIPO_USUARIO(
	ID_TIPO int primary key AUTO_INCREMENT ,
    NOMBRE_TIPO varchar(40)
);

CREATE TABLE TIPO_ESPECIALIDAD(
	ID_ESPECIALIDAD INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_ESPECIALIDAD VARCHAR(90)
);

CREATE TABLE USUARIO(
    ID_USUARIO int primary key AUTO_INCREMENT,
	USUARIO varchar(30),
    CONTRASEÑA varchar(30),
    ID_TIPO int references TIPO_USUARIO(ID_TIPO),
    NOMBRE_USUARIO varchar(80),
    APELLIDO_USUARIO varchar(80),
    TELEFONO_USUARIO varchar(20),
	EMAIL_USUARIO varchar(60),
    DIRECCION varchar(100),
    CIUDAD varchar(90),
    PAIS VARCHAR(40),
	CEDULA varchar(30)
);


CREATE TABLE MECANICO_ESPECIALIDAD(
	ID_USUARIO INT REFERENCES USUARIO(ID_USUARIO),
    ID_TIPO_ESPECIALIDAD INT REFERENCES TIPO_ESPECIALIDAD(ID_ESPECIALIDAD),
    TIENE_ESPECIALIDAD BOOLEAN
);


CREATE TABLE USUARIO_CARRO(
	ID_USUARIO INT REFERENCES USUARIO(ID_USUARIO),
    MARCA_CARRO VARCHAR(40),
    AÑO_CARRO VARCHAR(4),
    COLOR_CARRO VARCHAR(18),
    MODELO_CARRO VARCHAR(20),
    PLACA_CARRO VARCHAR(40),
    IMAGEN_CARRO VARCHAR(60)
);

CREATE TABLE AVERIA(
	ID_AVERIA int primary key AUTO_INCREMENT,
    ID_USUARIO INT REFERENCES USUARIO(ID_USUARIO),
	LATITUD_UBICACION VARCHAR(200),
    LONGITUD_UBICACION VARCHAR(200),
    CALLE VARCHAR(120),
    PROVINCIA VARCHAR(120),
    DEPARTAMENTO VARCHAR(120),
    DATOS_ADICIONALES VARCHAR(300),
    FECHA_AVERIA DATETIME,
    CALIFICACION VARCHAR(1)
);

