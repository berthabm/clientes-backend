CREATE DATABASE DB_CLIENTS;
USE DB_CLIENTS;

CREATE TABLE Client (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    country NVARCHAR(100) NOT NULL
);

INSERT INTO Client (name, phone, country)
VALUES 
    ('Juan Pérez', '56912345678', 'México'),
    ('Ana López', '56923456789', 'España'),
    ('Carlos García', '56934567890', 'Colombia'),
    ('Marta Sánchez', '56945678901', 'Argentina'),
    ('Luis Fernández', '56956789012', 'Chile'),
    ('Pedro Martínez', '56967890123', 'Perú'),
    ('Laura Rodríguez', '56978901234', 'Ecuador'),
    ('Miguel González', '56989012345', 'Bolivia'),
    ('Isabel Díaz', '56990123456', 'Paraguay'),
    ('José Torres', '56901234567', 'Uruguay'),
    ('María López', '56912345679', 'México'),
    ('Andrés Sánchez', '56923456780', 'España'),
    ('Lucía Martínez', '56934567891', 'Colombia'),
    ('Javier Pérez', '56945678902', 'Argentina'),
    ('Raúl Fernández', '56956789013', 'Chile'),
    ('Carolina González', '56967890124', 'Perú'),
    ('Antonio Rodríguez', '56978901235', 'Ecuador'),
    ('Elena García', '56989012346', 'Bolivia'),
    ('Francisco Díaz', '56990123457', 'Paraguay'),
    ('Rosa Torres', '56901234568', 'Uruguay'),
    ('Ricardo González', '56912345680', 'México'),
    ('Beatriz López', '56923456781', 'España'),
    ('Victor Sánchez', '56934567892', 'Colombia'),
    ('Paula Martínez', '56945678903', 'Argentina'),
    ('Alberto Fernández', '56956789014', 'Chile'),
    ('Sandra Rodríguez', '56967890125', 'Perú'),
    ('Óscar García', '56978901236', 'Ecuador'),
    ('Marina Díaz', '56989012347', 'Bolivia'),
    ('Juan Carlos Torres', '56990123458', 'Paraguay'),
    ('Carmen Pérez', '56901234569', 'Uruguay'),
    ('Juan Pérez', '56912345678', 'México'),
    ('Ana López', '56923456789', 'España');


CREATE PROCEDURE GetClients
	@PageNumber INT,
    @PageSize INT
AS
BEGIN
    SELECT 
        id,
        name,
        phone,
        country,
        CAST(COUNT(*) OVER() AS DECIMAL) AS TotalCount 
    FROM Client
    ORDER BY id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
