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
    ('Juan P�rez', '56912345678', 'M�xico'),
    ('Ana L�pez', '56923456789', 'Espa�a'),
    ('Carlos Garc�a', '56934567890', 'Colombia'),
    ('Marta S�nchez', '56945678901', 'Argentina'),
    ('Luis Fern�ndez', '56956789012', 'Chile'),
    ('Pedro Mart�nez', '56967890123', 'Per�'),
    ('Laura Rodr�guez', '56978901234', 'Ecuador'),
    ('Miguel Gonz�lez', '56989012345', 'Bolivia'),
    ('Isabel D�az', '56990123456', 'Paraguay'),
    ('Jos� Torres', '56901234567', 'Uruguay'),
    ('Mar�a L�pez', '56912345679', 'M�xico'),
    ('Andr�s S�nchez', '56923456780', 'Espa�a'),
    ('Luc�a Mart�nez', '56934567891', 'Colombia'),
    ('Javier P�rez', '56945678902', 'Argentina'),
    ('Ra�l Fern�ndez', '56956789013', 'Chile'),
    ('Carolina Gonz�lez', '56967890124', 'Per�'),
    ('Antonio Rodr�guez', '56978901235', 'Ecuador'),
    ('Elena Garc�a', '56989012346', 'Bolivia'),
    ('Francisco D�az', '56990123457', 'Paraguay'),
    ('Rosa Torres', '56901234568', 'Uruguay'),
    ('Ricardo Gonz�lez', '56912345680', 'M�xico'),
    ('Beatriz L�pez', '56923456781', 'Espa�a'),
    ('Victor S�nchez', '56934567892', 'Colombia'),
    ('Paula Mart�nez', '56945678903', 'Argentina'),
    ('Alberto Fern�ndez', '56956789014', 'Chile'),
    ('Sandra Rodr�guez', '56967890125', 'Per�'),
    ('�scar Garc�a', '56978901236', 'Ecuador'),
    ('Marina D�az', '56989012347', 'Bolivia'),
    ('Juan Carlos Torres', '56990123458', 'Paraguay'),
    ('Carmen P�rez', '56901234569', 'Uruguay'),
    ('Juan P�rez', '56912345678', 'M�xico'),
    ('Ana L�pez', '56923456789', 'Espa�a');


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
