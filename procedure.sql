CREATE DATABASE rainbank;

USE rainbank;

CREATE TABLE conta_bancaria(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(100),
    -- 10 CASAS ANTES DO . E DUAS CASAS DEPOIS
    saldo DECIMAL(10, 2)
);

DELIMITER //
CREATE PROCEDURE add_contabancaria(
	IN cb_nome VARCHAR(100),
    IN cb_saldo DECIMAL(10,2)
)BEGIN 
	INSERT INTO conta_bancaria(cliente, saldo)
	VALUES (cb_nome, cb_saldo);
END // 
DELIMITER ;

CALL add_contabancaria("Arthur Rosa", 100.00);
CALL add_contabancaria("Rafael Augusto", 400.00);

DELIMITER //
CREATE PROCEDURE update_contabancaria(
	IN cb_id INTEGER,
    IN cb_cliente VARCHAR(100), 
    IN cb_saldo DECIMAL(10, 2)
)BEGIN
	DELETE FROM conta_bancaria WHERE(id=cb_Id);
	INSERT INTO conta_bancaria(id, cliente, saldo)
    VALUES(cb_id, cb_cliente, cb_saldo);
END //
DELIMITER ;

CALL update_contabancaria(1, "Rafa", 188.00);