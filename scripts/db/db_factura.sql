
--Creacion de la base de catos
create DATABASE db_hunter_facture_LuzBarrera;
--Usar la base de datos creada
USE db_hunter_facture_LuzBarrera;
--Creacion de una tabla en la base de datos que estamos utilizando
CREATE TABLE tb_bills(
    n_bill INT(11) NOT NULL UNIQUE COMMENT 'Este es el campo donde se almacena el numero de la factura',
    bill_data DATETIME NOT NULL DEFAULT NOW() UNIQUE COMMENT 'Campo para almacenar la fecha actual de la factura',

    PRIMARY KEY (n_bill) 
);

CREATE TABLE tb_clients(
    cc BIGINT(20) NOT NULL PRIMARY KEY COMMENT 'Identificador del cliente',
    fullname VARCHAR(255) NOT NULL COMMENT 'nombre del cliente',
    email VARCHAR(255) NOT NULL COMMENT 'email del cliente',
    address VARCHAR(255) NOT NULL COMMENT 'address del cliente',
    phone VARCHAR(255) NOT NULL COMMENT 'numero tel del cliente'
);

CREATE TABLE tb_products(
    id_product INT(11) NOT NULL UNIQUE AUTO_INCREMENT COMMENT 'Identificador del product',
    name VARCHAR(50) NOT NULL COMMENT 'nombre del product',
    amount INT NOT NULL COMMENT 'amount del product',
    price NUMERIC(6,2) NOT NULL COMMENT 'Value del product',

    PRIMARY KEY (id_product)
);

DROP TABLE tb_products;
--Modificar el tipo de dato  de una columna en la tabla de tb_personas
ALTER TABLE tb_personas MODIFY COLUMN nom_com VARCHAR(60);

TRUNCATE TABLE tb_personas;

--Damos uso a otra base de datos
USE db_hunter_facture;
--Insertamos datos en la tabla tb_client
INSERT INTO tb_client(identificacion, full_name, email, address, phone) VALUES("1098820098", "Omaira Barrera", "Omaira@gmail.com", "Carrera 32", "3223024631");
--Consulta para obtener todos los registros de la tabla tb_client
SELECT * FROM tb_client;
--Ordenar una tabla segun una condicion
SELECT * FROM tb_client ORDER BY full_name;

