USE prod_ShinsengumiDB;

DELIMITER $$

CREATE TRIGGER impedir_armas_restritas_recruta
BEFORE INSERT ON MembroArma
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Arsenal WHERE idArma = NEW.idArma AND restrita = TRUE) THEN
        IF (SELECT patente FROM Membro WHERE idMembro = NEW.idMembro) = 'Recruta' THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Recrutas não podem usar armas restritas!';
        END IF;
    END IF;
END $$

DELIMITER ;