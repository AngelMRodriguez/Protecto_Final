create database Farmacia;

use Farmacia;

CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY,
    fecha DATE,
    cliente_id INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE DetalleVentas (
    detalle_id INT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Compras (
    compra_id INT PRIMARY KEY,
    fecha DATE,
    proveedor_id INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE DetalleCompras (
    detalle_id INT PRIMARY KEY,
    compra_id INT,
    producto_id INT,
    cantidad INT,
    costo_unitario DECIMAL(10, 2),
    FOREIGN KEY (compra_id) REFERENCES Compras(compra_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);


INSERT INTO Productos VALUES (1, 'Aspirina', 5.99, 100);
INSERT INTO Productos VALUES (2, 'Amoxicilina', 12.50, 50);
INSERT INTO Productos VALUES (3, 'Paracetamol', 3.99, 200);


INSERT INTO Clientes VALUES (1, 'Juan Pérez', 'Calle A #123', '555-1234');
INSERT INTO Clientes VALUES (2, 'María Gómez', 'Avenida B #456', '555-5678');


INSERT INTO Ventas VALUES (1, '2023-01-10', 1, 20.98);
INSERT INTO Ventas VALUES (2, '2023-01-15', 2, 15.50);


INSERT INTO DetalleVentas VALUES (1, 1, 1, 2, 11.98);
INSERT INTO DetalleVentas VALUES (2, 1, 2, 1, 9.00);
INSERT INTO DetalleVentas VALUES (3, 2, 3, 3, 11.97);


INSERT INTO Proveedores VALUES (1, 'Proveedor A', 'Calle X #789', '555-9876');
INSERT INTO Proveedores VALUES (2, 'Proveedor B', 'Avenida Y #101', '555-5432');


INSERT INTO Compras VALUES (1, '2023-02-05', 1, 30.50);
INSERT INTO Compras VALUES (2, '2023-02-10', 2, 25.00);


INSERT INTO DetalleCompras VALUES (1, 1, 1, 5, 6.10);
INSERT INTO DetalleCompras VALUES (2, 1, 2, 2, 12.40);
INSERT INTO DetalleCompras VALUES (3, 2, 3, 4, 10.00);
