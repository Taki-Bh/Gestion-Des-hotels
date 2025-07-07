DELIMITER //

CREATE TRIGGER archive_chamb
AFTER DELETE ON chambre
FOR EACH ROW
BEGIN
    INSERT INTO chambre_archive (etat, capacité)
    VALUES (OLD.etat, OLD.capacité);
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER archive_reservation
AFTER DELETE ON reservation
FOR EACH ROW
BEGIN
    INSERT INTO reservation_archive (
        idreservation, date_deb, date_fin, CIN, idchambre
    ) VALUES (
        OLD.idreservation, OLD.date_deb, OLD.date_fin, OLD.CIN, OLD.idchambre
    );
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER client_archive
AFTER DELETE ON client
FOR EACH ROW
BEGIN
    insert into client values (OLD.CIN, OLD.nom, OLD.prenom , OLD.adresse, OLD.tel);
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER user_archive AFTER DELETE ON user FOR EACH ROW
BEGIN
    insert into user_archive values (OLD.username, OLD.password, OLD.email, OLD.role);
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER del_log BEFORE DELETE ON logs for EACH row
begin
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La suppresion des logs de la base est INTERDIT!';
END;
//

DELIMITER ;