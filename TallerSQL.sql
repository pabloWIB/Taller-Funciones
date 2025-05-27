-- ● Crear una funcion que devulva un hola Mundo 😊

DELIMITER //

Create function holaMundo()
returns varchar(50)
DETERMINISTIC
BEGIN
    RETURN 'Hola Mundo';
END //

DELIMITER ;

select holaMundo();

-- Crear una función para calcular impuestos que reciba como parámetro el precio de un producto y devuelva el precio con el 15% de impuesto incluido

DELIMITER //

CREATE FUNCTION impuestos(precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE precioAumentado DECIMAL(10,2);
    SET precioAumentado = precio * 1.15;
    RETURN precioAumentado;
END //

DELIMITER ;

SELECT impuestos(100.00) AS PrecioConImpuesto;

-- Crea una función que reciba el salario mensual de un empleado y devuelva el salario  anual (suponiendo 12 meses). 

DELIMITER //

CREATE or replace FUNCTION salarioAnual(salarioMensual DECIMAL(10,2))
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(10,2);
    SET resultado = salarioMensual * 12;
    RETURN resultado;
END //

DELIMITER ;

SELECT salarioAnual(1500.00) AS SalarioAnual;

-- Función para calcular el descuento en una compra, que reciba el precio de un producto y el porcentaje de descuento y devuelva el precio con el descuento  aplicado. 

DELIMITER //

CREATE or replace FUNCTION descuento(precio DECIMAL(10,2), cantidadDescuento DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN 
    DECLARE resultado DECIMAL(10,2);
    SET resultado = precio - (precio * (cantidadDescuento / 100));
    RETURN resultado;
END; //

DELIMITER ;

SELECT descuento(1000.00, 15.00) AS PrecioConDescuento;

-- Crear un procedimiento almacenado, el cual ingreses los datos de un empleado y agregue a una tabla empleados

CREATE TABLE IF NOT EXISTS empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    departamento VARCHAR(50)
);

DELIMITER //

CREATE PROCEDURE agregarEmpleado(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_salario DECIMAL(10,2),
    IN p_departamento VARCHAR(50)
)
BEGIN
    INSERT INTO empleados (nombre, apellido, email, telefono, salario, fecha_contratacion, departamento)
    VALUES (p_nombre, p_apellido, p_email, p_telefono, p_salario, CURDATE(), p_departamento);
    
END //

DELIMITER ;

CALL agregarEmpleado('Juan', 'Pérez', 'juan.perez@email.com', '555-1234', 2500.00, 'Ventas');

-- Crear un procedimiento almacenado, el cual ingreses los datos de un empleado y actualices un empleado dado.

DELIMITER //

CREATE PROCEDURE actualizarEmpleado(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_salario DECIMAL(10,2),
    IN p_departamento VARCHAR(50)
)
BEGIN
    UPDATE empleados 
    SET 
        nombre = p_nombre,
        apellido = p_apellido,
        email = p_email,
        telefono = p_telefono,
        salario = p_salario,
        departamento = p_departamento
    WHERE id = p_id;
    
    IF ROW_COUNT() > 0 THEN
        SELECT 'Bien bien, se actualizò' AS mensaje;
    ELSE
        SELECT 'No se encontró :(' AS mensaje;
    END IF;
END //

DELIMITER ;

CALL actualizarEmpleado(1, 'Juan', 'Hierro', 'juan.hierro@email.com', '1-2555-1234', 1500.00, 'Ventas');

-- Crear un procedimiento almacenado, el cual ingreses los datos de un empleado y elimines un empleado dado.

DELIMITER //

CREATE PROCEDURE eliminarEmpleado(
    IN p_id INT
)
BEGIN
    DECLARE empleado_existe INT;
    
    SELECT COUNT(*) INTO empleado_existe 
    FROM empleados 
    WHERE id = p_id;
    
    IF empleado_existe > 0 THEN
        DELETE FROM empleados WHERE id = p_id;
        SELECT 'Empleado eliminado, bien bien' AS mensaje;
    ELSE
        SELECT 'Mal, no se pudo hacer' AS mensaje;
    END IF;
END //

DELIMITER ;

CALL eliminarEmpleado(1);

-- Crear otra tabla llamada departamentos y obtener los empleados dados en un departamento especifico utilizando un procedimiento. 

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100),
    presupuesto DECIMAL(15,2),
    fecha_creacion DATE DEFAULT CURRENT_DATE
);

INSERT INTO departamentos (nombre, ubicacion, presupuesto) VALUES
('Ventas', 'Edificio A, Piso 2', 500000.00),
('Marketing', 'Edificio B, Piso 1', 350000.00),
('Recursos Humanos', 'Edificio A, Piso 1', 200000.00),
('Tecnología', 'Edificio C, Piso 3', 750000.00),
('Contabilidad', 'Edificio B, Piso 2', 300000.00);

ALTER TABLE empleados
ADD COLUMN departamento_id INT,
ADD CONSTRAINT fk_departamento 
FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

DELIMITER //

CREATE PROCEDURE obtenerEmpleadosPorDepartamento(
    IN p_departamento_id INT
)
BEGIN
    DECLARE departamento_existe INT;
    DECLARE nombre_departamento VARCHAR(50);
    
    SELECT COUNT(*), nombre INTO departamento_existe, nombre_departamento
    FROM departamentos 
    WHERE id = p_departamento_id
    GROUP BY nombre;
    
    IF departamento_existe > 0 THEN
        SELECT 
            e.id AS 'ID Empleado',
            e.nombre AS 'Nombre',
            e.apellido AS 'Apellido',
            e.email AS 'Email',
            e.telefono AS 'Teléfono',
            e.salario AS 'Salario',
            e.fecha_contratacion AS 'Fecha Contratación',
            d.nombre AS 'Departamento'
        FROM 
            empleados e
        JOIN 
            departamentos d ON e.departamento_id = d.id
        WHERE 
            d.id = p_departamento_id
        ORDER BY 
            e.apellido, e.nombre;
            
        SELECT 
            CONCAT('Total de empleados en departamento ', nombre_departamento, ': ', COUNT(*)) AS 'Resumen'
        FROM 
            empleados
        WHERE 
            departamento_id = p_departamento_id;
    ELSE
        SELECT 'No se encontró ningún departamento con el ID proporcionado' AS mensaje;
    END IF;
END //

DELIMITER ;

CALL obtenerEmpleadosPorDepartamento(1); 




CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO clientes (id, nombre, email) VALUES
(1, 'Ana Gómez', 'ana@gmail.com'),
(2, 'Carlos Pérez', 'carlos@hotmail.com'),
(3, 'Lucía Ríos', 'lucia@yahoo.com');

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

INSERT INTO productos (nombre, precio) VALUES
('Camiseta', 19.99),
('Pantalón', 39.99),
('Zapatos', 59.99);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(1, 2, 1, '2025-05-01'),
(2, 1, 2, '2025-05-02'),
(3, 3, 1, '2025-05-03');

create view NombreProducto_Cliente_Cantidad AS
SELECT c.nombre as nombreCliente, p.nombre as nombreProductos, v.cantidad as cantidad 
FROM ventas v
INNER JOIN clientes c ON v.cliente_id = c.id
INNER JOIN productos p ON v.producto_id = p.id;
