CREATE DATABASE venta_linea;
USE venta_linea;

/*
Punto 2. Crea un script SQL que incluya la creación de las siguientes tablas con 
los campos que se solicitan, además de las respectivas relaciones
	• clientes: ID del cliente, nombre, dirección y correo electrónico.
	• productos: ID del producto, nombre, descripción, precio, inventario.
	• pedidos: ID del pedido, ID del cliente, fecha del pedido y estado del pedido.
	• detalles_pedido: ID del detalle del pedido, ID del pedido, ID del producto y 
	cantidad.
	• envios: ID del envío, ID del pedido, fecha de envío y estado del envío.
*/
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    inventario INT NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME NOT NULL,
    estado_pedido VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalles_pedido (
    id_detalle_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE envios (
    id_envio INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    fecha_envio DATETIME,
    estado_envio VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

/*
Punto 3. Valores para insertar en cada tabla
*/
INSERT INTO clientes (nombre, direccion, correo_electronico) VALUES
('Juan Perez', 'Calle A, Ciudad X', 'juan.perez@example.com'),
('María García', 'Avenida B, Ciudad Y', 'maria.garcia@example.com'),
('Luis Martínez', 'Carrera C, Ciudad Z', 'luis.martinez@example.com');

INSERT INTO productos (nombre, descripcion, precio, inventario) VALUES
('Camiseta', 'Camiseta de algodón blanco', 19.99, 15),
('Pantalón', 'Pantalón vaquero azul', 29.99, 13),
('Zapatos', 'Zapatos de cuero marrón', 39.99, 10);

INSERT INTO pedidos (id_cliente, fecha_pedido, estado_pedido) VALUES
(1, '2024-04-09', 'Pendiente'),
(2, '2024-04-08', 'Enviado'),
(3, '2024-04-07', 'Entregado');

INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad) VALUES
(1, 1, 3),
(1, 2, 2),
(2, 2, 1),
(3, 3, 2);

INSERT INTO envios (id_pedido, fecha_envio, estado_envio) VALUES
(2, '2024-04-08', 'En proceso'),
(3, '2024-04-07', 'Entregado');