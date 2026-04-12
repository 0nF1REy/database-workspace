DROP PROCEDURE IF EXISTS alo_mundo;

DELIMITER $$

CREATE PROCEDURE alo_mundo()
BEGIN
   DECLARE texto VARCHAR(20) DEFAULT 'Hello World!';
   DECLARE texto_bacana VARCHAR(50) DEFAULT 'Gintoki nunca paga o aluguel!';
   
   SELECT 'Alô mundo!';
   SELECT texto;

   SELECT 'Yorozuya resolve qualquer problema!' AS mensagem;
   SELECT texto_bacana AS mensagem;

   SELECT texto AS msg1, texto_bacana AS msg2;
END$$

DELIMITER ;

CALL alo_mundo ();