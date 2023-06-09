create DATABASE LuzBarrera;
USE LuzBarrera;
CREATE TABLE tb_personas(
    cc INT(11) NOT NULL COMMENT 'Este campo donde se almacena la cedula',
    nom_com VARCHAR(20) NOT NULL COMMENT 'Campo para almacenar el nombre completo',
    edad INTEGER(3) NOT NULL COMMENT 'Campo para almacenar la edad',
    PRIMARY KEY (cc)
);