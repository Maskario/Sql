CREATE DATABASE bibliotheque;
USE bibliotheque;

/*
Partie 1 : Création de tables (30 points), Création de la table "Livre" et la table "Lecteur" :
*/
CREATE TABLE livres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    auteur VARCHAR(50) NOT NULL,
    annee_publication YEAR NOT NULL,
    genre VARCHAR(30),
    isbn VARCHAR(13) UNIQUE NOT NULL
);

CREATE TABLE lecteurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

/*
Partie 2 : Insertion de données (15 points), insertion de données dans la table "livres", idem pour la table "lecteurs"
*/
INSERT INTO livres (titre, auteur, annee_publication, genre, isbn) VALUES
('Le Petit Prince', 'Antoine de Saint-Exupéry', 1943, 'Conte', '9782070612758'),
('1984', 'George Orwell', 1949, 'Science-fiction', '9780451524935'),
('Harry Potter à l''école des sorciers', 'J.K. Rowling', 1997, 'Fantasy', '9782070541270');

INSERT INTO lecteurs (nom, prenom, date_naissance, email) VALUES
('Dupont", "Marie", "1990-05-15", "marie.dupont@email.com'),
('Martin", "Pierre", "1985-11-30", "pierre.martin@email.com'),
('Lefebvre", "Sophie", "1992-08-22", "sophie.lefebvre@email.com');

/*Partie 3 : Requêtes SQL (50 points) :    */

/* Affichez tous les livres de la table livres. (5 points) :    */
SELECT * FROM livres;

/* Sélectionnez le titre et l'auteur des livres publiés après 1950. (5 points) :    */
SELECT titre, auteur FROM livres WHERE annee_publication > 1950;

/* Affichez le nom et le prénom des lecteurs nés avant 1990. (5 points) :    */
SELECT nom, prenom FROM lecteurs WHERE date_naissance < '1990-01-01';

/* Mettez à jour l'email de Marie Dupont pour "marie.dupont@nouveauemail.com". (5 points) :    */
UPDATE lecteurs SET email = 'marie.dupont@nouveauemail.com' WHERE nom = 'Dupont' AND prenom = 'Marie';

/* Supprimez le livre avec l'ISBN "9780451524935" de la table livres. (5 points) :    */
DELETE FROM livres WHERE isbn = '9780451524935';

/* Affichez le nombre total de livres dans la bibliothèque. (5 points) :    */
SELECT COUNT(*) AS nombre_de_livres FROM livres;

/* Sélectionnez les livres dont le titre contient le mot "Potter". (5 points) :    */
SELECT * FROM livres WHERE titre LIKE '%Potter%';

/* Affichez les lecteurs par ordre alphabétique de leur nom de famille. (5 points) :    */
SELECT * FROM lecteurs ORDER BY nom ASC;

/* Trouvez le livre le plus ancien dans la bibliothèque. (5 points) :    */
SELECT * FROM livres ORDER BY annee_publication ASC LIMIT 1;

/* Affichez le nom complet (prénom et nom) et l'âge de chaque lecteur. (5 points) :    */
SELECT 
    CONCAT(prenom, ' ', nom) AS nom_complet, 
    TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age
FROM lecteurs;

/* Créez une requête qui affiche le nombre de livres par genre, triés par ordre décroissant du nombre de livres. (10 points) :    */
SELECT genre, COUNT(*) AS nombre_de_livres 
FROM livres 
GROUP BY genre 
ORDER BY nombre_de_livres DESC;

