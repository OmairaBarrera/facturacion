--Creacion de la base de catos
create DATABASE db_hunter_facture_LuzBarrera;
--Usar la base de datos creada
USE db_hunter_facture_LuzBarrera;
--Creacion de las tablas que se usaran en la facturacion
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
CREATE TABLE tb_seller(
    id_seller INTEGER(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Numero del vendedor',
    seller  VARCHAR(60) NOT NULL COMMENT 'Nombre del vendedor'
);
--ALTER TABLE: Permite modificar la estructura de una tabla existente en la base de datos.
--Agergar columnas
ALTER TABLE tb_bills ADD fk_identification INT(25) NOT NULL COMMENT '';
ALTER TABLE tb_bills ADD fk_id_seller INTEGER(11) NOT NULL;
/* 
* * Creamos los campos de la llaves foraneas 
*/
ALTER TABLE tb_bill ADD fk_identificacion INT(25) NOT NULL COMMENT 'Relacion del la tabla tb_client';
ALTER TABLE tb_bill ADD fk_id_seller INTEGER(11) NOT NULL COMMENT 'Relacion del la tabla tb_seller';
ALTER TABLE tb_bill ADD fk_id_product INT(25) NOT NULL COMMENT 'Relacion del la tabla tb_product';
/*
* * Creamos la relacion de la tablas
*/
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_client_fk FOREIGN KEY(fk_identificacion) REFERENCES tb_client(identificacion);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_seller_fk FOREIGN KEY(fk_id_seller) REFERENCES tb_seller(id_seller);
ALTER TABLE tb_bill ADD CONSTRAINT tb_bill_tb_product_fk FOREIGN KEY(fk_id_product) REFERENCES tb_product(id_product);

SELECT * FROM tb_client WHERE identificacion=1215496 OR address = "campus";

INSERT INTO tb_client(identificacion,full_name,email,address,phone) VALUES("123456789","Miguel Angel","ma@gmail.com","Calle 11","+57 3055484");

SELECT * FROM tb_client ORDER BY full_name LIMIT 5 OFFSET 9;

SELECT full_name as 'Nombre' FROM tb_client ORDER BY full_name;
SELECT COUNT(*) INTO @AAA FROM tb_client;
SELECT @AAA;

UPDATE tb_client SET full_name = "MARSHALL NOSSA", address = "Campus" WHERE identificacion = 1005541741;

DELETE FROM tb_client WHERE identificacion = 54354345;

SELECT identificacion AS "cc", full_name AS "name", email AS "email", address AS "direction" ,phone AS "cellphone" FROM tb_client;

