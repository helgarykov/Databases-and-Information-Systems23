


INSERT INTO Category (CategoryName, OralFee, WrittenFee, PhoneFee, TransportCostFee, TransportTimeFee)
VALUES ('Category 1', 410, 4.5, 400, 205, 3.13),
       ('Category 2', 290, 3.2, 250, 145, 3.13),
       ('Category 3', 110, 2, 100, 55, 3.13);



INSERT INTO Translator (Id, FirstName, LastName, Age, CityAddress, Street, HouseNr, Email, Tlf, Education)
VALUES
    (1, 'John', 'Doe', 25, 'Copenhagen', 'Main Street', '123', 'johndoe@gmail.com', '3012 1843', 'Secondary School'),
    (2, 'Jane', 'Smith', 30, 'Aarhus', 'Oak Avenue', '456', 'janesmith@gmail.com', '3012 1844', 'BA of Humanities'),
    (3, 'David', 'Andersen', 35, 'Odense', 'Maple Street', '789', 'davidandersen@gmail.com', '3012 1845', 'MA of Humanities'),
    (4, 'Lars', 'Hansen', 59, 'Aalborg', 'Birch Lane', '101', 'larshansen@gmail.com', '3012 1846', 'PhD'),
    (5, 'Mette', 'Nielsen', 68, 'Esbjerg', 'Cedar Road', '202', 'mettenielsen@gmail.com', '3012 1847', 'Secondary School'),
    (6, 'Anders', 'Pedersen', 42, 'Frederiksberg', 'Elm Street', '303', 'anderspedersen@gmail.com', '3012 1848', 'BA of Humanities'),
    (7, 'Charlotte', 'Jensen', 39, 'Horsens', 'Fir Avenue', '404', 'charlottejensen@gmail.com', '3012 1849', 'MA of Humanities'),
    (8, 'Erik', 'Mortensen', 45, 'Randers', 'Grove Road', '505', 'erikmortensen@gmail.com', '3012 1850', 'PhD'),
	(9, 'Ahmed', 'Khalid', 31, 'Copenhagen', 'Bøgegade', '601', 'ahmedkhalid@gmail.com', '4512 1851', 'Secondary School'),
    (10,'Fatima', 'Ali', 45, 'Aarhus', 'Elmegade', '702', 'fatimaali@gmail.com', '3012 1852', 'BA of Humanities'),
    (11, 'Mohammed', 'Hassan', 56, 'Odense', 'Ahornvej', '803', 'mohammedhassan@gmail.com', '3112 1853', 'MA of Humanities'),
    (12, 'Aisha', 'Abdullah', 29, 'Esbjerg', 'Lindevej', '904', 'aishaabdullah@gmail.com', '3012 1854', 'PhD'),
    (13, 'Youssef', 'Saeed', 36, 'Copenhagen', 'Egevej', '1005', 'youssefsaeed@gmail.com', '3312 1855', 'Secondary School'),
	(14,'Ivan', 'Sokolov', 33, 'Copenhagen', 'Bøgevej', '601', 'ivansokolov@gmail.com', '3012 1856', 'Secondary School'),
    (15, 'Elena', 'Popova', 28, 'Aarhus', 'Elmevej', '702', 'elenapopova@gmail.com', '3812 1857', 'BA of Humanities'),
    (16,'Sergei', 'Ivanov', 36, 'Odense', 'Ahornvej', '803', 'sergeiivanov@gmail.com', '3912 1858', 'MA of Humanities'),
    (17,'Natalia', 'Smirnova', 31, 'Esbjerg', 'Lindetræsvej', '904', 'nataliasmirnova@gmail.com', '4012 1859', 'PhD'),
    (18,'Dmitri', 'Kuznetsov', 67, 'Copenhagen', 'Egevej', '1005', 'dmitrikuznetsov@gmail.com', '6012 1860', 'Secondary School'),
	(19,'Helga', 'Ibsen', 41, 'Copenhagen', 'Lundtoftegade', '83', 'helgaibsen@gmail.com', '6033 1860', 'BA of Humanities'),
	(20,'Senta', 'Abrahamsen', 65, 'Hellerup', 'Mosevej', '102', 'sentaabrahamsen@gmail.com', '3412 2260', 'Secondary School')
;



INSERT INTO Language (NameOfLang)
VALUES ('English'),
       ('Spanish'),
       ('French'),
       ('German'),
       ('Mandarin'),
       ('Arabic'),
       ('Portuguese'),
       ('Russian'),
       ('Italian'),
       ('Dutch'),
       ('Swedish'),
       ('Norwegian'),
       ('Finnish'),
       ('Danish'),
       ('Greek'),
       ('Turkish'),
       ('Japanese'),
       ('Korean'),
       ('Thai'),
       ('Vietnamese'),
       ('Hindi'),
       ('Bengali'),
       ('Urdu'),
       ('Punjabi'),
       ('Persian'),
       ('Indonesian'),
       ('Malay'),
       ('Filipino'),
       ('Swahili'),
       ('Czech'),
       ('Polish');


INSERT INTO Translator_Competence (TranslatorId, LanguageId, CategoryId)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (2, 15, 2),
    (2, 16, 2),
    (2, 31, 2),
    (3, 4, 3),
    (3, 2, 2),
    (3, 6, 3),
    (4, 10, 1),
    (4, 11, 3),
    (4, 12, 2),
    (5, 13, 1),
    (5, 8, 2),
    (5, 15, 1),
    (6, 16, 3),
    (6, 17, 2),
    (6, 18, 3),
    (7, 9, 1),
    (7, 7, 1),
    (7, 5, 1),
    (8, 17, 2),
    (8, 19, 2),
    (8, 20, 3),
    (9, 20, 3),
    (9, 21, 3),
    (9, 30, 3),
    (10, 8, 1),
    (10, 21, 3),
    (10, 22, 3),
    (11, 23, 2),
    (11, 24, 2),
    (11, 25, 2),
    (12, 26, 3),
    (12, 2, 3),
    (12, 3, 3),
    (13, 26, 1),
    (13, 7, 1),
    (13, 9, 1),
    (14, 8, 2),
    (14, 4, 2),
    (14, 2, 2),
    (15, 18, 3),
    (15, 19, 3),
    (15, 5, 3),
    (16, 1, 1),
    (16, 6, 1),
    (16, 8, 3),
    (17, 11, 2),
    (17, 13, 2),
    (17, 30, 3),
    (18, 4, 3),
    (18, 2, 3),
    (18, 3, 3),
    (19, 1, 1),
    (19, 3, 1),
    (19, 8, 3),
    (20, 1, 2),
    (20, 2, 2),
    (20, 3, 3);

-- Insert courts
INSERT INTO Client (ContactName, Login, Password, Tlf, CityAddress, Street, HouseNr, FeeMultiplier)
VALUES
    ('Copenhagen City Court', 'cph_court', 'court123', '20 40 60 80', 'Copenhagen', 'Hovedgaden', '123', 1.2),
    ('Hilleroed Court', 'hilleroed_court', 'court456', '21 41 61 81', 'Hilleroed', 'Egevej', '456', 1.0),
    ('Helsingoer Court', 'helsingoer_court', 'court789', '22 42 62 82', 'Helsingoer', 'Bøgevej', '789', 1.1),
    ('Roskilde Court', 'roskilde_court', 'courtabc', '23 43 63 83', 'Roskilde', 'Ahornvej', '101', 0.9),
    ('Landsbyret', 'landsbyret', 'courttuv', '24 44 64 84', 'Copenhagen', 'Borgergade', '1', 1.5),
    ('Herning Court', 'herning_court', 'courtxyz', '25 45 65 85', 'Herning', 'Elmegade', '303', 1.1),
    ('Viborg Court', 'viborg_court', 'court123abc', '26 46 66 86', 'Viborg', 'Birkelunden', '404', 1.0),
    ('Aalborg Court', 'aalborg_court', 'court456def', '27 47 67 87', 'Aalborg', 'Elmevej', '505', 0.9),
	('Naestved Court', 'naestved_court', 'court789ghi', '28 48 68 88', 'Naestved', 'Kastanievej', '601', 1.2),
    ('Sonderborg Court', 'sonderborg_court', 'courtabcjkl', '29 49 69 89', 'Sonderborg', 'Lindegade', '702', 1.3);


-- Insert police stations
INSERT INTO Client (ContactName, Login, Password, Tlf, CityAddress, Street, HouseNr, FeeMultiplier)
VALUES
    ('Copenhagen Police Station', 'cph_police', 'password123', '24 56 78 90', 'Copenhagen', 'Hovedgaden', '123', 0.0),
    ('Aarhus Police Station', 'aarhus_police', 'password456', '28 36 54 72', 'Aarhus', 'Egevej', '456', 0.0),
    ('Odense Police Station', 'odense_police', 'password789', '23 45 67 89', 'Odense', 'Ahornvej', '789', 0.0),
    ('Aalborg Police Station', 'aalborg_police', 'passwordabc', '25 35 47 59', 'Aalborg', 'Elmevej', '101', 0.0),
    ('Esbjerg Police Station', 'esbjerg_police', 'passworddef', '27 38 49 50', 'Esbjerg', 'Lindevej', '202', 0.0),
    ('Frederiksberg Police Station', 'frederiksberg_police', 'pass456word', '22 33 44 55', 'Frederiksberg', 'Elmevej', '303', 0.0),
    ('Horsens Police Station', 'horsens_police', 'pass789word', '26 37 48 59', 'Horsens', 'Fyrstegade', '404', 0.1),
    ('Randers Police Station', 'randers_police', 'passabcword', '29 39 49 59', 'Randers', 'Grovevej', '505', 0.0),
	('Helsingoer Station', 'cph_central_police', 'passdefword', '21 31 41 51', 'Helsingoer', 'Bøgegade', '10', 0.0),
    ('Aarhus Central Police Station', 'aarhus_central_police', 'passxyzword', '23 33 43 53', 'Aarhus', 'Elmegade', '702', 0.0);


-- Insert Immigration Service
INSERT INTO Client (ContactName, Login, Password, Tlf, CityAddress, Street, HouseNr, FeeMultiplier)
VALUES
    ('Immigration Service', 'immigration_service', 'immigration123', '30 50 70 90', 'Naestved', 'Hovedgaden', '789', 0.0);

-- Insert Home Travel Agency
INSERT INTO Client (ContactName, Login, Password, Tlf, CityAddress, Street, HouseNr, FeeMultiplier)
VALUES
    ('Home Travel Agency', 'home_travel', 'travel456', '31 51 71 91', 'Copenhagen', 'Strandvejen', '123', 0.0);

-- Insert private persons
INSERT INTO Client (ContactName, Login, Password, Tlf, CityAddress, Street, HouseNr, FeeMultiplier)
VALUES
    ('Sophia Larsen', 'sophial', 'password135', '47 57 67 77', 'Copenhagen', 'Rosenvej', '67', 0.0),
	('Frederik Nielsen', 'frederikn', 'password246', '48 58 68 78', 'Aarhus', 'Ahornvej', '89', 0.0),
	('Emma Christensen', 'emmac', 'password357', '49 59 69 79', 'Odense', 'Birkelunden', '10', 0.0),
	('Lucas Jensen', 'lucasj', 'password468', '50 60 70 80', 'Esbjerg', 'Elmegade', '32', 0.0),
	('Maja Pedersen', 'majap', 'password321', '43 53 63 73', 'Aalborg', 'Fyrvej', '78', 0.0),
	('Nikolaj Rasmussen', 'nikolajr', 'password654', '44 54 64 74', 'Esbjerg', 'Bøgevej', '90', 1.0),
	('Laura Andersen', 'lauraa', 'password987', '45 55 65 75', 'Horsens', 'Lærkevej', '23', 0.0),
	('Oliver Madsen', 'oliverm', 'password246', '46 56 66 76', 'Randers', 'Kastanievej', '45', 0.9),
	('Lars Jensen', 'larsj', 'password123', '40 50 60 70', 'Copenhagen', 'Elmegade', '12', 0.0),
	('Emma Nielsen', 'emman', 'password456', '41 51 61 71', 'Aarhus', 'Birkevej', '34', 0.9),
	('Sofie Hansen', 'sofieh', 'password789', '42 52 62 72', 'Odense', 'Ahornvej', '56', 0.0);


INSERT INTO Task (TaskType, DateOfTask, StartTime, EndTime, Urgent, Difficult, CityAddress, Street, HouseNr, TranslatorCompetenceID, ClientId)
VALUES
    ('Oral Interpretation', '2020-05-10', '10:00', '12:00', 0, 0,  'Copenhagen', 'Hovedgaden', '123', 1, 10),
	('Oral Interpretation', '2022-09-11', '14:00', '16:00', 1, 1, 'Hilleroed', 'Egevej', '456', 4, 2),
	('Oral Interpretation', '2020-12-12', '09:00', '11:00', 0, 1, 'Helsingoer', 'Bøgevej', '789', 8, 3),
	('Phone Translation', '2022-11-01', '17:00', '19:00', 0, 1, 'Roskilde', 'Ahornvej', '101', 14, 4),
	('Oral Interpretation', '2021-01-14', '14:00', '15:30', 1, 1, 'Copenhagen', 'Borgergade', '1', 3, 5),
	('Written Translation', '2021-02-15', '06:00', '23:00', 0, 0, 'Viborg', 'Birkelunden', '404', 6, 7),
	('Oral Interpretation', '2021-03-02', '09:00', '17:00', 0, 1, 'Aalborg', 'Elmevej', '505', 9, 8),
	('Oral Interpretation', '2021-05-17', '14:00', '18:00', 1, 1, 'Aarhus', 'Egevej', '456', 12, 10),
	('Phone Translation', '2022-06-18', '10:00', '12:00', 0, 0, 'Esbjerg', 'Lindevej', '202', 15, 12),
    ('Phone Translation', '2020-06-19', '13:00', '15:00', 1, 0, 'Randers', 'Grovevej', '505', 18, 14),
	('Phone Translation', '2021-07-20', '16:00', '18:00', 0, 0, 'Horsens', 'Fyrstegade', '404', 17, 1),
	('Written Translation', '2020-01-21', '07:00', '21:00', 0, 1, 'Copenhagen', 'Rosenvej', '67', 23, 20),
	('Written Translation', '2021-02-22', '07:00', '23:00', 1, 0, 'Aarhus', 'Ahornvej', '89', 3, 21),
	('Written Translation', '2022-11-23', '11:00', '13:00', 0, 1, 'Odense', 'Birkelunden', '10', 6, 22),
	('Phone Translation', '2022-12-26', '08:00', '10:00', 0, 0, 'Esbjerg', 'Elmegade', '32', 9, 23),
	('Oral Interpretation', '2021-07-25', '12:00', '18:00', 1, 1,  'Aalborg', 'Fyrvej', '78', 12, 24),
	('Oral Interpretation', '2023-04-11', '12:00', '18:00', 0, 0,  'Esbjerg', 'Bøgevej', '90', 2, 25),
	('Phone Translation', '2023-02-04', '11:00', '14:00', 0, 0,  'Horsens', 'Lærkevej', '23', 19, 26),
	('Written Translation', '2020-02-04', '06:00', '23:00', 1, 0,  'Randers', 'Kastanievej', '45', 59, 27),
	('Written Translation', '2021-08-15', '06:00', '23:00', 0, 0,  'Copenhagen', 'Elmegade', '12', 45, 28),
	('Phone Translation', '2023-01-12', '15:00', '19:00', 0, 0,  'Aarhus', 'Birkevej', '34', 30, 29),
	('Oral Interpretation', '2020-09-18', '10:00', '16:00', 0, 0,  'Odense', 'Ahornvej', '56', 24, 30),
	('Phone Translation', '2020-10-12', '10:00', '12:00', 0, 0,  'Copenhagen', 'Strandvejen', '123', 29, 22),
	('Oral Interpretation', '2021-02-12', '10:00', '15:00', 0, 1,  'Copenhagen', 'Strandvejen', '123', 46, 22),
	('Oral Interpretation', '2023-02-27', '09:00', '17:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 5, 21),
	('Oral Interpretation', '2022-08-03', '09:00', '16:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 55, 21),
	('Oral Interpretation', '2022-11-08', '09:00', '15:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 11, 21),
	('Oral Interpretation', '2022-07-08', '09:00', '15:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 28, 21),
	('Oral Interpretation', '2023-05-08', '09:00', '15:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 1, 21),
	('Oral Interpretation', '2022-03-18', '09:00', '15:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 7, 21),
	('Oral Interpretation', '2021-05-12', '09:00', '15:00', 0, 0,  'Naestved', 'Hovedgaden', '789', 8, 21),
	('Written Translation', '2021-09-22', '06:00', '23:00', 1, 0, 'Frederiksberg', 'Elmevej', '303', 15, 6),
	('Written Translation', '2022-06-20', '06:00', '23:00', 0, 0, 'Naestved', 'Kastanievej', '601', 31, 9),
	('Written Translation', '2022-10-11', '06:00', '23:00', 0, 0, 'Odense', 'Ahornvej', '789', 8, 13),
	('Written Translation', '2023-01-04', '06:00', '23:00', 1, 0, 'Esbjerg', 'Lindevej', '202', 2, 15);
	
INSERT INTO Task_Review (DateOfReview, Body, Stars, TaskId, ClientId)
VALUES
    ('2020-05-22', 'Fremragende arbejde!', 5, 1, 1),
    ('2022-10-23', 'Fantastisk tolkning!', 5, 2, 2),
    ('2021-03-24', 'Meget tilfredsstillende oversættelse.', 4, 6, 3),
    ('2021-01-10', 'God telefontolkning.', 4, 4, 4),
    ('2021-01-26', 'Ikke tilfreds med tidsstyring. Opfylde opgaven for sent.', 2, 5, 5),
    ('2021-02-27', 'Fantastisk arbejde! Meget imponeret.', 5, 6, 6),
    ('2021-03-15', 'Udmærket tolkning.', 3, 7, 7),
    ('2021-05-29', 'Flot oversættelse.', 4, 8, 8),
    ('2022-06-30', 'Meget god telefontolkning.', 4, 9, 9),
    ('2020-06-22', 'Manglede færdiggørelsen af opgaven til tiden.', 2, 10, 10),
    ('2021-07-26', 'Udmærket arbejde.', 3, 11, 11),
    ('2020-02-02', 'God oversættelse.', 4, 12, 12),
    ('2021-03-03', 'Udmærket tolkning.', 3, 13, 13),
    ('2022-12-04', 'Fremragende arbejde! Vældig tilfreds.', 5, 17, 14),
    ('2022-12-28', 'Fantastisk oversættelse!', 5, 15, 15),
    ('2023-02-06', 'Tilfredsstillende telefontolkning.', 4, 21, 16),
    ('2023-04-20', 'Manglede at levere opgaven til tiden og indeholdte flere fejl.', 2, 14, 17),
    ('2023-02-08', 'Godt udført arbejde. Kan godt finde på at bestille samme tolk igen.', 4, 18, 18),
    ('2020-02-09', 'Meget tilfreds med oversættelsen. Udført til tiden.', 4, 19, 19),
    ('2021-08-20', 'Udmærket tolkning.', 3, 20, 20),
    ('2023-01-15', 'Fantastisk arbejde! Kan varmt anbefales.', 5, 21, 21),
    ('2020-10-12', 'God og hurtig oversættelse. Tolken kom dog lidt forsent.', 4, 22, 22),
    ('2020-10-15', 'Udmærket arbejde, men tolken var ikke særlig professionel og afbrød sagsbehandleren flere gange.', 3, 23, 23),
    ('2021-03-14', 'Fantastisk tolkning! Meget professionel.', 5, 24, 24),
    ('2022-07-15', 'God oversættelse.', 4, 33, 25),
    ('2022-08-16', 'Tilfredsstillende tolkning.', 4, 26, 26),
    ('2022-11-17', 'Manglede at opfylde opgaven rettidigt.', 2, 27, 27),
    ('2022-07-18', 'Godt udført arbejde.', 4, 28, 28),
    ('2023-06-19', 'Fremragende arbejde! Meget imponeret.', 4, 29, 29),
    ('2022-03-20', 'Udmærket tolkning.', 3, 30, 30),
    ('2021-05-21', 'Fantastisk arbejde! Kan varmt anbefales. Dygtig tolk.', 5, 31, 31),
    ('2021-09-28', 'God oversættelse.', 4, 32, 32),
    ('2022-06-23', 'Ikke særlig god oversættelse: tolken har lavet flere fejl med juridiske termer.', 1, 33, 33),
    ('2022-10-24', 'Meget tilfreds med oversættelsen.', 5, 34, 34),
    ('2023-01-25', 'Fantastisk oversættelse!', 5, 35, 35);


INSERT INTO Translator_Employment (EmploymentDate, DismissalDate, Position, CompanyName, TranslatorID)
VALUES
    ('2002-03-15', '2004-06-30', 'Tolk og oversætter', 'Dansk Translations', 1),
    ('2005-07-01', '2011-01-01', 'Oversætter', 'Sprogcentret', 2),
    ('2010-02-15', '2014-06-15', 'Tolk og oversætter', 'Language Solutions', 3),
    ('1997-01-01', '2002-01-01', 'Tolk', 'Translatørhuset', 4),
    ('2001-06-10', '2007-06-10', 'Oversætter', 'Oversættelsesbureauet', 5),
    ('2005-01-01', '2008-01-01', 'Tolk og oversætter', 'Sprogbroen', 6),
    ('2000-09-01', '2005-09-01', 'Tolk', 'Global Language Services', 7),
    ('2001-01-01', '2008-01-01', 'Oversætter', 'Polyglot Translations', 8),
    ('2003-08-15', '2005-02-15', 'Tolk og oversætter', 'Linguistica', 9),
    ('1996-02-01', '1998-02-01', 'Tolk', 'Interlang', 10),
    ('2013-04-15', '2014-03-01', 'Oversætter', 'Interlang', 11),
    ('1996-01-01', '2007-12-01', 'Tolk og oversætter', 'ProLingo', 12),
    ('1998-05-10', '2001-05-01', 'Oversætter', 'TransWorld', 13),
    ('1997-01-01', '2005-01-01', 'Tolk og oversætter', 'Globale Kommunikation', 14),
    ('1996-01-15', '2006-08-10', 'Tolk', 'TransNation', 15),
    ('2002-01-01', '2011-12-01', 'Oversætter', 'LingoMasters', 16),
    ('2005-09-01', '2006-08-01', 'Tolk og oversætter', 'EuroLingua', 17),
    ('2007-02-01', '2010-01-01', 'Oversætter', 'Interpret Solutions', 18),
    ('2010-06-15', '2012-01-01', 'Tolk', 'Language Link', 19),
    ('1996-01-01', '1999-12-15', 'Tolk og oversætter', 'MultiLingual', 20),
	

    ('2006-01-15', '2009-12-31', 'Tolk og oversætter',  'Sprogcentret', 1),
    ('2011-02-01', '2013-06-01', 'Oversætter', 'Dansk Translations', 2),
    ('2014-06-15', '2016-01-15', 'Tolk og oversætter', 'Translatørhuset', 3),
    ('2003-01-01', '2005-01-01', 'Tolk', 'Language Solutions', 4),
    ('2008-06-10', '2010-06-10', 'Oversætter', 'Sprogbroen', 5),
    ('2009-01-01', '2011-01-01', 'Tolk og oversætter','Translatørhuset', 6),
    ('2006-09-01', '2010-09-01', 'Tolk', 'Sprogbroen', 7),
    ('2009-01-01', '2010-01-01', 'Oversætter', 'Global Language Services', 8),
    ('2005-08-15', '2008-05-15', 'Tolk og oversætter', 'LingoMasters', 9),
    ('2001-02-01', '2009-01-01', 'Tolk', 'TransWorld', 10),
    ('2014-04-15', '2015-04-01', 'Oversætter', 'Language Link', 11),
    ('2008-01-01', '2011-12-01', 'Tolk og oversætter', 'TransWorld', 12),
    ('2001-05-10', '2006-05-05', 'Oversætter', 'EuroLingua', 13),
    ('2005-01-01', '2009-12-01', 'Tolk og oversætter', 'Sprogbroen', 14),
    ('2006-08-15', '2011-08-10', 'Tolk', 'LingoMasters', 15),
    ('2012-01-01', '2016-12-01', 'Oversætter', 'Language Link', 16),
    ('2006-09-01', '2007-08-01', 'Tolk og oversætter', 'MultiLingual', 17),
    ('2010-02-01', '2012-01-01', 'Oversætter', 'Language Solutions', 18),
    ('2012-01-15', '2012-07-10', 'Tolk', 'TransWorld', 19),
    ('2000-01-01', '2009-12-01', 'Tolk og oversætter', 'Dansk Translations', 20);


INSERT INTO Translator_Employment (EmploymentDate, DismissalDate, Position, CompanyName, TranslatorID)
VALUES
    ('2010-03-15', '2012-06-30', 'Tolk og oversætter', 'Dansk Translations', 1),
    ('2013-07-01', '2017-05-01', 'Oversætter', 'Sprogcentret', 2),
    ('2016-02-15', '2017-01-15', 'Tolk og oversætter', 'Language Solutions', 3),
    ('2006-01-01', '2011-01-01', 'Tolk', 'Translatørhuset', 4),
    ('2011-06-10', '2013-06-10', 'Oversætter', 'Oversættelsesbureauet', 5),
    ('2012-01-01', '2014-01-01', 'Tolk og oversætter', 'Sprogbroen', 6),
    ('2011-09-01', '2014-09-01', 'Tolk', 'Global Language Services', 7),
    ('2011-01-01', '2015-01-01', 'Oversætter', 'Polyglot Translations', 8),
    ('2008-08-15', '2016-08-10', 'Tolk og oversætter', 'Linguistica', 9),
    ('2009-02-01', '2011-01-01', 'Tolk', 'Interlang', 10),
    ('2015-04-15', '2018-04-11', 'Oversætter', 'Language Connection', 11),
    ('2012-01-01', '2017-12-01', 'Tolk og oversætter', 'ProLingo', 12),
    ('2006-05-10', '2013-05-05', 'Oversætter', 'TransWorld', 13),
    ('2010-01-01', '2016-12-01', 'Tolk og oversætter', 'Globale Kommunikation', 14),
    ('2011-08-15', '2014-08-13', 'Tolk', 'TransNation', 15),
    ('2017-01-01', '2018-12-01', 'Oversætter', 'LingoMasters', 16),
    ('2007-09-01', '2009-08-01', 'Tolk og oversætter', 'EuroLingua', 17),
    ('2012-02-01', '2014-01-01', 'Oversætter', 'Interpret Solutions', 18),
    ('2012-07-15', '2016-07-14', 'Tolk', 'Language Link', 19),
    ('2010-01-01', '2014-12-24', 'Tolk og oversætter', 'MultiLingual', 20);

INSERT INTO Translator_Employment (EmploymentDate, DismissalDate, Position, CompanyName, TranslatorID)
VALUES
    ('2013-03-15', '2021-02-05', 'Tolk og oversætter',  'Sprogcentret', 1),
    ('2017-07-01', '2021-05-01', 'Oversætter', 'Dansk Translations', 2),
    ('2017-02-15', '2019-02-15', 'Tolk og oversætter', 'Translatørhuset', 3),
    ('2012-01-01', '2019-01-01', 'Tolk', 'Language Solutions', 4),
    ('2015-06-10', '2019-06-10', 'Oversætter', 'Sprogbroen', 5),
    ('2015-01-01', '2019-01-01', 'Tolk og oversætter', 'Translatørhuset', 6),
    ('2015-09-01','2020-09-01', 'Tolk', 'Sprogbroen', 7),
    ('2016-01-01', '2021-01-01', 'Oversætter', 'Global Language Services', 8),
    ('2016-08-15', '2022-03-15', 'Tolk og oversætter', 'LingoMasters', 9),
    ('2014-02-01', '2019-02-01', 'Tolk', 'TransWorld', 10),
    ('2018-04-15', '2020-04-01', 'Oversætter', 'Language Link', 11),
    ('2018-01-01', '2020-12-01', 'Tolk og oversætter', 'TransWorld', 12),
    ('2013-05-10', '2022-05-05', 'Oversætter', 'EuroLingua', 13),
    ('2017-01-01', '2020-12-01', 'Tolk og oversætter', 'Sprogbroen', 14),
    ('2014-08-15', '2020-08-10', 'Tolk', 'LingoMasters', 15),
    ('2019-01-01', '2022-12-01', 'Oversætter', 'Language Link', 16),
    ('2009-09-01', '2022-08-01', 'Tolk og oversætter', 'MultiLingual', 17),
    ('2014-02-01', '2021-01-01', 'Oversætter', 'Language Solutions', 18),
    ('2016-07-15', '2020-07-14', 'Tolk', 'TransWorld', 19),
    ('2015-01-01', '2020-02-25', 'Tolk og oversætter', 'Dansk Translations', 20),


    ('2021-03-15', NULL, 'Tolk og oversætter', 'Easy Translate', 1),
    ('2021-07-01', NULL, 'Oversætter', 'Easy Translate', 2),
    ('2020-02-15', NULL, 'Tolk og oversætter', 'Easy Translate', 3),
    ('2020-01-01', NULL, 'Tolk', 'Easy Translate', 4),
    ('2020-06-10', NULL, 'Oversætter', 'Easy Translate', 5),
    ('2020-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 6),
    ('2021-09-01', NULL, 'Tolk', 'Easy Translate', 7),
    ('2022-01-01', NULL, 'Oversætter', 'Easy Translate', 8),
    ('2023-03-15', NULL, 'Tolk og oversætter', 'Easy Translate', 9),
    ('2020-02-01', NULL, 'Tolk', 'Easy Translate', 10),
    ('2020-04-15', NULL, 'Oversætter', 'Easy Translate', 11),
    ('2021-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 12),
    ('2022-05-10', NULL, 'Oversætter', 'Easy Translate', 13),
    ('2021-01-01', NULL, 'Tolk og oversætter', 'Easy Translate', 14),
    ('2020-08-15', NULL, 'Tolk', 'Easy Translate', 15),
    ('2023-01-01', NULL, 'Oversætter', 'Easy Translate', 16),
    ('2022-09-01', NULL, 'Tolk og oversætter', 'Easy Translate', 17),
    ('2021-02-01', NULL, 'Oversætter', 'Easy Translate', 18),
    ('2020-07-15', NULL, 'Tolk', 'Easy Translate', 19),
    ('2020-03-01', NULL, 'Tolk og oversætter', 'Easy Translate', 20);


