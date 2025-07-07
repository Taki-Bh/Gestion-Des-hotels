

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_rooms`(
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_nb_personnes INT
)
BEGIN
    SELECT c.idchambre, c.capacité, c.etat
    FROM chambre c
    WHERE c.capacité >= p_nb_personnes
	  AND c.etat != 'R'
      AND c.idchambre NOT IN (
          SELECT r.idchambre
          FROM reservation r
          WHERE (r.date_deb< p_end_date) 
            AND (r.date_fin   > p_start_date)
      );
END

