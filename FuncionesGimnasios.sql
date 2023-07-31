Use Gimnasios;

DELIMITER $$

CREATE FUNCTION CalcularPorcentajeAumentoSalarial(antiguedad_en_anios INT)
RETURNS DECIMAL(5, 2)
NO SQL
BEGIN
    DECLARE porcentaje_aumento DECIMAL(5, 2);

    -- Definir la política de aumento salarial basada en la antigüedad
    IF antiguedad_en_anios < 1 THEN
        SET porcentaje_aumento = 5.00; -- 5% de aumento para menos de 1 año de antigüedad
    ELSEIF antiguedad_en_anios < 3 THEN
        SET porcentaje_aumento = 7.50; -- 7.5% de aumento para 1 a 2 años de antigüedad
    ELSE
        SET porcentaje_aumento = 10.00; -- 10% de aumento para 3 o más años de antigüedad
    END IF;

    RETURN porcentaje_aumento;
END$$

-- Crear la función para contar cantidad de profesores por sede
CREATE FUNCTION ContarProfesoresPorSede(ID_Sede INT)
RETURNS INT
DETERMINISTIC 
BEGIN
    DECLARE contador_profesores INT;

    -- Contar el número de profesores en la sede específica
    SELECT COUNT(*) INTO contador_profesores
    FROM SEDES_PROFESORES
    WHERE ID_Sede = ID_Sede;

    RETURN contador_profesores;
END$$

DELIMITER ;
