1) Convertissez le diagramme de relation d'entit� en mod�le relationnel'.

wine(numw,category,year,degree)
producer(nump,firstname,lastname,region)
harvest(quantity,#numw,#nump)



create table wine(
       numw INT PRIMARY KEY,
	   category VARCHAR(22),
	   year INT,
	   degree INT
);


create table producer(
       nump INT PRIMARY KEY,
	   firstname VARCHAR(34),
	   lastname VARCHAR(34),
	   region VARCHAR(34)
);


create table harvest(
        quantity INT,
		numw INT FOREIGN KEY references wine (numw),
		nump INT FOREIGN KEY references producer (nump)
);

SELECT * FROM wine
SELECT * FROM producer
SELECT * FROM harvest


INSERT INTO wine VALUES (1,'A',2020,12),
                        (2,'B',2020,24),
						(3,'C',2020,22),
						(4,'D',2020,32);

INSERT INTO producer VALUES (1,'Remi','Mendy','Dakar'),
                            (2,'Marie','Gomis','Dakar'),
							(3,'Anne','Mendy','Fatick'),
							(4,'Jean','Sarr','Sousse'),
							(5,'Michel','Aw','Sousse'),
							(6,'Philippe','Bocande','Dakar'),
							(7,'Ben','Gomis','Dakar'),
							(8,'Germaine','Mendy','Fatick'),
							(9,'Alfred','Sene','Sousse'),
							(10,'Antoine','Sarr','Fatick');


INSERT INTO harvest VALUES (43,1,5),
                           (32,3,6),
						   (23,2,8),
						   (54,1,10),
						   (76,1,4),
						   (37,2,7),
						   (87,4,6);

2)Donnez la liste des producteurs.


SELECT *
FROM producer

3)Donnez la liste des producteurs tri�s par nom.

SELECT *
FROM producer
ORDER BY lastname ASC

4)Donnez la liste des producteurs de Sousse.

SELECT *
FROM producer
WHERE region='Sousse'

5)Calculez la quantit� totale de vin produit portant le num�ro 12.

SELECT nump,SUM(quantity) AS total_quantity
FROM harvest
WHERE nump=12
GROUP BY nump


6)Calculez la quantit� de vin produite par cat�gorie.

SELECT category,SUM(quantity) AS quantity_category
FROM wine
JOIN harvest ON harvest.numw=wine.numw
GROUP BY category




7)Quels producteurs de la r�gion de Sousse ont r�colt� au moins un vin en quantit� sup�rieure � 300 litres ? Nous souhaitons les noms et pr�noms des producteurs, tri�s par ordre alphab�tique.



SELECT firstname,lastname,region,quantity
FROM producer
JOIN harvest ON harvest.nump=producer.nump
WHERE quantity>300 AND region='Sousse'
ORDER BY lastname


8)�num�rez les num�ros de vins qui ont un degr� sup�rieur � 12 et qui ont �t� produits par le producteur num�ro 24.

SELECT wine.numw
FROM wine
JOIN harvest ON wine.numw = harvest.numw
JOIN producer ON harvest.nump = producer.nump
WHERE wine.degree > 12 AND producer.nump =6;
