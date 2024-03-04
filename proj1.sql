CREATE TABLE Trail
(trailID INT AUTO_INCREMENT PRIMARY KEY,
reportID INT,
ratingID INT,
mapID INT,
parkID INT,
descriptionID INT NOT NULL,
trailName VARCHAR(250) NOT NULL,
latitude INT NOT NULL,
longitude INT NOT NULL,
distance INT NOT NULL,
difficulty INT NOT NULL,
elevationChange INT NOT NULL,
trailType VARCHAR(20) NOT NULL,
FOREIGN KEY (reportID) REFERENCES Report(reportID),
FOREIGN KEY (ratingID) REFERENCES Rating(ratingID),
FOREIGN KEY (mapID) REFERENCES Map(mapID),
FOREIGN KEY (parkID) REFERENCES Park(parkID),
FOREIGN KEY (descriptionID) REFERENCES Description(descriptionID)
);


CREATE TABLE Description
(descriptionID INT,
trailID INT NOT NULL,
markerID INT NOT NULL,
descript VARCHAR(600),
biome VARCHAR(40),
parking BOOLEAN,
restroom BOOLEAN,
picnic BOOLEAN,
FOREIGN KEY (trailID) REFERENCES Trail(trailID),
FOREIGN KEY (markerID) REFERENCES Marker(markerID)
);


CREATE TABLE Map
(mapID INT AUTO_INCREMENT PRIMARY KEY,
trailID INT NOT NULL,
mapURL VARCHAR(200) NOT NULL,
FOREIGN KEY (trailID) REFERENCES Trail(trailID)
);


CREATE TABLE Rating
(ratingID INT AUTO_INCREMENT PRIMARY KEY,
userID INT NOT NULL,
trailID INT NOT NULL,
ratingNum INT NOT NULL,
date DATE NOT NULL,
review VARCHAR(600),
FOREIGN KEY (trailID) REFERENCES Trail(trailID),
FOREIGN KEY (userID) REFERENCES User(userID)
);
--

CREATE TABLE User
(userID INT AUTO_INCREMENT PRIMARY KEY,
reportID INT,
galleryID INT,
photoID INT,
rangerID INT,
name VARCHAR(250) NOT NULL,
ratingID INT,
admin BOOLEAN NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
FOREIGN KEY (reportID) REFERENCES Report(reportID),
FOREIGN KEY (rangerID) REFERENCES Rangers(rangerID),
FOREIGN KEY (photoID) REFERENCES Photo(photoID),
FOREIGN KEY (galleryID) REFERENCES Gallery(galleryID),
FOREIGN KEY (ratingID) REFERENCES Rating(ratingID)
);


CREATE TABLE Report
(reportID INT AUTO_INCREMENT PRIMARY KEY,
userID INT NOT NULL,
trailID INT NOT NULL,
galleryID INT, 
date DATE NOT NULL,
reportDescription VARCHAR(600) NOT NULL,
alert VARCHAR(100),
condition INT,
FOREIGN KEY (trailID) REFERENCES Trail(trailID),
FOREIGN KEY (userID) REFERENCES User(userID),
FOREIGN KEY (galleryID) REFERENCES Gallery(galleryID)
);


CREATE TABLE Gallery
(galleryID INT AUTO_INCREMENT PRIMARY KEY,
photoID INT NOT NULL,
reportID INT,
userID INT NOT NULL,
galleryName VARCHAR(100),
FOREIGN KEY (photoID) REFERENCES Photo(photoID),
FOREIGN KEY (reportID) REFERENCES Report(reportID),
FOREIGN KEY (userID) REFERENCES User(userID)
);


CREATE TABLE Photo
(photoID INT AUTO_INCREMENT PRIMARY KEY,
photoName VARCHAR(100) NOT NULL,
Descript VARCHAR(600),
userID INT NOT NULL,
fileType VARCHAR NOT NULL,
dateUploaded DATE NOT NULL, 
FOREIGN KEY (userID) REFERENCES User(userID)
);


CREATE TABLE Rangers
(rangerID INT AUTO_INCREMENT PRIMARY KEY,
dateEmployed DATE NOT NULL,
userID INT NOT NULL,
FOREIGN KEY (userID) REFERENCES User(userID)
);


CREATE TABLE Park
(parkID INT AUTO_INCREMENT PRIMARY KEY,
trailID INT NOT NULL,
campsiteID INT,
parkName VARCHAR(250) NOT NULL,
parkEstablishment DATE NOT NULL,
stateUS VARCHAR(4) NOT NULL,
averageTrafficperYear INT,
FOREIGN KEY (trailID) REFERENCES Trail(trailID),
FOREIGN KEY (campsiteID) REFERENCES Campsites(campsiteID)
);


CREATE TABLE Campsites
(campsiteID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
parkID INT NOT NULL,
restroom BOOLEAN,
nameumspots INT,
numspotsopen INT,
FOREIGN KEY (parkID) REFERENCES Park(parkID)
);




CREATE TABLE Safety
(safetyID INT AUTO_INCREMENT PRIMARY KEY,
trailID INT NOT NULL,
permitID INT,
monumentID INT,
fireWarning BOOLEAN NOT NULL,
emergency VARCHAR(60),
wildLife VARCHAR(60),
closed BOOLEAN NOT NULL,
FOREIGN KEY (trailID) REFERENCES Trail(trailID),
FOREIGN KEY (permitID) REFERENCES Permit(permitID),
FOREIGN KEY (monumentID) REFERENCES Monument(monumentID),
);


CREATE TABLE Permit
(permitID INT AUTO_INCREMENT PRIMARY KEY,
startDate DATE NOT NULL,
safetyID INT,
endDate DATE NOT NULL,
permitType VARCHAR(50) NOT NULL,
FOREIGN KEY (safetyID) REFERENCES Safety(safetyID)
);


CREATE TABLE Monument
(monumentID INT AUTO_INCREMENT PRIMARY KEY,
safetyID INT NOT NULL,
monumentName VARCHAR(100) NOT NULL,
markerID INT NOT NULL,
FOREIGN KEY (safetyID) REFERENCES Safety(safetyID),
FOREIGN KEY (markerID) REFERENCES Marker(markerID)
);


CREATE TABLE Markers 
(markerID INT AUTO_INCREMENT PRIMARY KEY,
descriptionID INT NOT NULL,
monumentID INT,
markerName VARCHAR(100),
markerLatitude INT,
markerLongitude INT,
FOREIGN KEY (descriptionID) REFERENCES Description(descriptionID),
FOREIGN KEY (monumentID) REFERENCES Monument(MonumentID)
);

CREATE TABLE Stores 
(galleryID INT,
photoID INT,
FOREIGN KEY (galleryID) REFERENCES Gallery(galleryID),
FOREIGN KEY (photoID) REFERENCES Photo(photoID)
)


////////////////////
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (1, 1, 1, 1, 'Christiansen Group', 12.6661944, 108.0382475, 37, 43, 82, 'Heller Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (2, 2, 2, 2, 'Keeling LLC', 37.7181047, -25.372789, 73, 35, 84, 'Mayer, Yost and Monahan');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (3, 3, 3, 3, 'Fay and Sons', 31.2570292, 121.492796, 36, 25, 23, 'Greenholt, Predovic and Howe');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (4, 4, 4, 4, 'Miller-Kihn', 21.5032386, -104.9078597, 60, 80, 43, 'Grimes-Ankunding');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (5, 5, 5, 5, 'Thiel, Kshlerin and Jaskolski', 43.817071, 125.323544, 87, 87, 76, 'Balistreri, Abshire and Greenfelder');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (6, 6, 6, 6, 'Schowalter, Haley and Lueilwitz', 10.3492919, 123.9133184, 76, 63, 39, 'Huels, Kulas and Cassin');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (7, 7, 7, 7, 'Bernhard-Ziemann', 47.7809616, -2.1084626, 33, 29, 58, 'Walsh LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (8, 8, 8, 8, 'Marquardt-McCullough', 37.2425649, 111.8568586, 73, 70, 73, 'Ferry, Pagac and Weimann');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (9, 9, 9, 9, 'Monahan Group', 49.8905368, 2.3081396, 77, 29, 44, 'Mohr, Lubowitz and Bailey');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (10, 10, 10, 10, 'Lowe-Bednar', 15.1487342, 120.5849792, 74, 45, 98, 'Wilkinson Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (11, 11, 11, 11, 'Pfannerstill-Cremin', 35.256108, 113.322332, 87, 97, 90, 'Thompson Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (12, 12, 12, 12, 'McGlynn, Erdman and Macejkovic', -25.692754, 29.4306557, 51, 19, 92, 'Volkman, Fahey and Lynch');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (13, 13, 13, 13, 'Barton-Blanda', 43.8324929, 4.3662321, 40, 51, 10, 'Botsford-Collier');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (14, 14, 14, 14, 'Thiel-Davis', 38.0565317, 140.1011565, 21, 86, 7, 'Huels and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (15, 15, 15, 15, 'Flatley and Sons', 17.4448706, 120.4716757, 57, 48, 39, 'O''Conner Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (16, 16, 16, 16, 'Stokes, Armstrong and Daniel', -6.107046, -78.5970229, 97, 61, 13, 'Parisian, Gutkowski and Padberg');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (17, 17, 17, 17, 'Nader, Schaefer and Bosco', 46.3443125, 14.8335492, 41, 29, 31, 'Beahan LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (18, 18, 18, 18, 'Lubowitz and Sons', -8.6519695, 116.4813482, 65, 69, 70, 'Kulas Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (19, 19, 19, 19, 'Buckridge-Flatley', 4.693039, -73.51997, 56, 49, 16, 'Koelpin LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (20, 20, 20, 20, 'Rutherford Inc', 31.2371338, 121.498955, 77, 59, 48, 'Walker-Runte');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (21, 21, 21, 21, 'Altenwerth and Sons', 32.3622982, 120.5285929, 28, 32, 70, 'Cormier, Buckridge and Altenwerth');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (22, 22, 22, 22, 'Stamm-Fisher', -7.4726134, 112.6675398, 92, 70, 23, 'Jones-Sipes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (23, 23, 23, 23, 'Russel Inc', -19.3107686, -46.0489795, 19, 62, 30, 'Corwin-Wisoky');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (24, 24, 24, 24, 'Schroeder Inc', 36.0941745, 28.0162191, 75, 27, 81, 'Doyle LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (25, 25, 25, 25, 'Denesik, Corkery and Ruecker', 39.8726158, 45.3575191, 88, 85, 71, 'Swaniawski Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (26, 26, 26, 26, 'Macejkovic-Pacocha', 34.4911201, 62.6031004, 91, 74, 35, 'Abernathy-Sipes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (27, 27, 27, 27, 'Kiehn-Dickinson', 41.1694718, 75.8098141, 7, 30, 79, 'Lebsack LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (28, 28, 28, 28, 'Muller-Shields', 53.948639, 46.6995979, 1, 33, 78, 'Metz, Daniel and Pagac');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (29, 29, 29, 29, 'Leffler-Schinner', 19.3851705, -99.1837453, 57, 41, 85, 'Torp-Murphy');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (30, 30, 30, 30, 'Cremin Group', 60.5854759, 22.897837, 75, 7, 71, 'Champlin-Lindgren');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (31, 31, 31, 31, 'Torp-Moen', 22.066171, 107.781956, 22, 81, 80, 'Nienow-Carroll');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (32, 32, 32, 32, 'Macejkovic-Reinger', 35.1852624, 35.9533322, 66, 79, 45, 'Legros, Kuhic and Nitzsche');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (33, 33, 33, 33, 'Kessler LLC', 52.1028471, 21.0281495, 28, 33, 25, 'Blick LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (34, 34, 34, 34, 'Wiegand, Johns and Beer', -8.1830575, 113.9358031, 91, 13, 22, 'Robel, Schumm and Dickinson');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (35, 35, 35, 35, 'Hudson, Hartmann and Herman', 23.15998, 113.327132, 58, 46, 95, 'Rutherford, Toy and Abshire');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (36, 36, 36, 36, 'Friesen LLC', 35.22, -80.83, 91, 47, 17, 'Glover-Schimmel');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (37, 37, 37, 37, 'Daniel Group', 43.153975, -77.6120835, 32, 25, 52, 'O''Hara-King');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (38, 38, 38, 38, 'Weissnat Inc', 9.2284759, -80.0856189, 44, 1, 82, 'Gleichner, Cummerata and Labadie');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (39, 39, 39, 39, 'Kautzer, Bernhard and Pfannerstill', -10.1628, 123.5781, 32, 42, 97, 'Jones Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (40, 40, 40, 40, 'Tromp, Gleason and Reichert', 34.9852597, 133.4885513, 56, 82, 61, 'Rolfson-Waelchi');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (41, 41, 41, 41, 'Ryan, Ritchie and Wunsch', 4.5791946, 13.6767958, 78, 77, 93, 'Reichel-Stokes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (42, 42, 42, 42, 'Stroman, Stroman and Hoeger', 50.3946667, 16.0427679, 20, 3, 22, 'Rodriguez Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (43, 43, 43, 43, 'Champlin-Price', -28.7137096, -49.3091437, 66, 82, 95, 'Fisher-Wiza');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (44, 44, 44, 44, 'King, Rippin and Kassulke', 32.027934, 106.657113, 81, 86, 17, 'Berge Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (45, 45, 45, 45, 'Fadel, Kunze and Yost', 7.1864095, 100.5927222, 76, 50, 2, 'Mosciski Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (46, 46, 46, 46, 'Mueller, Carroll and Leuschke', 29.00431, 111.742951, 16, 74, 72, 'Rippin, Schuster and Marks');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (47, 47, 47, 47, 'Marquardt, Olson and Mayert', -20.0791909, 30.8384093, 85, 100, 66, 'Hartmann LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (48, 48, 48, 48, 'Considine, Hoeger and Collier', 5.003233, -76.003424, 52, 43, 50, 'Hagenes and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (49, 49, 49, 49, 'Crooks, Deckow and Schoen', 39.197212, 117.059698, 76, 84, 92, 'Konopelski, Rutherford and Thiel');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (50, 50, 50, 50, 'Skiles, Spinka and Jacobs', 16.6078107, 101.9291015, 12, 21, 92, 'Ziemann, Towne and Erdman');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (51, 51, 51, 51, 'Gerlach-Durgan', 43.0429124, 1.9038837, 9, 75, 43, 'Vandervort Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (52, 52, 52, 52, 'Swift Inc', 14.5801157, 101.003522, 15, 89, 64, 'Gibson-Grimes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (53, 53, 53, 53, 'Kuvalis, Morissette and Kunze', 36.0932201, 139.4440586, 41, 44, 55, 'Monahan, Padberg and Farrell');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (54, 54, 54, 54, 'Jast LLC', 39.66667, 22.38333, 11, 33, 43, 'Block, Barrows and McKenzie');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (55, 55, 55, 55, 'Hansen, Hegmann and Bernier', 27.69965, 108.839557, 78, 33, 59, 'Walsh Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (56, 56, 56, 56, 'Fahey-Weissnat', 61.1006924, 10.4755594, 38, 64, 68, 'Erdman Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (57, 57, 57, 57, 'Hamill-Sauer', 25.489999, 103.796167, 33, 38, 40, 'O''Connell, Satterfield and Stokes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (58, 58, 58, 58, 'Quitzon-Mueller', -1.9705786, 30.1044288, 89, 28, 38, 'Konopelski-Jaskolski');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (59, 59, 59, 59, 'Bins Group', 23.131797, 113.407143, 1, 48, 13, 'Reichert-Trantow');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (60, 60, 60, 60, 'Swaniawski Group', 6.1205312, -75.2803017, 19, 72, 11, 'Spinka Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (61, 61, 61, 61, 'Schowalter Inc', -0.6850063, 100.3273368, 48, 27, 30, 'Murray Group');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (62, 62, 62, 62, 'Treutel, Kirlin and Blick', 38.7754165, -7.41612, 50, 79, 94, 'Kutch, Osinski and Bode');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (63, 63, 63, 63, 'Lubowitz, Nicolas and Walsh', 39.2471607, -9.2641519, 7, 84, 28, 'Kuhic, Kautzer and Hermann');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (64, 64, 64, 64, 'Little Inc', 56.93333, 49.15361, 98, 80, 25, 'Ebert and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (65, 65, 65, 65, 'Hickle LLC', 35.6966721, 139.4324693, 95, 52, 42, 'Walsh, Cruickshank and Bradtke');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (66, 66, 66, 66, 'Hagenes Group', 14.700389, 121.090098, 7, 20, 57, 'Reinger Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (67, 67, 67, 67, 'Pacocha and Sons', 49.0132543, 17.4380293, 54, 4, 8, 'VonRueden-Lockman');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (68, 68, 68, 68, 'Boehm LLC', 47.0163969, -68.1430029, 92, 13, 57, 'O''Reilly-Feil');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (69, 69, 69, 69, 'O''Reilly-Lehner', -22.6118831, -46.0577071, 83, 49, 59, 'Toy LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (70, 70, 70, 70, 'Keeling-Rosenbaum', -6.939897, 106.9506175, 30, 98, 17, 'Murazik-Crooks');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (71, 71, 71, 71, 'Brown, Kub and Zboncak', 46.9821813, 35.1115128, 2, 11, 97, 'Dare-Wiegand');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (72, 72, 72, 72, 'Simonis, Becker and Ratke', 42.3242187, 59.1818543, 49, 12, 50, 'Will-Stokes');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (73, 73, 73, 73, 'Mitchell-Williamson', -8.0925, 111.9417, 7, 45, 2, 'Corwin-Tremblay');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (74, 74, 74, 74, 'Zemlak-Kuhn', 44.7767137, 20.5324028, 9, 15, 64, 'Armstrong-Hermann');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (75, 75, 75, 75, 'Kunze, Herman and Klocko', 39.5955323, -7.5303251, 22, 78, 95, 'Bogisich LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (76, 76, 76, 76, 'Mueller, Runte and Farrell', -2.9118209, 119.3250347, 2, 9, 74, 'Reinger, Predovic and Wiegand');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (77, 77, 77, 77, 'Mante LLC', 29.57991, 71.75213, 42, 62, 65, 'Willms-Jones');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (78, 78, 78, 78, 'Kris-Raynor', 34.8511873, -92.3320235, 23, 38, 37, 'Blanda and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (79, 79, 79, 79, 'Mills, Kreiger and Durgan', 42.3866449, 47.9018672, 90, 45, 54, 'Wilkinson LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (80, 80, 80, 80, 'Hills-Larson', 35.532662, 104.52848, 81, 57, 33, 'Cartwright Inc');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (81, 81, 81, 81, 'O''Kon-Zemlak', 26.272008, 118.882455, 14, 56, 5, 'Lueilwitz LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (82, 82, 82, 82, 'Schuppe, Hand and Ullrich', 31.385597, 120.980736, 20, 26, 78, 'Reinger, Johnson and Bednar');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (83, 83, 83, 83, 'Berge LLC', 50.87526, 18.41472, 23, 58, 41, 'Hand-Cremin');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (84, 84, 84, 84, 'Marks Group', -10.5297, 121.9058, 17, 39, 12, 'Pfannerstill, Tromp and Weber');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (85, 85, 85, 85, 'Schuster-Hand', 40.417358, 117.500558, 56, 65, 32, 'Gislason, Witting and Reilly');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (86, 86, 86, 86, 'Swift, Stamm and O''Hara', 14.7258963, 121.0226751, 40, 88, 64, 'Bogisich-Halvorson');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (87, 87, 87, 87, 'Hudson Inc', -11.8280231, 31.4513314, 68, 47, 8, 'Harber-Schneider');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (88, 88, 88, 88, 'Crona-Leannon', 49.1790652, 4.2094771, 46, 18, 72, 'Erdman and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (89, 89, 89, 89, 'Kertzmann and Sons', 26.132433, -81.7951054, 50, 36, 76, 'Barton, Rogahn and Funk');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (90, 90, 90, 90, 'Lynch, Ritchie and Koss', 38.8943618, -77.04997, 59, 30, 70, 'Purdy-Fritsch');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (91, 91, 91, 91, 'Lehner and Sons', 43.486492, 16.5996595, 95, 46, 18, 'Ankunding, Rogahn and Mann');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (92, 92, 92, 92, 'Welch and Sons', -8.3765619, 115.1918802, 7, 54, 79, 'Willms-Walker');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (93, 93, 93, 93, 'Grimes-Kuhlman', -6.3108571, -79.0262568, 41, 20, 7, 'Sanford LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (94, 94, 94, 94, 'Beier, Shields and Wuckert', 47.6849444, -122.2982224, 66, 17, 28, 'Tromp, Quitzon and Johns');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (95, 95, 95, 95, 'Bashirian, Bode and Baumbach', -6.3761027, 106.5849256, 46, 24, 65, 'Kutch, Rosenbaum and Cruickshank');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (96, 96, 96, 96, 'Reilly, Bauch and Walsh', -6.9949, 114.0612, 40, 17, 61, 'Walsh LLC');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (97, 97, 97, 97, 'Hessel Inc', 42.0223424, 43.1936525, 39, 47, 92, 'Conroy-Kiehn');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (98, 98, 98, 98, 'Jacobi, Mitchell and Simonis', 41.3216465, -8.4628586, 51, 34, 89, 'Halvorson-Barton');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (99, 99, 99, 99, 'Romaguera, Brakus and Predovic', -8.8325814, -35.2807624, 83, 84, 96, 'Cummerata and Sons');
insert into Trail (ratingID, mapID, parkID, descriptionID, trailName, latitude, longitude, distance, difficulty, elevationChange, trailType) values (100, 100, 100, 100, 'Berge-Hettinger', 36.088005, 111.518975, 48, 32, 21, 'Heller and Sons');

insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (1, 1, 1, 'Beahan, Kuhic and Skiles', 'Kihn, Emard and Kassulke', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (2, 2, 2, 'Hagenes-Jacobs', 'Osinski-Schiller', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (3, 3, 3, 'Hackett, Oberbrunner and Koch', 'Wilkinson-Macejkovic', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (4, 4, 4, 'Kunde Group', 'Padberg Inc', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (5, 5, 5, 'Kihn Inc', 'Rath Inc', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (6, 6, 6, 'Walter, Okuneva and Kshlerin', 'Gleason Group', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (7, 7, 7, 'Hoppe-Lueilwitz', 'Huels, Wisoky and Marks', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (8, 8, 8, 'Morar, Morar and Hyatt', 'Shanahan, Ruecker and Kautzer', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (9, 9, 9, 'Wilkinson, Price and Watsica', 'Heathcote-Harber', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (10, 10, 10, 'Price-Hansen', 'Wiza-Bartoletti', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (11, 11, 11, 'McClure LLC', 'Sanford Inc', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (12, 12, 12, 'Turcotte, Farrell and Hahn', 'West, Morar and Schmitt', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (13, 13, 13, 'Mraz, Kuvalis and Denesik', 'Ullrich-Hermiston', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (14, 14, 14, 'Schamberger LLC', 'Lang-Steuber', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (15, 15, 15, 'Paucek-Haag', 'Satterfield-Zemlak', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (16, 16, 16, 'Ankunding-Fritsch', 'Daniel-Harber', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (17, 17, 17, 'Schroeder Inc', 'Pfannerstill-Zieme', false, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (18, 18, 18, 'Gislason, Emmerich and Bernhard', 'Ledner Inc', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (19, 19, 19, 'Mante-Jerde', 'Mante-Mann', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (20, 20, 20, 'Terry Group', 'Borer-Hegmann', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (21, 21, 21, 'Parisian-Larson', 'Nolan-Koelpin', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (22, 22, 22, 'Huels-Kertzmann', 'Bins Group', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (23, 23, 23, 'Wisoky LLC', 'Christiansen-Kris', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (24, 24, 24, 'Bins Inc', 'Kling, Denesik and Aufderhar', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (25, 25, 25, 'McClure-Lang', 'Hermiston Inc', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (26, 26, 26, 'Hagenes-Toy', 'Littel and Sons', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (27, 27, 27, 'Kertzmann-Paucek', 'Boyer Group', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (28, 28, 28, 'Koepp, Friesen and Bergnaum', 'Hackett-Mayert', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (29, 29, 29, 'DuBuque-Bailey', 'Von-Schiller', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (30, 30, 30, 'Marks, Hilpert and Graham', 'Larkin-Ankunding', false, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (31, 31, 31, 'Reichel-Konopelski', 'Parker-Abernathy', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (32, 32, 32, 'Dickinson, Beatty and Ullrich', 'Waters, Bradtke and Hammes', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (33, 33, 33, 'Heaney and Sons', 'Fay, Lubowitz and Hickle', false, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (34, 34, 34, 'Torphy, Sporer and Kilback', 'Prosacco LLC', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (35, 35, 35, 'Bins-Hilpert', 'Spencer LLC', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (36, 36, 36, 'Ratke, Kutch and Blick', 'Bergstrom-Gusikowski', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (37, 37, 37, 'Oberbrunner-Krajcik', 'Purdy-Berge', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (38, 38, 38, 'Huel and Sons', 'Schuster LLC', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (39, 39, 39, 'Wehner-Hirthe', 'Brakus, Spinka and Kozey', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (40, 40, 40, 'Satterfield-Feil', 'Hintz, Bauch and Hauck', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (41, 41, 41, 'Morar, Rohan and Murazik', 'Leffler, Windler and Spinka', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (42, 42, 42, 'Ebert, Cartwright and Schaefer', 'Klein, Lockman and Bogan', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (43, 43, 43, 'Cremin-Stracke', 'Frami-Labadie', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (44, 44, 44, 'Hartmann, Kris and Jakubowski', 'Bradtke-Kshlerin', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (45, 45, 45, 'Parisian, Collier and MacGyver', 'Mosciski and Sons', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (46, 46, 46, 'Beier-Wuckert', 'Ratke and Sons', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (47, 47, 47, 'Stokes-Hegmann', 'Huel-Corwin', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (48, 48, 48, 'Rempel Inc', 'Cummings, Harris and Kozey', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (49, 49, 49, 'Marvin Group', 'Langworth, Berge and Schaden', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (50, 50, 50, 'Walsh LLC', 'Kshlerin, Heathcote and Waters', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (51, 51, 51, 'Lowe-Wunsch', 'Kunze and Sons', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (52, 52, 52, 'Hauck, Harvey and Mante', 'Baumbach and Sons', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (53, 53, 53, 'Macejkovic-Smitham', 'Schmitt, Turner and Farrell', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (54, 54, 54, 'Bogisich, Kuhlman and Runolfsdottir', 'Cassin, Corkery and Considine', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (55, 55, 55, 'Roberts, Batz and Botsford', 'Wisoky-Sipes', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (56, 56, 56, 'McDermott, Orn and Paucek', 'Block, Jerde and Grimes', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (57, 57, 57, 'Feil-Reilly', 'Kuhn LLC', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (58, 58, 58, 'Jacobi, Cremin and Spencer', 'Johns, Gutmann and Ratke', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (59, 59, 59, 'Klocko, Wuckert and Ferry', 'Price and Sons', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (60, 60, 60, 'Mohr Inc', 'Hane-Cronin', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (61, 61, 61, 'Daniel Inc', 'Bergnaum-Ferry', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (62, 62, 62, 'Russel LLC', 'Berge, O''Connell and Graham', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (63, 63, 63, 'Skiles, Prohaska and Bernhard', 'Durgan and Sons', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (64, 64, 64, 'Hodkiewicz and Sons', 'Williamson-Franecki', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (65, 65, 65, 'Trantow, Wuckert and Gutmann', 'Douglas, Hirthe and Wiegand', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (66, 66, 66, 'Abbott, Schaefer and Trantow', 'McLaughlin, Towne and Dibbert', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (67, 67, 67, 'Grant, Cruickshank and West', 'Bergstrom Inc', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (68, 68, 68, 'Gulgowski-Stark', 'Wilkinson LLC', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (69, 69, 69, 'McClure-Jones', 'Barrows-Hermiston', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (70, 70, 70, 'Cremin-Kilback', 'Grimes-Rolfson', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (71, 71, 71, 'Stamm Inc', 'Kub-Wolff', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (72, 72, 72, 'Murray-Rippin', 'Reichel Inc', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (73, 73, 73, 'Beatty-Conn', 'O''Keefe-Green', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (74, 74, 74, 'Wehner-Murray', 'Pacocha-Schulist', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (75, 75, 75, 'Stoltenberg-Dooley', 'Jacobi-Quitzon', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (76, 76, 76, 'O''Conner and Sons', 'Kessler Inc', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (77, 77, 77, 'Rau-Larson', 'Emmerich, Gorczany and Wisoky', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (78, 78, 78, 'Kautzer, O''Conner and Stokes', 'Shields-Ledner', false, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (79, 79, 79, 'Tillman-Weimann', 'Mante and Sons', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (80, 80, 80, 'Luettgen Inc', 'Bayer Inc', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (81, 81, 81, 'Carter-Auer', 'Raynor, Kshlerin and Schumm', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (82, 82, 82, 'Lynch-Homenick', 'Keebler, Mraz and Reichert', false, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (83, 83, 83, 'Donnelly and Sons', 'Borer, Howe and Shanahan', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (84, 84, 84, 'Ankunding, Dickinson and Cartwright', 'Baumbach LLC', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (85, 85, 85, 'Runolfsdottir, Johns and Watsica', 'Turner-Bernhard', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (86, 86, 86, 'Ferry-Grant', 'Dickinson and Sons', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (87, 87, 87, 'Mayert-Erdman', 'Howell-Durgan', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (88, 88, 88, 'Metz Group', 'Torphy, Cruickshank and Goldner', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (89, 89, 89, 'Mayer, Botsford and Klocko', 'Botsford and Sons', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (90, 90, 90, 'Vandervort Inc', 'Schuppe Group', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (91, 91, 91, 'Larkin, Metz and Kilback', 'Robel Group', false, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (92, 92, 92, 'Kris-Cassin', 'Kub-Bosco', false, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (93, 93, 93, 'Deckow Inc', 'Krajcik, Bruen and Jacobs', false, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (94, 94, 94, 'Stroman-Hayes', 'Johnson, Daugherty and Shanahan', true, false, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (95, 95, 95, 'Tremblay-Wisozk', 'Windler and Sons', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (96, 96, 96, 'Bauch-Pagac', 'Hagenes Group', true, true, false);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (97, 97, 97, 'Bednar, Kemmer and Langworth', 'Keebler, Denesik and Balistreri', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (98, 98, 98, 'Jacobs, MacGyver and Kuhic', 'Herman LLC', true, false, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (99, 99, 99, 'Homenick-Schmitt', 'Legros and Sons', true, true, true);
insert into Description (descriptionID, trailID, markerID, descript, biome, parking, restroom, picnic) values (100, 100, 100, 'Wilderman and Sons', 'Dooley Group', false, false, true);

insert into Map (mapID, trailID, mapURL) values (1, 1, 'https://wiley.com/pede/lobortis/ligula/sit/amet.xml?vel=ipsum&lectus=primis&in=in&quam=faucibus&fringilla=orci&rhoncus=luctus&mauris=et&enim=ultrices&leo=posuere&rhoncus=cubilia&sed=curae&vestibulum=duis&sit=faucibus&amet=accumsan&cursus=odio&id=curabitur&turpis=convallis&integer=duis&aliquet=consequat&massa=dui&id=nec&lobortis=nisi&convallis=volutpat&tortor=eleifend&risus=donec&dapibus=ut&augue=dolor&vel=morbi&accumsan=vel&tellus=lectus&nisi=in&eu=quam&orci=fringilla&mauris=rhoncus&lacinia=mauris&sapien=enim&quis=leo&libero=rhoncus');
insert into Map (mapID, trailID, mapURL) values (2, 2, 'http://simplemachines.org/lacinia/aenean/sit/amet.jpg?mollis=turpis&molestie=adipiscing&lorem=lorem&quisque=vitae&ut=mattis&erat=nibh&curabitur=ligula&gravida=nec&nisi=sem&at=duis&nibh=aliquam&in=convallis&hac=nunc&habitasse=proin&platea=at&dictumst=turpis&aliquam=a&augue=pede&quam=posuere&sollicitudin=nonummy&vitae=integer&consectetuer=non&eget=velit&rutrum=donec&at=diam&lorem=neque&integer=vestibulum&tincidunt=eget&ante=vulputate&vel=ut&ipsum=ultrices&praesent=vel&blandit=augue&lacinia=vestibulum&erat=ante&vestibulum=ipsum&sed=primis&magna=in&at=faucibus&nunc=orci&commodo=luctus&placerat=et&praesent=ultrices&blandit=posuere&nam=cubilia&nulla=curae&integer=donec&pede=pharetra&justo=magna&lacinia=vestibulum&eget=aliquet&tincidunt=ultrices&eget=erat&tempus=tortor&vel=sollicitudin&pede=mi&morbi=sit&porttitor=amet&lorem=lobortis&id=sapien&ligula=sapien&suspendisse=non&ornare=mi&consequat=integer&lectus=ac&in=neque&est=duis&risus=bibendum&auctor=morbi&sed=non&tristique=quam&in=nec');
insert into Map (mapID, trailID, mapURL) values (3, 3, 'http://youtube.com/fusce/lacus/purus/aliquet.aspx?et=et&commodo=magnis&vulputate=dis&justo=parturient&in=montes&blandit=nascetur&ultrices=ridiculus&enim=mus&lorem=etiam&ipsum=vel&dolor=augue&sit=vestibulum&amet=rutrum&consectetuer=rutrum&adipiscing=neque&elit=aenean&proin=auctor&interdum=gravida&mauris=sem&non=praesent&ligula=id&pellentesque=massa&ultrices=id&phasellus=nisl&id=venenatis&sapien=lacinia&in=aenean&sapien=sit&iaculis=amet&congue=justo&vivamus=morbi&metus=ut&arcu=odio&adipiscing=cras&molestie=mi&hendrerit=pede&at=malesuada&vulputate=in&vitae=imperdiet&nisl=et&aenean=commodo&lectus=vulputate&pellentesque=justo&eget=in&nunc=blandit&donec=ultrices&quis=enim&orci=lorem&eget=ipsum&orci=dolor&vehicula=sit&condimentum=amet&curabitur=consectetuer&in=adipiscing&libero=elit&ut=proin&massa=interdum&volutpat=mauris&convallis=non&morbi=ligula&odio=pellentesque&odio=ultrices&elementum=phasellus&eu=id&interdum=sapien&eu=in&tincidunt=sapien&in=iaculis&leo=congue&maecenas=vivamus&pulvinar=metus&lobortis=arcu&est=adipiscing&phasellus=molestie&sit=hendrerit&amet=at&erat=vulputate');
insert into Map (mapID, trailID, mapURL) values (4, 4, 'https://booking.com/amet.html?sit=magna&amet=vestibulum&justo=aliquet&morbi=ultrices&ut=erat&odio=tortor&cras=sollicitudin&mi=mi&pede=sit&malesuada=amet&in=lobortis&imperdiet=sapien&et=sapien&commodo=non&vulputate=mi&justo=integer&in=ac&blandit=neque&ultrices=duis&enim=bibendum&lorem=morbi&ipsum=non&dolor=quam&sit=nec&amet=dui&consectetuer=luctus&adipiscing=rutrum&elit=nulla&proin=tellus&interdum=in&mauris=sagittis&non=dui&ligula=vel&pellentesque=nisl&ultrices=duis&phasellus=ac&id=nibh&sapien=fusce&in=lacus&sapien=purus&iaculis=aliquet&congue=at&vivamus=feugiat&metus=non&arcu=pretium&adipiscing=quis&molestie=lectus&hendrerit=suspendisse&at=potenti&vulputate=in&vitae=eleifend');
insert into Map (mapID, trailID, mapURL) values (5, 5, 'http://cdc.gov/sit/amet.json?vitae=ut&mattis=rhoncus&nibh=aliquet&ligula=pulvinar&nec=sed&sem=nisl&duis=nunc&aliquam=rhoncus&convallis=dui&nunc=vel&proin=sem&at=sed&turpis=sagittis&a=nam&pede=congue&posuere=risus&nonummy=semper&integer=porta&non=volutpat&velit=quam&donec=pede&diam=lobortis&neque=ligula&vestibulum=sit&eget=amet&vulputate=eleifend&ut=pede&ultrices=libero&vel=quis&augue=orci&vestibulum=nullam&ante=molestie&ipsum=nibh&primis=in&in=lectus&faucibus=pellentesque&orci=at&luctus=nulla&et=suspendisse&ultrices=potenti&posuere=cras&cubilia=in&curae=purus&donec=eu&pharetra=magna&magna=vulputate&vestibulum=luctus&aliquet=cum&ultrices=sociis&erat=natoque&tortor=penatibus&sollicitudin=et&mi=magnis&sit=dis&amet=parturient&lobortis=montes&sapien=nascetur&sapien=ridiculus&non=mus&mi=vivamus&integer=vestibulum&ac=sagittis&neque=sapien&duis=cum&bibendum=sociis&morbi=natoque&non=penatibus&quam=et');
insert into Map (mapID, trailID, mapURL) values (6, 6, 'http://wired.com/pede/venenatis/non/sodales/sed/tincidunt/eu.xml?aliquam=nunc&augue=purus&quam=phasellus&sollicitudin=in&vitae=felis&consectetuer=donec&eget=semper&rutrum=sapien&at=a&lorem=libero&integer=nam&tincidunt=dui&ante=proin&vel=leo&ipsum=odio&praesent=porttitor&blandit=id&lacinia=consequat&erat=in&vestibulum=consequat&sed=ut&magna=nulla&at=sed&nunc=accumsan&commodo=felis&placerat=ut&praesent=at&blandit=dolor&nam=quis&nulla=odio&integer=consequat&pede=varius&justo=integer&lacinia=ac&eget=leo&tincidunt=pellentesque&eget=ultrices&tempus=mattis&vel=odio&pede=donec&morbi=vitae&porttitor=nisi&lorem=nam&id=ultrices&ligula=libero&suspendisse=non&ornare=mattis&consequat=pulvinar&lectus=nulla&in=pede&est=ullamcorper&risus=augue&auctor=a&sed=suscipit&tristique=nulla&in=elit&tempus=ac&sit=nulla&amet=sed&sem=vel&fusce=enim&consequat=sit&nulla=amet&nisl=nunc&nunc=viverra&nisl=dapibus&duis=nulla&bibendum=suscipit&felis=ligula&sed=in&interdum=lacus&venenatis=curabitur&turpis=at&enim=ipsum&blandit=ac&mi=tellus&in=semper&porttitor=interdum&pede=mauris&justo=ullamcorper&eu=purus');
insert into Map (mapID, trailID, mapURL) values (7, 7, 'http://delicious.com/justo/lacinia/eget/tincidunt.jsp?ut=porttitor&nulla=lacus&sed=at&accumsan=turpis&felis=donec&ut=posuere&at=metus&dolor=vitae&quis=ipsum&odio=aliquam&consequat=non&varius=mauris&integer=morbi&ac=non&leo=lectus&pellentesque=aliquam&ultrices=sit&mattis=amet&odio=diam&donec=in&vitae=magna&nisi=bibendum&nam=imperdiet&ultrices=nullam&libero=orci&non=pede&mattis=venenatis&pulvinar=non&nulla=sodales&pede=sed&ullamcorper=tincidunt&augue=eu&a=felis');
insert into Map (mapID, trailID, mapURL) values (8, 8, 'https://google.es/sit.json?proin=ut&leo=blandit&odio=non&porttitor=interdum&id=in&consequat=ante&in=vestibulum&consequat=ante&ut=ipsum&nulla=primis&sed=in&accumsan=faucibus&felis=orci&ut=luctus&at=et&dolor=ultrices&quis=posuere&odio=cubilia&consequat=curae&varius=duis&integer=faucibus&ac=accumsan&leo=odio&pellentesque=curabitur&ultrices=convallis&mattis=duis&odio=consequat&donec=dui&vitae=nec&nisi=nisi&nam=volutpat&ultrices=eleifend&libero=donec&non=ut&mattis=dolor&pulvinar=morbi&nulla=vel&pede=lectus&ullamcorper=in&augue=quam&a=fringilla&suscipit=rhoncus&nulla=mauris&elit=enim&ac=leo&nulla=rhoncus&sed=sed&vel=vestibulum&enim=sit&sit=amet&amet=cursus&nunc=id&viverra=turpis&dapibus=integer&nulla=aliquet&suscipit=massa&ligula=id&in=lobortis&lacus=convallis&curabitur=tortor&at=risus&ipsum=dapibus&ac=augue&tellus=vel&semper=accumsan&interdum=tellus&mauris=nisi&ullamcorper=eu&purus=orci&sit=mauris&amet=lacinia&nulla=sapien&quisque=quis&arcu=libero&libero=nullam&rutrum=sit&ac=amet&lobortis=turpis&vel=elementum&dapibus=ligula&at=vehicula&diam=consequat&nam=morbi');
insert into Map (mapID, trailID, mapURL) values (9, 9, 'https://deliciousdays.com/non/mi/integer/ac/neque/duis.xml?condimentum=ante&curabitur=ipsum&in=primis&libero=in&ut=faucibus&massa=orci&volutpat=luctus&convallis=et&morbi=ultrices&odio=posuere&odio=cubilia&elementum=curae&eu=nulla&interdum=dapibus&eu=dolor&tincidunt=vel&in=est&leo=donec&maecenas=odio&pulvinar=justo&lobortis=sollicitudin&est=ut&phasellus=suscipit&sit=a&amet=feugiat&erat=et&nulla=eros&tempus=vestibulum&vivamus=ac&in=est&felis=lacinia&eu=nisi&sapien=venenatis&cursus=tristique&vestibulum=fusce&proin=congue&eu=diam&mi=id&nulla=ornare&ac=imperdiet&enim=sapien&in=urna&tempor=pretium&turpis=nisl&nec=ut&euismod=volutpat&scelerisque=sapien&quam=arcu&turpis=sed&adipiscing=augue&lorem=aliquam&vitae=erat&mattis=volutpat&nibh=in&ligula=congue&nec=etiam&sem=justo&duis=etiam&aliquam=pretium&convallis=iaculis&nunc=justo&proin=in');
insert into Map (mapID, trailID, mapURL) values (10, 10, 'http://ning.com/duis/aliquam/convallis/nunc/proin/at.xml?nibh=venenatis&in=non&lectus=sodales&pellentesque=sed&at=tincidunt&nulla=eu&suspendisse=felis&potenti=fusce&cras=posuere&in=felis&purus=sed&eu=lacus&magna=morbi&vulputate=sem&luctus=mauris&cum=laoreet&sociis=ut&natoque=rhoncus&penatibus=aliquet&et=pulvinar&magnis=sed&dis=nisl&parturient=nunc&montes=rhoncus&nascetur=dui&ridiculus=vel&mus=sem&vivamus=sed&vestibulum=sagittis&sagittis=nam&sapien=congue&cum=risus&sociis=semper&natoque=porta&penatibus=volutpat');
insert into Map (mapID, trailID, mapURL) values (11, 11, 'http://google.de/morbi/non/quam/nec/dui.jpg?augue=nibh&vel=quisque&accumsan=id&tellus=justo&nisi=sit&eu=amet&orci=sapien&mauris=dignissim&lacinia=vestibulum&sapien=vestibulum&quis=ante&libero=ipsum&nullam=primis&sit=in&amet=faucibus&turpis=orci&elementum=luctus&ligula=et&vehicula=ultrices&consequat=posuere&morbi=cubilia&a=curae&ipsum=nulla&integer=dapibus&a=dolor&nibh=vel&in=est&quis=donec&justo=odio&maecenas=justo&rhoncus=sollicitudin&aliquam=ut&lacus=suscipit&morbi=a&quis=feugiat&tortor=et&id=eros&nulla=vestibulum&ultrices=ac&aliquet=est&maecenas=lacinia&leo=nisi&odio=venenatis&condimentum=tristique&id=fusce&luctus=congue&nec=diam&molestie=id&sed=ornare&justo=imperdiet&pellentesque=sapien&viverra=urna&pede=pretium&ac=nisl&diam=ut&cras=volutpat&pellentesque=sapien');
insert into Map (mapID, trailID, mapURL) values (12, 12, 'http://eventbrite.com/faucibus.jsp?sapien=platea&cum=dictumst&sociis=morbi&natoque=vestibulum&penatibus=velit&et=id&magnis=pretium&dis=iaculis&parturient=diam&montes=erat&nascetur=fermentum&ridiculus=justo&mus=nec&etiam=condimentum&vel=neque&augue=sapien&vestibulum=placerat&rutrum=ante&rutrum=nulla&neque=justo&aenean=aliquam&auctor=quis&gravida=turpis&sem=eget&praesent=elit&id=sodales&massa=scelerisque&id=mauris&nisl=sit&venenatis=amet&lacinia=eros&aenean=suspendisse&sit=accumsan&amet=tortor&justo=quis&morbi=turpis&ut=sed&odio=ante&cras=vivamus&mi=tortor&pede=duis&malesuada=mattis&in=egestas&imperdiet=metus&et=aenean&commodo=fermentum&vulputate=donec&justo=ut&in=mauris&blandit=eget&ultrices=massa&enim=tempor&lorem=convallis&ipsum=nulla&dolor=neque&sit=libero&amet=convallis&consectetuer=eget&adipiscing=eleifend&elit=luctus&proin=ultricies&interdum=eu&mauris=nibh&non=quisque&ligula=id&pellentesque=justo&ultrices=sit&phasellus=amet&id=sapien&sapien=dignissim&in=vestibulum&sapien=vestibulum&iaculis=ante&congue=ipsum&vivamus=primis&metus=in&arcu=faucibus&adipiscing=orci&molestie=luctus&hendrerit=et');
insert into Map (mapID, trailID, mapURL) values (13, 13, 'http://hexun.com/non/velit.xml?sit=orci&amet=luctus&eleifend=et&pede=ultrices&libero=posuere&quis=cubilia&orci=curae&nullam=nulla&molestie=dapibus&nibh=dolor&in=vel&lectus=est&pellentesque=donec&at=odio&nulla=justo&suspendisse=sollicitudin&potenti=ut&cras=suscipit&in=a&purus=feugiat&eu=et&magna=eros&vulputate=vestibulum&luctus=ac&cum=est&sociis=lacinia&natoque=nisi&penatibus=venenatis&et=tristique&magnis=fusce&dis=congue&parturient=diam&montes=id&nascetur=ornare&ridiculus=imperdiet&mus=sapien&vivamus=urna&vestibulum=pretium&sagittis=nisl&sapien=ut&cum=volutpat&sociis=sapien&natoque=arcu&penatibus=sed&et=augue&magnis=aliquam&dis=erat&parturient=volutpat&montes=in&nascetur=congue&ridiculus=etiam&mus=justo&etiam=etiam&vel=pretium&augue=iaculis&vestibulum=justo&rutrum=in&rutrum=hac&neque=habitasse&aenean=platea&auctor=dictumst&gravida=etiam&sem=faucibus&praesent=cursus&id=urna&massa=ut&id=tellus&nisl=nulla&venenatis=ut&lacinia=erat&aenean=id&sit=mauris&amet=vulputate&justo=elementum&morbi=nullam&ut=varius');
insert into Map (mapID, trailID, mapURL) values (14, 14, 'https://1und1.de/erat/tortor/sollicitudin.json?ac=ac&nibh=consequat&fusce=metus&lacus=sapien&purus=ut&aliquet=nunc&at=vestibulum&feugiat=ante&non=ipsum&pretium=primis&quis=in&lectus=faucibus&suspendisse=orci&potenti=luctus&in=et&eleifend=ultrices&quam=posuere&a=cubilia&odio=curae&in=mauris');
insert into Map (mapID, trailID, mapURL) values (15, 15, 'https://amazon.co.jp/amet.png?condimentum=parturient&id=montes&luctus=nascetur&nec=ridiculus&molestie=mus&sed=etiam&justo=vel&pellentesque=augue&viverra=vestibulum&pede=rutrum&ac=rutrum&diam=neque&cras=aenean&pellentesque=auctor&volutpat=gravida&dui=sem&maecenas=praesent&tristique=id&est=massa&et=id&tempus=nisl&semper=venenatis&est=lacinia&quam=aenean&pharetra=sit&magna=amet&ac=justo&consequat=morbi&metus=ut&sapien=odio&ut=cras&nunc=mi&vestibulum=pede&ante=malesuada&ipsum=in&primis=imperdiet&in=et&faucibus=commodo&orci=vulputate&luctus=justo&et=in&ultrices=blandit&posuere=ultrices&cubilia=enim&curae=lorem&mauris=ipsum&viverra=dolor&diam=sit&vitae=amet&quam=consectetuer&suspendisse=adipiscing&potenti=elit&nullam=proin&porttitor=interdum&lacus=mauris&at=non&turpis=ligula&donec=pellentesque&posuere=ultrices&metus=phasellus&vitae=id&ipsum=sapien&aliquam=in&non=sapien&mauris=iaculis&morbi=congue&non=vivamus&lectus=metus&aliquam=arcu&sit=adipiscing&amet=molestie&diam=hendrerit');
insert into Map (mapID, trailID, mapURL) values (16, 16, 'https://blogspot.com/massa/tempor/convallis/nulla.jpg?at=donec&vulputate=odio&vitae=justo&nisl=sollicitudin&aenean=ut&lectus=suscipit&pellentesque=a&eget=feugiat&nunc=et&donec=eros&quis=vestibulum&orci=ac&eget=est&orci=lacinia&vehicula=nisi&condimentum=venenatis&curabitur=tristique&in=fusce&libero=congue&ut=diam&massa=id&volutpat=ornare&convallis=imperdiet&morbi=sapien&odio=urna&odio=pretium&elementum=nisl&eu=ut&interdum=volutpat&eu=sapien&tincidunt=arcu&in=sed&leo=augue&maecenas=aliquam&pulvinar=erat&lobortis=volutpat&est=in&phasellus=congue&sit=etiam&amet=justo&erat=etiam&nulla=pretium&tempus=iaculis&vivamus=justo&in=in');
insert into Map (mapID, trailID, mapURL) values (17, 17, 'http://mozilla.com/in.png?cum=in&sociis=eleifend&natoque=quam&penatibus=a&et=odio&magnis=in&dis=hac&parturient=habitasse&montes=platea&nascetur=dictumst&ridiculus=maecenas&mus=ut&etiam=massa&vel=quis&augue=augue&vestibulum=luctus&rutrum=tincidunt&rutrum=nulla&neque=mollis&aenean=molestie&auctor=lorem&gravida=quisque&sem=ut&praesent=erat&id=curabitur&massa=gravida&id=nisi&nisl=at&venenatis=nibh&lacinia=in&aenean=hac&sit=habitasse&amet=platea&justo=dictumst&morbi=aliquam&ut=augue&odio=quam&cras=sollicitudin&mi=vitae&pede=consectetuer&malesuada=eget&in=rutrum&imperdiet=at&et=lorem&commodo=integer&vulputate=tincidunt&justo=ante&in=vel&blandit=ipsum&ultrices=praesent&enim=blandit&lorem=lacinia&ipsum=erat&dolor=vestibulum&sit=sed&amet=magna&consectetuer=at&adipiscing=nunc&elit=commodo&proin=placerat&interdum=praesent&mauris=blandit&non=nam&ligula=nulla&pellentesque=integer&ultrices=pede&phasellus=justo&id=lacinia&sapien=eget&in=tincidunt&sapien=eget&iaculis=tempus&congue=vel&vivamus=pede&metus=morbi&arcu=porttitor&adipiscing=lorem&molestie=id&hendrerit=ligula&at=suspendisse&vulputate=ornare&vitae=consequat&nisl=lectus&aenean=in');
insert into Map (mapID, trailID, mapURL) values (18, 18, 'https://cafepress.com/hac/habitasse/platea/dictumst.html?cras=luctus&non=et&velit=ultrices&nec=posuere&nisi=cubilia&vulputate=curae&nonummy=donec&maecenas=pharetra&tincidunt=magna&lacus=vestibulum&at=aliquet&velit=ultrices&vivamus=erat&vel=tortor&nulla=sollicitudin&eget=mi&eros=sit&elementum=amet&pellentesque=lobortis&quisque=sapien&porta=sapien&volutpat=non&erat=mi&quisque=integer&erat=ac&eros=neque&viverra=duis&eget=bibendum&congue=morbi&eget=non&semper=quam&rutrum=nec&nulla=dui');
insert into Map (mapID, trailID, mapURL) values (19, 19, 'http://github.com/elit/sodales/scelerisque/mauris/sit.json?ac=justo&nibh=pellentesque&fusce=viverra&lacus=pede&purus=ac&aliquet=diam&at=cras&feugiat=pellentesque&non=volutpat&pretium=dui&quis=maecenas&lectus=tristique&suspendisse=est&potenti=et&in=tempus&eleifend=semper&quam=est&a=quam&odio=pharetra&in=magna&hac=ac&habitasse=consequat&platea=metus&dictumst=sapien&maecenas=ut&ut=nunc&massa=vestibulum&quis=ante&augue=ipsum&luctus=primis&tincidunt=in&nulla=faucibus&mollis=orci&molestie=luctus&lorem=et&quisque=ultrices&ut=posuere&erat=cubilia&curabitur=curae&gravida=mauris&nisi=viverra&at=diam&nibh=vitae&in=quam&hac=suspendisse&habitasse=potenti&platea=nullam&dictumst=porttitor&aliquam=lacus&augue=at&quam=turpis&sollicitudin=donec&vitae=posuere&consectetuer=metus&eget=vitae&rutrum=ipsum&at=aliquam&lorem=non&integer=mauris&tincidunt=morbi&ante=non&vel=lectus&ipsum=aliquam&praesent=sit&blandit=amet&lacinia=diam&erat=in&vestibulum=magna&sed=bibendum&magna=imperdiet&at=nullam&nunc=orci&commodo=pede&placerat=venenatis&praesent=non&blandit=sodales&nam=sed&nulla=tincidunt&integer=eu&pede=felis&justo=fusce&lacinia=posuere&eget=felis&tincidunt=sed');
insert into Map (mapID, trailID, mapURL) values (20, 20, 'https://economist.com/consectetuer.png?magna=duis&at=aliquam&nunc=convallis&commodo=nunc&placerat=proin&praesent=at&blandit=turpis&nam=a&nulla=pede&integer=posuere&pede=nonummy&justo=integer&lacinia=non&eget=velit&tincidunt=donec&eget=diam&tempus=neque&vel=vestibulum&pede=eget&morbi=vulputate&porttitor=ut&lorem=ultrices&id=vel&ligula=augue&suspendisse=vestibulum&ornare=ante');
insert into Map (mapID, trailID, mapURL) values (21, 21, 'http://timesonline.co.uk/pede/lobortis/ligula/sit.png?est=lacinia&donec=eget&odio=tincidunt&justo=eget&sollicitudin=tempus&ut=vel&suscipit=pede&a=morbi&feugiat=porttitor&et=lorem&eros=id&vestibulum=ligula&ac=suspendisse&est=ornare&lacinia=consequat&nisi=lectus&venenatis=in&tristique=est&fusce=risus&congue=auctor&diam=sed&id=tristique&ornare=in&imperdiet=tempus&sapien=sit&urna=amet&pretium=sem&nisl=fusce&ut=consequat&volutpat=nulla&sapien=nisl&arcu=nunc&sed=nisl&augue=duis&aliquam=bibendum&erat=felis&volutpat=sed&in=interdum&congue=venenatis&etiam=turpis&justo=enim&etiam=blandit&pretium=mi&iaculis=in&justo=porttitor&in=pede&hac=justo&habitasse=eu&platea=massa&dictumst=donec&etiam=dapibus&faucibus=duis&cursus=at&urna=velit&ut=eu&tellus=est&nulla=congue&ut=elementum&erat=in&id=hac&mauris=habitasse&vulputate=platea&elementum=dictumst&nullam=morbi&varius=vestibulum&nulla=velit&facilisi=id&cras=pretium&non=iaculis&velit=diam&nec=erat&nisi=fermentum&vulputate=justo&nonummy=nec&maecenas=condimentum&tincidunt=neque&lacus=sapien&at=placerat&velit=ante&vivamus=nulla&vel=justo&nulla=aliquam&eget=quis&eros=turpis&elementum=eget&pellentesque=elit&quisque=sodales&porta=scelerisque&volutpat=mauris&erat=sit&quisque=amet&erat=eros&eros=suspendisse');
insert into Map (mapID, trailID, mapURL) values (22, 22, 'http://jalbum.net/diam/nam/tristique.json?venenatis=nulla&non=quisque&sodales=arcu&sed=libero&tincidunt=rutrum&eu=ac&felis=lobortis&fusce=vel&posuere=dapibus&felis=at&sed=diam&lacus=nam&morbi=tristique&sem=tortor&mauris=eu&laoreet=pede');
insert into Map (mapID, trailID, mapURL) values (23, 23, 'http://bandcamp.com/potenti/cras.js?elementum=volutpat&eu=convallis&interdum=morbi&eu=odio&tincidunt=odio&in=elementum&leo=eu&maecenas=interdum&pulvinar=eu&lobortis=tincidunt&est=in&phasellus=leo&sit=maecenas&amet=pulvinar&erat=lobortis&nulla=est&tempus=phasellus&vivamus=sit&in=amet&felis=erat&eu=nulla&sapien=tempus&cursus=vivamus&vestibulum=in&proin=felis&eu=eu&mi=sapien&nulla=cursus&ac=vestibulum&enim=proin&in=eu');
insert into Map (mapID, trailID, mapURL) values (24, 24, 'http://guardian.co.uk/libero/convallis.js?mattis=habitasse&nibh=platea&ligula=dictumst&nec=aliquam&sem=augue&duis=quam&aliquam=sollicitudin&convallis=vitae&nunc=consectetuer');
insert into Map (mapID, trailID, mapURL) values (25, 25, 'http://wunderground.com/posuere/cubilia/curae/nulla/dapibus/dolor/vel.xml?augue=eros&vestibulum=viverra&rutrum=eget&rutrum=congue&neque=eget&aenean=semper&auctor=rutrum&gravida=nulla&sem=nunc&praesent=purus&id=phasellus&massa=in&id=felis&nisl=donec&venenatis=semper&lacinia=sapien&aenean=a&sit=libero&amet=nam&justo=dui&morbi=proin&ut=leo&odio=odio&cras=porttitor');
insert into Map (mapID, trailID, mapURL) values (26, 26, 'http://multiply.com/orci/pede/venenatis/non/sodales.png?cum=egestas&sociis=metus&natoque=aenean&penatibus=fermentum&et=donec&magnis=ut&dis=mauris&parturient=eget&montes=massa&nascetur=tempor&ridiculus=convallis&mus=nulla&vivamus=neque&vestibulum=libero&sagittis=convallis&sapien=eget&cum=eleifend&sociis=luctus&natoque=ultricies&penatibus=eu&et=nibh&magnis=quisque&dis=id&parturient=justo&montes=sit&nascetur=amet&ridiculus=sapien&mus=dignissim&etiam=vestibulum&vel=vestibulum&augue=ante&vestibulum=ipsum&rutrum=primis&rutrum=in&neque=faucibus');
insert into Map (mapID, trailID, mapURL) values (27, 27, 'https://gmpg.org/nisi/at.png?consequat=pede&nulla=malesuada&nisl=in&nunc=imperdiet&nisl=et&duis=commodo&bibendum=vulputate&felis=justo&sed=in&interdum=blandit&venenatis=ultrices&turpis=enim&enim=lorem&blandit=ipsum&mi=dolor&in=sit&porttitor=amet&pede=consectetuer&justo=adipiscing&eu=elit&massa=proin&donec=interdum&dapibus=mauris&duis=non&at=ligula&velit=pellentesque&eu=ultrices&est=phasellus&congue=id&elementum=sapien&in=in&hac=sapien&habitasse=iaculis&platea=congue&dictumst=vivamus&morbi=metus&vestibulum=arcu&velit=adipiscing&id=molestie&pretium=hendrerit&iaculis=at&diam=vulputate&erat=vitae&fermentum=nisl&justo=aenean&nec=lectus&condimentum=pellentesque&neque=eget&sapien=nunc&placerat=donec&ante=quis&nulla=orci&justo=eget&aliquam=orci&quis=vehicula&turpis=condimentum&eget=curabitur&elit=in&sodales=libero&scelerisque=ut&mauris=massa&sit=volutpat&amet=convallis&eros=morbi&suspendisse=odio&accumsan=odio&tortor=elementum&quis=eu&turpis=interdum&sed=eu&ante=tincidunt&vivamus=in&tortor=leo&duis=maecenas&mattis=pulvinar&egestas=lobortis&metus=est&aenean=phasellus&fermentum=sit&donec=amet&ut=erat&mauris=nulla&eget=tempus&massa=vivamus&tempor=in&convallis=felis&nulla=eu&neque=sapien&libero=cursus&convallis=vestibulum&eget=proin');
insert into Map (mapID, trailID, mapURL) values (28, 28, 'http://wp.com/nulla/suscipit/ligula/in/lacus/curabitur/at.xml?pede=vestibulum&justo=sed&eu=magna&massa=at&donec=nunc&dapibus=commodo&duis=placerat&at=praesent&velit=blandit&eu=nam&est=nulla&congue=integer&elementum=pede&in=justo&hac=lacinia&habitasse=eget&platea=tincidunt&dictumst=eget&morbi=tempus&vestibulum=vel&velit=pede&id=morbi&pretium=porttitor&iaculis=lorem&diam=id&erat=ligula&fermentum=suspendisse&justo=ornare&nec=consequat&condimentum=lectus&neque=in');
insert into Map (mapID, trailID, mapURL) values (29, 29, 'https://slate.com/ligula/nec/sem/duis/aliquam/convallis/nunc.png?dui=ipsum&proin=ac&leo=tellus&odio=semper&porttitor=interdum&id=mauris&consequat=ullamcorper');
insert into Map (mapID, trailID, mapURL) values (30, 30, 'https://china.com.cn/sed/lacus/morbi/sem/mauris/laoreet/ut.js?vel=porta&nulla=volutpat&eget=erat&eros=quisque&elementum=erat&pellentesque=eros&quisque=viverra&porta=eget&volutpat=congue&erat=eget&quisque=semper&erat=rutrum&eros=nulla&viverra=nunc&eget=purus&congue=phasellus&eget=in&semper=felis&rutrum=donec&nulla=semper&nunc=sapien&purus=a&phasellus=libero&in=nam&felis=dui&donec=proin&semper=leo&sapien=odio&a=porttitor&libero=id&nam=consequat&dui=in&proin=consequat&leo=ut&odio=nulla&porttitor=sed&id=accumsan&consequat=felis&in=ut&consequat=at&ut=dolor&nulla=quis&sed=odio&accumsan=consequat&felis=varius&ut=integer&at=ac&dolor=leo&quis=pellentesque&odio=ultrices&consequat=mattis&varius=odio&integer=donec&ac=vitae&leo=nisi&pellentesque=nam&ultrices=ultrices&mattis=libero&odio=non');
insert into Map (mapID, trailID, mapURL) values (31, 31, 'https://csmonitor.com/nulla/justo/aliquam/quis/turpis/eget.aspx?sem=vel&sed=augue&sagittis=vestibulum&nam=ante&congue=ipsum&risus=primis&semper=in&porta=faucibus&volutpat=orci&quam=luctus&pede=et&lobortis=ultrices&ligula=posuere&sit=cubilia&amet=curae&eleifend=donec&pede=pharetra&libero=magna&quis=vestibulum&orci=aliquet&nullam=ultrices&molestie=erat&nibh=tortor&in=sollicitudin&lectus=mi&pellentesque=sit&at=amet&nulla=lobortis&suspendisse=sapien&potenti=sapien&cras=non&in=mi&purus=integer&eu=ac&magna=neque&vulputate=duis&luctus=bibendum&cum=morbi&sociis=non&natoque=quam&penatibus=nec&et=dui&magnis=luctus&dis=rutrum&parturient=nulla&montes=tellus&nascetur=in&ridiculus=sagittis&mus=dui&vivamus=vel&vestibulum=nisl&sagittis=duis&sapien=ac&cum=nibh&sociis=fusce&natoque=lacus&penatibus=purus&et=aliquet&magnis=at&dis=feugiat&parturient=non&montes=pretium&nascetur=quis&ridiculus=lectus&mus=suspendisse&etiam=potenti&vel=in');
insert into Map (mapID, trailID, mapURL) values (32, 32, 'http://senate.gov/lobortis/vel.jpg?lorem=habitasse&ipsum=platea&dolor=dictumst&sit=maecenas&amet=ut&consectetuer=massa&adipiscing=quis&elit=augue&proin=luctus&risus=tincidunt&praesent=nulla&lectus=mollis&vestibulum=molestie&quam=lorem&sapien=quisque&varius=ut&ut=erat&blandit=curabitur&non=gravida&interdum=nisi&in=at&ante=nibh&vestibulum=in&ante=hac&ipsum=habitasse&primis=platea&in=dictumst&faucibus=aliquam&orci=augue&luctus=quam&et=sollicitudin&ultrices=vitae&posuere=consectetuer&cubilia=eget&curae=rutrum&duis=at&faucibus=lorem');
insert into Map (mapID, trailID, mapURL) values (33, 33, 'https://irs.gov/amet/nulla.jpg?faucibus=non&orci=velit&luctus=nec&et=nisi&ultrices=vulputate&posuere=nonummy&cubilia=maecenas&curae=tincidunt&mauris=lacus&viverra=at&diam=velit&vitae=vivamus&quam=vel&suspendisse=nulla&potenti=eget&nullam=eros&porttitor=elementum&lacus=pellentesque&at=quisque&turpis=porta&donec=volutpat&posuere=erat&metus=quisque&vitae=erat&ipsum=eros&aliquam=viverra&non=eget&mauris=congue&morbi=eget&non=semper&lectus=rutrum&aliquam=nulla&sit=nunc&amet=purus&diam=phasellus&in=in&magna=felis&bibendum=donec&imperdiet=semper&nullam=sapien&orci=a&pede=libero&venenatis=nam&non=dui&sodales=proin&sed=leo&tincidunt=odio&eu=porttitor&felis=id&fusce=consequat&posuere=in&felis=consequat&sed=ut&lacus=nulla&morbi=sed&sem=accumsan&mauris=felis&laoreet=ut&ut=at&rhoncus=dolor&aliquet=quis&pulvinar=odio&sed=consequat&nisl=varius&nunc=integer&rhoncus=ac&dui=leo&vel=pellentesque&sem=ultrices&sed=mattis&sagittis=odio&nam=donec&congue=vitae&risus=nisi&semper=nam&porta=ultrices&volutpat=libero&quam=non&pede=mattis&lobortis=pulvinar&ligula=nulla&sit=pede');
insert into Map (mapID, trailID, mapURL) values (34, 34, 'https://marketwatch.com/sapien/sapien/non/mi/integer/ac/neque.png?elementum=interdum&eu=eu&interdum=tincidunt&eu=in&tincidunt=leo&in=maecenas&leo=pulvinar&maecenas=lobortis&pulvinar=est&lobortis=phasellus&est=sit&phasellus=amet&sit=erat&amet=nulla&erat=tempus&nulla=vivamus&tempus=in&vivamus=felis&in=eu&felis=sapien&eu=cursus&sapien=vestibulum&cursus=proin&vestibulum=eu&proin=mi&eu=nulla&mi=ac&nulla=enim&ac=in&enim=tempor&in=turpis&tempor=nec&turpis=euismod&nec=scelerisque&euismod=quam&scelerisque=turpis&quam=adipiscing&turpis=lorem&adipiscing=vitae&lorem=mattis');
insert into Map (mapID, trailID, mapURL) values (35, 35, 'https://unblog.fr/vestibulum/vestibulum/ante/ipsum/primis/in.json?ligula=id&vehicula=luctus&consequat=nec&morbi=molestie&a=sed&ipsum=justo&integer=pellentesque&a=viverra&nibh=pede&in=ac&quis=diam&justo=cras&maecenas=pellentesque&rhoncus=volutpat&aliquam=dui&lacus=maecenas&morbi=tristique&quis=est&tortor=et&id=tempus&nulla=semper&ultrices=est&aliquet=quam&maecenas=pharetra&leo=magna&odio=ac&condimentum=consequat&id=metus&luctus=sapien&nec=ut&molestie=nunc&sed=vestibulum&justo=ante&pellentesque=ipsum&viverra=primis&pede=in&ac=faucibus&diam=orci&cras=luctus&pellentesque=et&volutpat=ultrices&dui=posuere&maecenas=cubilia&tristique=curae&est=mauris&et=viverra&tempus=diam&semper=vitae&est=quam&quam=suspendisse&pharetra=potenti&magna=nullam&ac=porttitor&consequat=lacus&metus=at&sapien=turpis&ut=donec&nunc=posuere&vestibulum=metus&ante=vitae&ipsum=ipsum&primis=aliquam&in=non&faucibus=mauris&orci=morbi&luctus=non&et=lectus&ultrices=aliquam&posuere=sit&cubilia=amet&curae=diam&mauris=in&viverra=magna&diam=bibendum&vitae=imperdiet&quam=nullam&suspendisse=orci&potenti=pede&nullam=venenatis&porttitor=non&lacus=sodales&at=sed&turpis=tincidunt&donec=eu&posuere=felis&metus=fusce&vitae=posuere&ipsum=felis&aliquam=sed&non=lacus&mauris=morbi&morbi=sem&non=mauris&lectus=laoreet&aliquam=ut&sit=rhoncus&amet=aliquet&diam=pulvinar&in=sed');
insert into Map (mapID, trailID, mapURL) values (36, 36, 'http://stumbleupon.com/pulvinar/nulla.aspx?ac=ut&est=dolor&lacinia=morbi&nisi=vel&venenatis=lectus&tristique=in&fusce=quam&congue=fringilla&diam=rhoncus&id=mauris&ornare=enim&imperdiet=leo&sapien=rhoncus&urna=sed&pretium=vestibulum&nisl=sit&ut=amet&volutpat=cursus&sapien=id&arcu=turpis&sed=integer&augue=aliquet&aliquam=massa&erat=id&volutpat=lobortis&in=convallis&congue=tortor&etiam=risus&justo=dapibus&etiam=augue&pretium=vel&iaculis=accumsan&justo=tellus');
insert into Map (mapID, trailID, mapURL) values (37, 37, 'https://shutterfly.com/nunc/nisl.jpg?magna=sem&bibendum=duis&imperdiet=aliquam&nullam=convallis&orci=nunc&pede=proin&venenatis=at&non=turpis&sodales=a&sed=pede&tincidunt=posuere&eu=nonummy&felis=integer&fusce=non&posuere=velit&felis=donec&sed=diam&lacus=neque');
insert into Map (mapID, trailID, mapURL) values (38, 38, 'http://ebay.co.uk/eleifend/donec/ut/dolor/morbi.jpg?cras=mauris&pellentesque=non&volutpat=ligula&dui=pellentesque&maecenas=ultrices&tristique=phasellus&est=id&et=sapien&tempus=in&semper=sapien&est=iaculis&quam=congue&pharetra=vivamus&magna=metus&ac=arcu&consequat=adipiscing&metus=molestie&sapien=hendrerit&ut=at&nunc=vulputate&vestibulum=vitae&ante=nisl&ipsum=aenean&primis=lectus&in=pellentesque&faucibus=eget&orci=nunc&luctus=donec&et=quis&ultrices=orci&posuere=eget&cubilia=orci&curae=vehicula&mauris=condimentum&viverra=curabitur&diam=in&vitae=libero&quam=ut&suspendisse=massa&potenti=volutpat&nullam=convallis&porttitor=morbi&lacus=odio&at=odio&turpis=elementum&donec=eu&posuere=interdum&metus=eu&vitae=tincidunt&ipsum=in&aliquam=leo');
insert into Map (mapID, trailID, mapURL) values (39, 39, 'https://scribd.com/faucibus/cursus.png?elementum=consequat&in=metus&hac=sapien&habitasse=ut&platea=nunc&dictumst=vestibulum&morbi=ante&vestibulum=ipsum&velit=primis&id=in&pretium=faucibus&iaculis=orci&diam=luctus&erat=et&fermentum=ultrices&justo=posuere&nec=cubilia&condimentum=curae&neque=mauris&sapien=viverra&placerat=diam&ante=vitae&nulla=quam&justo=suspendisse&aliquam=potenti&quis=nullam&turpis=porttitor&eget=lacus&elit=at&sodales=turpis&scelerisque=donec&mauris=posuere&sit=metus&amet=vitae&eros=ipsum&suspendisse=aliquam&accumsan=non&tortor=mauris&quis=morbi&turpis=non&sed=lectus&ante=aliquam&vivamus=sit&tortor=amet&duis=diam&mattis=in&egestas=magna&metus=bibendum&aenean=imperdiet&fermentum=nullam&donec=orci&ut=pede&mauris=venenatis&eget=non&massa=sodales&tempor=sed&convallis=tincidunt&nulla=eu&neque=felis&libero=fusce&convallis=posuere&eget=felis&eleifend=sed&luctus=lacus&ultricies=morbi&eu=sem&nibh=mauris&quisque=laoreet&id=ut&justo=rhoncus&sit=aliquet&amet=pulvinar&sapien=sed&dignissim=nisl&vestibulum=nunc&vestibulum=rhoncus&ante=dui&ipsum=vel&primis=sem&in=sed&faucibus=sagittis&orci=nam&luctus=congue&et=risus&ultrices=semper&posuere=porta&cubilia=volutpat&curae=quam&nulla=pede&dapibus=lobortis&dolor=ligula&vel=sit&est=amet&donec=eleifend&odio=pede&justo=libero&sollicitudin=quis&ut=orci&suscipit=nullam');
insert into Map (mapID, trailID, mapURL) values (40, 40, 'http://yale.edu/laoreet.js?sed=nulla&sagittis=sed&nam=accumsan&congue=felis&risus=ut&semper=at&porta=dolor&volutpat=quis&quam=odio&pede=consequat&lobortis=varius&ligula=integer&sit=ac&amet=leo&eleifend=pellentesque&pede=ultrices&libero=mattis&quis=odio&orci=donec&nullam=vitae&molestie=nisi&nibh=nam&in=ultrices&lectus=libero&pellentesque=non&at=mattis&nulla=pulvinar&suspendisse=nulla&potenti=pede&cras=ullamcorper&in=augue&purus=a&eu=suscipit&magna=nulla&vulputate=elit&luctus=ac&cum=nulla&sociis=sed&natoque=vel&penatibus=enim&et=sit&magnis=amet&dis=nunc&parturient=viverra&montes=dapibus&nascetur=nulla&ridiculus=suscipit&mus=ligula&vivamus=in&vestibulum=lacus&sagittis=curabitur&sapien=at&cum=ipsum');
insert into Map (mapID, trailID, mapURL) values (41, 41, 'http://photobucket.com/nec/nisi/volutpat/eleifend/donec/ut.png?et=ipsum&ultrices=primis&posuere=in&cubilia=faucibus&curae=orci&nulla=luctus&dapibus=et&dolor=ultrices&vel=posuere&est=cubilia&donec=curae&odio=donec&justo=pharetra&sollicitudin=magna&ut=vestibulum&suscipit=aliquet&a=ultrices&feugiat=erat&et=tortor&eros=sollicitudin&vestibulum=mi&ac=sit');
insert into Map (mapID, trailID, mapURL) values (42, 42, 'http://mashable.com/feugiat/non/pretium.xml?vehicula=velit&consequat=id&morbi=pretium&a=iaculis&ipsum=diam&integer=erat&a=fermentum&nibh=justo&in=nec&quis=condimentum&justo=neque&maecenas=sapien&rhoncus=placerat&aliquam=ante&lacus=nulla&morbi=justo&quis=aliquam&tortor=quis&id=turpis&nulla=eget&ultrices=elit&aliquet=sodales&maecenas=scelerisque&leo=mauris&odio=sit&condimentum=amet&id=eros&luctus=suspendisse&nec=accumsan&molestie=tortor&sed=quis&justo=turpis&pellentesque=sed&viverra=ante&pede=vivamus&ac=tortor&diam=duis&cras=mattis&pellentesque=egestas&volutpat=metus&dui=aenean&maecenas=fermentum&tristique=donec&est=ut&et=mauris&tempus=eget&semper=massa&est=tempor&quam=convallis&pharetra=nulla&magna=neque&ac=libero&consequat=convallis');
insert into Map (mapID, trailID, mapURL) values (43, 43, 'https://cbslocal.com/non/lectus/aliquam.jsp?justo=duis&eu=bibendum&massa=morbi&donec=non&dapibus=quam&duis=nec&at=dui&velit=luctus&eu=rutrum&est=nulla&congue=tellus&elementum=in&in=sagittis&hac=dui&habitasse=vel&platea=nisl&dictumst=duis&morbi=ac&vestibulum=nibh&velit=fusce&id=lacus&pretium=purus&iaculis=aliquet&diam=at&erat=feugiat&fermentum=non&justo=pretium&nec=quis&condimentum=lectus&neque=suspendisse&sapien=potenti&placerat=in&ante=eleifend&nulla=quam&justo=a&aliquam=odio&quis=in&turpis=hac&eget=habitasse&elit=platea&sodales=dictumst&scelerisque=maecenas&mauris=ut&sit=massa&amet=quis&eros=augue&suspendisse=luctus&accumsan=tincidunt&tortor=nulla&quis=mollis&turpis=molestie&sed=lorem&ante=quisque&vivamus=ut&tortor=erat&duis=curabitur&mattis=gravida&egestas=nisi&metus=at&aenean=nibh&fermentum=in&donec=hac&ut=habitasse&mauris=platea&eget=dictumst&massa=aliquam&tempor=augue&convallis=quam&nulla=sollicitudin&neque=vitae&libero=consectetuer&convallis=eget&eget=rutrum&eleifend=at');
insert into Map (mapID, trailID, mapURL) values (44, 44, 'http://tripadvisor.com/eget/semper/rutrum/nulla.html?semper=ligula&porta=vehicula&volutpat=consequat&quam=morbi&pede=a&lobortis=ipsum&ligula=integer&sit=a&amet=nibh&eleifend=in&pede=quis&libero=justo&quis=maecenas&orci=rhoncus&nullam=aliquam&molestie=lacus&nibh=morbi&in=quis&lectus=tortor&pellentesque=id&at=nulla&nulla=ultrices&suspendisse=aliquet&potenti=maecenas&cras=leo&in=odio&purus=condimentum&eu=id&magna=luctus&vulputate=nec&luctus=molestie&cum=sed&sociis=justo&natoque=pellentesque&penatibus=viverra&et=pede&magnis=ac&dis=diam&parturient=cras&montes=pellentesque&nascetur=volutpat&ridiculus=dui&mus=maecenas&vivamus=tristique&vestibulum=est&sagittis=et&sapien=tempus&cum=semper&sociis=est&natoque=quam&penatibus=pharetra&et=magna&magnis=ac&dis=consequat&parturient=metus&montes=sapien&nascetur=ut&ridiculus=nunc&mus=vestibulum&etiam=ante&vel=ipsum&augue=primis&vestibulum=in&rutrum=faucibus&rutrum=orci&neque=luctus&aenean=et');
insert into Map (mapID, trailID, mapURL) values (45, 45, 'https://sourceforge.net/mi.aspx?venenatis=enim&turpis=in&enim=tempor&blandit=turpis&mi=nec&in=euismod&porttitor=scelerisque&pede=quam&justo=turpis&eu=adipiscing&massa=lorem&donec=vitae&dapibus=mattis&duis=nibh&at=ligula&velit=nec&eu=sem&est=duis&congue=aliquam&elementum=convallis&in=nunc&hac=proin&habitasse=at&platea=turpis&dictumst=a&morbi=pede&vestibulum=posuere&velit=nonummy&id=integer&pretium=non&iaculis=velit&diam=donec&erat=diam&fermentum=neque&justo=vestibulum&nec=eget&condimentum=vulputate&neque=ut&sapien=ultrices&placerat=vel');
insert into Map (mapID, trailID, mapURL) values (46, 46, 'https://zimbio.com/auctor/gravida/sem.js?porta=rhoncus&volutpat=sed&erat=vestibulum&quisque=sit&erat=amet&eros=cursus&viverra=id&eget=turpis&congue=integer&eget=aliquet&semper=massa&rutrum=id&nulla=lobortis&nunc=convallis&purus=tortor&phasellus=risus&in=dapibus&felis=augue&donec=vel&semper=accumsan&sapien=tellus&a=nisi&libero=eu&nam=orci&dui=mauris&proin=lacinia&leo=sapien&odio=quis&porttitor=libero&id=nullam&consequat=sit&in=amet&consequat=turpis&ut=elementum&nulla=ligula&sed=vehicula&accumsan=consequat&felis=morbi&ut=a&at=ipsum&dolor=integer&quis=a&odio=nibh&consequat=in&varius=quis&integer=justo&ac=maecenas&leo=rhoncus&pellentesque=aliquam&ultrices=lacus&mattis=morbi&odio=quis&donec=tortor&vitae=id&nisi=nulla&nam=ultrices');
insert into Map (mapID, trailID, mapURL) values (47, 47, 'https://cmu.edu/lorem/ipsum/dolor/sit/amet/consectetuer/adipiscing.png?accumsan=nibh&tortor=fusce&quis=lacus&turpis=purus&sed=aliquet&ante=at&vivamus=feugiat&tortor=non&duis=pretium&mattis=quis&egestas=lectus&metus=suspendisse&aenean=potenti&fermentum=in&donec=eleifend&ut=quam&mauris=a&eget=odio&massa=in&tempor=hac&convallis=habitasse&nulla=platea&neque=dictumst&libero=maecenas&convallis=ut&eget=massa&eleifend=quis&luctus=augue&ultricies=luctus&eu=tincidunt&nibh=nulla&quisque=mollis&id=molestie&justo=lorem&sit=quisque&amet=ut&sapien=erat&dignissim=curabitur&vestibulum=gravida&vestibulum=nisi&ante=at&ipsum=nibh&primis=in&in=hac&faucibus=habitasse&orci=platea&luctus=dictumst&et=aliquam&ultrices=augue&posuere=quam&cubilia=sollicitudin&curae=vitae&nulla=consectetuer&dapibus=eget&dolor=rutrum&vel=at&est=lorem&donec=integer&odio=tincidunt&justo=ante&sollicitudin=vel&ut=ipsum&suscipit=praesent&a=blandit&feugiat=lacinia&et=erat&eros=vestibulum&vestibulum=sed&ac=magna&est=at&lacinia=nunc&nisi=commodo&venenatis=placerat&tristique=praesent&fusce=blandit&congue=nam&diam=nulla&id=integer&ornare=pede&imperdiet=justo&sapien=lacinia&urna=eget');
insert into Map (mapID, trailID, mapURL) values (48, 48, 'http://plala.or.jp/vitae/ipsum/aliquam/non/mauris.png?lorem=ipsum&vitae=aliquam&mattis=non&nibh=mauris&ligula=morbi&nec=non&sem=lectus&duis=aliquam&aliquam=sit&convallis=amet&nunc=diam&proin=in&at=magna&turpis=bibendum&a=imperdiet&pede=nullam&posuere=orci&nonummy=pede&integer=venenatis&non=non&velit=sodales&donec=sed&diam=tincidunt');
insert into Map (mapID, trailID, mapURL) values (49, 49, 'http://who.int/duis/mattis/egestas/metus/aenean/fermentum.xml?nulla=luctus&ut=et&erat=ultrices&id=posuere&mauris=cubilia&vulputate=curae&elementum=nulla&nullam=dapibus&varius=dolor&nulla=vel&facilisi=est&cras=donec&non=odio&velit=justo&nec=sollicitudin&nisi=ut&vulputate=suscipit&nonummy=a&maecenas=feugiat&tincidunt=et&lacus=eros&at=vestibulum&velit=ac&vivamus=est&vel=lacinia&nulla=nisi&eget=venenatis&eros=tristique&elementum=fusce&pellentesque=congue&quisque=diam&porta=id&volutpat=ornare&erat=imperdiet&quisque=sapien');
insert into Map (mapID, trailID, mapURL) values (50, 50, 'http://cocolog-nifty.com/metus/vitae/ipsum/aliquam/non.js?sed=gravida&vestibulum=sem&sit=praesent&amet=id&cursus=massa&id=id&turpis=nisl&integer=venenatis&aliquet=lacinia&massa=aenean&id=sit&lobortis=amet&convallis=justo&tortor=morbi&risus=ut&dapibus=odio&augue=cras&vel=mi&accumsan=pede&tellus=malesuada&nisi=in&eu=imperdiet&orci=et&mauris=commodo&lacinia=vulputate&sapien=justo&quis=in&libero=blandit&nullam=ultrices&sit=enim');
insert into Map (mapID, trailID, mapURL) values (51, 51, 'https://bluehost.com/arcu/libero/rutrum/ac.xml?at=tincidunt&nibh=nulla&in=mollis&hac=molestie&habitasse=lorem&platea=quisque&dictumst=ut&aliquam=erat&augue=curabitur&quam=gravida&sollicitudin=nisi&vitae=at&consectetuer=nibh&eget=in&rutrum=hac&at=habitasse&lorem=platea&integer=dictumst&tincidunt=aliquam&ante=augue&vel=quam&ipsum=sollicitudin&praesent=vitae&blandit=consectetuer&lacinia=eget&erat=rutrum&vestibulum=at&sed=lorem&magna=integer&at=tincidunt&nunc=ante&commodo=vel&placerat=ipsum&praesent=praesent&blandit=blandit&nam=lacinia&nulla=erat&integer=vestibulum&pede=sed&justo=magna&lacinia=at&eget=nunc&tincidunt=commodo&eget=placerat&tempus=praesent&vel=blandit&pede=nam&morbi=nulla&porttitor=integer&lorem=pede&id=justo&ligula=lacinia&suspendisse=eget&ornare=tincidunt&consequat=eget&lectus=tempus&in=vel&est=pede&risus=morbi&auctor=porttitor&sed=lorem&tristique=id&in=ligula&tempus=suspendisse&sit=ornare&amet=consequat&sem=lectus&fusce=in&consequat=est&nulla=risus&nisl=auctor&nunc=sed&nisl=tristique&duis=in&bibendum=tempus&felis=sit&sed=amet&interdum=sem');
insert into Map (mapID, trailID, mapURL) values (52, 52, 'https://telegraph.co.uk/vel/augue/vestibulum/ante/ipsum.jpg?hac=vulputate&habitasse=nonummy&platea=maecenas&dictumst=tincidunt&maecenas=lacus&ut=at&massa=velit&quis=vivamus&augue=vel&luctus=nulla&tincidunt=eget&nulla=eros&mollis=elementum&molestie=pellentesque&lorem=quisque&quisque=porta&ut=volutpat&erat=erat&curabitur=quisque&gravida=erat&nisi=eros&at=viverra&nibh=eget&in=congue&hac=eget&habitasse=semper&platea=rutrum&dictumst=nulla&aliquam=nunc&augue=purus&quam=phasellus&sollicitudin=in&vitae=felis&consectetuer=donec&eget=semper&rutrum=sapien&at=a&lorem=libero&integer=nam&tincidunt=dui&ante=proin&vel=leo&ipsum=odio&praesent=porttitor&blandit=id&lacinia=consequat&erat=in&vestibulum=consequat&sed=ut&magna=nulla&at=sed&nunc=accumsan&commodo=felis&placerat=ut&praesent=at&blandit=dolor&nam=quis&nulla=odio&integer=consequat&pede=varius&justo=integer&lacinia=ac&eget=leo&tincidunt=pellentesque&eget=ultrices&tempus=mattis');
insert into Map (mapID, trailID, mapURL) values (53, 53, 'https://zdnet.com/velit/nec.jpg?turpis=adipiscing&donec=lorem&posuere=vitae&metus=mattis&vitae=nibh&ipsum=ligula&aliquam=nec&non=sem&mauris=duis&morbi=aliquam&non=convallis&lectus=nunc&aliquam=proin&sit=at&amet=turpis&diam=a&in=pede&magna=posuere&bibendum=nonummy&imperdiet=integer&nullam=non&orci=velit&pede=donec&venenatis=diam&non=neque&sodales=vestibulum&sed=eget&tincidunt=vulputate&eu=ut&felis=ultrices&fusce=vel&posuere=augue&felis=vestibulum&sed=ante&lacus=ipsum&morbi=primis&sem=in&mauris=faucibus&laoreet=orci&ut=luctus&rhoncus=et&aliquet=ultrices&pulvinar=posuere&sed=cubilia&nisl=curae&nunc=donec&rhoncus=pharetra&dui=magna&vel=vestibulum&sem=aliquet&sed=ultrices&sagittis=erat&nam=tortor&congue=sollicitudin&risus=mi&semper=sit&porta=amet&volutpat=lobortis&quam=sapien&pede=sapien&lobortis=non&ligula=mi&sit=integer&amet=ac&eleifend=neque&pede=duis&libero=bibendum&quis=morbi&orci=non&nullam=quam&molestie=nec&nibh=dui&in=luctus&lectus=rutrum&pellentesque=nulla&at=tellus&nulla=in&suspendisse=sagittis&potenti=dui&cras=vel&in=nisl&purus=duis&eu=ac');
insert into Map (mapID, trailID, mapURL) values (54, 54, 'http://goodreads.com/rhoncus/sed/vestibulum/sit.html?lobortis=donec&convallis=pharetra&tortor=magna&risus=vestibulum&dapibus=aliquet&augue=ultrices&vel=erat&accumsan=tortor&tellus=sollicitudin&nisi=mi&eu=sit&orci=amet&mauris=lobortis&lacinia=sapien&sapien=sapien&quis=non&libero=mi&nullam=integer&sit=ac&amet=neque&turpis=duis&elementum=bibendum&ligula=morbi&vehicula=non&consequat=quam&morbi=nec&a=dui&ipsum=luctus&integer=rutrum&a=nulla');
insert into Map (mapID, trailID, mapURL) values (55, 55, 'http://github.com/etiam/vel/augue/vestibulum/rutrum/rutrum/neque.aspx?lectus=ut&vestibulum=nunc&quam=vestibulum&sapien=ante&varius=ipsum&ut=primis&blandit=in&non=faucibus&interdum=orci&in=luctus&ante=et&vestibulum=ultrices&ante=posuere&ipsum=cubilia&primis=curae&in=mauris&faucibus=viverra&orci=diam&luctus=vitae&et=quam&ultrices=suspendisse&posuere=potenti&cubilia=nullam&curae=porttitor&duis=lacus&faucibus=at&accumsan=turpis&odio=donec&curabitur=posuere&convallis=metus&duis=vitae&consequat=ipsum&dui=aliquam&nec=non&nisi=mauris&volutpat=morbi&eleifend=non&donec=lectus&ut=aliquam&dolor=sit&morbi=amet&vel=diam&lectus=in&in=magna&quam=bibendum&fringilla=imperdiet&rhoncus=nullam&mauris=orci&enim=pede&leo=venenatis&rhoncus=non&sed=sodales&vestibulum=sed&sit=tincidunt&amet=eu&cursus=felis&id=fusce&turpis=posuere&integer=felis&aliquet=sed&massa=lacus&id=morbi&lobortis=sem');
insert into Map (mapID, trailID, mapURL) values (56, 56, 'http://businessweek.com/nullam/varius/nulla.jpg?pellentesque=mollis&ultrices=molestie&phasellus=lorem&id=quisque&sapien=ut&in=erat&sapien=curabitur&iaculis=gravida&congue=nisi&vivamus=at&metus=nibh&arcu=in&adipiscing=hac&molestie=habitasse&hendrerit=platea&at=dictumst&vulputate=aliquam');
insert into Map (mapID, trailID, mapURL) values (57, 57, 'https://seesaa.net/est/congue/elementum/in/hac.html?ultrices=consequat&posuere=in&cubilia=consequat&curae=ut&donec=nulla&pharetra=sed&magna=accumsan&vestibulum=felis&aliquet=ut&ultrices=at&erat=dolor&tortor=quis&sollicitudin=odio&mi=consequat&sit=varius&amet=integer&lobortis=ac&sapien=leo&sapien=pellentesque&non=ultrices&mi=mattis&integer=odio&ac=donec&neque=vitae&duis=nisi&bibendum=nam&morbi=ultrices&non=libero&quam=non&nec=mattis&dui=pulvinar&luctus=nulla&rutrum=pede&nulla=ullamcorper&tellus=augue&in=a&sagittis=suscipit&dui=nulla&vel=elit&nisl=ac&duis=nulla&ac=sed&nibh=vel&fusce=enim&lacus=sit&purus=amet&aliquet=nunc&at=viverra&feugiat=dapibus&non=nulla&pretium=suscipit&quis=ligula&lectus=in&suspendisse=lacus&potenti=curabitur&in=at&eleifend=ipsum&quam=ac&a=tellus&odio=semper&in=interdum&hac=mauris&habitasse=ullamcorper&platea=purus&dictumst=sit&maecenas=amet&ut=nulla&massa=quisque&quis=arcu&augue=libero&luctus=rutrum&tincidunt=ac&nulla=lobortis&mollis=vel&molestie=dapibus&lorem=at&quisque=diam&ut=nam&erat=tristique');
insert into Map (mapID, trailID, mapURL) values (58, 58, 'https://acquirethisname.com/scelerisque/mauris/sit/amet/eros/suspendisse.jsp?vel=sit&est=amet&donec=erat&odio=nulla&justo=tempus&sollicitudin=vivamus&ut=in&suscipit=felis&a=eu&feugiat=sapien&et=cursus&eros=vestibulum&vestibulum=proin&ac=eu&est=mi&lacinia=nulla&nisi=ac&venenatis=enim&tristique=in&fusce=tempor&congue=turpis&diam=nec&id=euismod&ornare=scelerisque&imperdiet=quam&sapien=turpis&urna=adipiscing&pretium=lorem&nisl=vitae&ut=mattis&volutpat=nibh&sapien=ligula&arcu=nec&sed=sem&augue=duis&aliquam=aliquam&erat=convallis&volutpat=nunc&in=proin&congue=at&etiam=turpis&justo=a&etiam=pede&pretium=posuere&iaculis=nonummy&justo=integer&in=non&hac=velit&habitasse=donec&platea=diam&dictumst=neque&etiam=vestibulum&faucibus=eget&cursus=vulputate&urna=ut&ut=ultrices&tellus=vel&nulla=augue&ut=vestibulum&erat=ante&id=ipsum&mauris=primis&vulputate=in&elementum=faucibus&nullam=orci&varius=luctus&nulla=et&facilisi=ultrices&cras=posuere&non=cubilia&velit=curae&nec=donec&nisi=pharetra&vulputate=magna&nonummy=vestibulum&maecenas=aliquet&tincidunt=ultrices&lacus=erat&at=tortor&velit=sollicitudin&vivamus=mi&vel=sit&nulla=amet&eget=lobortis&eros=sapien');
insert into Map (mapID, trailID, mapURL) values (59, 59, 'http://blogtalkradio.com/lorem/ipsum/dolor/sit/amet/consectetuer.jpg?semper=amet&est=consectetuer&quam=adipiscing&pharetra=elit&magna=proin&ac=interdum&consequat=mauris&metus=non&sapien=ligula&ut=pellentesque&nunc=ultrices&vestibulum=phasellus&ante=id&ipsum=sapien&primis=in&in=sapien&faucibus=iaculis&orci=congue&luctus=vivamus&et=metus&ultrices=arcu&posuere=adipiscing&cubilia=molestie&curae=hendrerit&mauris=at&viverra=vulputate&diam=vitae&vitae=nisl&quam=aenean&suspendisse=lectus&potenti=pellentesque&nullam=eget&porttitor=nunc&lacus=donec&at=quis&turpis=orci&donec=eget&posuere=orci&metus=vehicula&vitae=condimentum&ipsum=curabitur&aliquam=in&non=libero&mauris=ut&morbi=massa&non=volutpat');
insert into Map (mapID, trailID, mapURL) values (60, 60, 'http://drupal.org/id/sapien/in.json?luctus=ligula&tincidunt=nec&nulla=sem&mollis=duis&molestie=aliquam&lorem=convallis&quisque=nunc&ut=proin&erat=at&curabitur=turpis&gravida=a&nisi=pede&at=posuere&nibh=nonummy&in=integer&hac=non&habitasse=velit&platea=donec&dictumst=diam&aliquam=neque&augue=vestibulum&quam=eget&sollicitudin=vulputate&vitae=ut&consectetuer=ultrices&eget=vel&rutrum=augue&at=vestibulum&lorem=ante&integer=ipsum&tincidunt=primis&ante=in&vel=faucibus&ipsum=orci&praesent=luctus&blandit=et&lacinia=ultrices&erat=posuere&vestibulum=cubilia&sed=curae&magna=donec&at=pharetra&nunc=magna&commodo=vestibulum&placerat=aliquet&praesent=ultrices&blandit=erat&nam=tortor&nulla=sollicitudin&integer=mi&pede=sit&justo=amet&lacinia=lobortis&eget=sapien&tincidunt=sapien&eget=non&tempus=mi&vel=integer&pede=ac&morbi=neque&porttitor=duis&lorem=bibendum&id=morbi&ligula=non&suspendisse=quam&ornare=nec&consequat=dui&lectus=luctus&in=rutrum&est=nulla&risus=tellus&auctor=in&sed=sagittis&tristique=dui');
insert into Map (mapID, trailID, mapURL) values (61, 61, 'https://guardian.co.uk/massa/volutpat/convallis/morbi/odio.html?nulla=ac&ultrices=nibh&aliquet=fusce&maecenas=lacus&leo=purus&odio=aliquet&condimentum=at&id=feugiat');
insert into Map (mapID, trailID, mapURL) values (62, 62, 'https://i2i.jp/volutpat/quam/pede/lobortis.html?ipsum=quis&praesent=turpis&blandit=sed&lacinia=ante&erat=vivamus&vestibulum=tortor&sed=duis&magna=mattis&at=egestas&nunc=metus&commodo=aenean&placerat=fermentum&praesent=donec&blandit=ut&nam=mauris&nulla=eget&integer=massa&pede=tempor&justo=convallis&lacinia=nulla&eget=neque&tincidunt=libero&eget=convallis&tempus=eget&vel=eleifend&pede=luctus&morbi=ultricies&porttitor=eu&lorem=nibh&id=quisque&ligula=id&suspendisse=justo&ornare=sit&consequat=amet&lectus=sapien&in=dignissim&est=vestibulum&risus=vestibulum&auctor=ante&sed=ipsum&tristique=primis&in=in&tempus=faucibus&sit=orci&amet=luctus&sem=et&fusce=ultrices&consequat=posuere&nulla=cubilia&nisl=curae&nunc=nulla&nisl=dapibus&duis=dolor&bibendum=vel&felis=est&sed=donec&interdum=odio&venenatis=justo&turpis=sollicitudin&enim=ut&blandit=suscipit&mi=a&in=feugiat&porttitor=et&pede=eros&justo=vestibulum&eu=ac&massa=est&donec=lacinia&dapibus=nisi&duis=venenatis&at=tristique&velit=fusce&eu=congue&est=diam&congue=id&elementum=ornare&in=imperdiet&hac=sapien');
insert into Map (mapID, trailID, mapURL) values (63, 63, 'http://unicef.org/lobortis/sapien/sapien/non/mi/integer.js?vivamus=dictumst&tortor=etiam&duis=faucibus&mattis=cursus&egestas=urna&metus=ut&aenean=tellus&fermentum=nulla&donec=ut&ut=erat&mauris=id&eget=mauris&massa=vulputate&tempor=elementum&convallis=nullam&nulla=varius&neque=nulla&libero=facilisi&convallis=cras&eget=non&eleifend=velit&luctus=nec&ultricies=nisi&eu=vulputate&nibh=nonummy');
insert into Map (mapID, trailID, mapURL) values (64, 64, 'https://prlog.org/enim/in.json?vestibulum=non');
insert into Map (mapID, trailID, mapURL) values (65, 65, 'http://cafepress.com/massa/id.js?porta=id&volutpat=ornare&quam=imperdiet&pede=sapien&lobortis=urna&ligula=pretium&sit=nisl&amet=ut&eleifend=volutpat&pede=sapien&libero=arcu&quis=sed&orci=augue&nullam=aliquam&molestie=erat&nibh=volutpat&in=in&lectus=congue&pellentesque=etiam&at=justo&nulla=etiam&suspendisse=pretium&potenti=iaculis&cras=justo&in=in&purus=hac&eu=habitasse&magna=platea&vulputate=dictumst&luctus=etiam&cum=faucibus&sociis=cursus&natoque=urna&penatibus=ut&et=tellus&magnis=nulla&dis=ut&parturient=erat&montes=id&nascetur=mauris');
insert into Map (mapID, trailID, mapURL) values (66, 66, 'https://virginia.edu/sit/amet.png?placerat=at&praesent=vulputate&blandit=vitae&nam=nisl&nulla=aenean&integer=lectus&pede=pellentesque&justo=eget&lacinia=nunc&eget=donec&tincidunt=quis&eget=orci&tempus=eget&vel=orci&pede=vehicula&morbi=condimentum&porttitor=curabitur&lorem=in&id=libero&ligula=ut&suspendisse=massa&ornare=volutpat&consequat=convallis&lectus=morbi&in=odio&est=odio&risus=elementum&auctor=eu&sed=interdum&tristique=eu&in=tincidunt&tempus=in&sit=leo&amet=maecenas&sem=pulvinar&fusce=lobortis&consequat=est&nulla=phasellus&nisl=sit&nunc=amet&nisl=erat&duis=nulla&bibendum=tempus&felis=vivamus&sed=in&interdum=felis&venenatis=eu&turpis=sapien&enim=cursus&blandit=vestibulum&mi=proin&in=eu&porttitor=mi&pede=nulla&justo=ac&eu=enim&massa=in&donec=tempor&dapibus=turpis&duis=nec&at=euismod&velit=scelerisque&eu=quam&est=turpis&congue=adipiscing');
insert into Map (mapID, trailID, mapURL) values (67, 67, 'http://cisco.com/sed/vel/enim/sit/amet/nunc/viverra.json?nec=nibh&sem=fusce&duis=lacus&aliquam=purus&convallis=aliquet&nunc=at&proin=feugiat&at=non&turpis=pretium&a=quis&pede=lectus&posuere=suspendisse&nonummy=potenti&integer=in&non=eleifend&velit=quam&donec=a&diam=odio&neque=in&vestibulum=hac&eget=habitasse&vulputate=platea&ut=dictumst&ultrices=maecenas&vel=ut&augue=massa&vestibulum=quis&ante=augue&ipsum=luctus&primis=tincidunt&in=nulla&faucibus=mollis&orci=molestie&luctus=lorem&et=quisque&ultrices=ut&posuere=erat&cubilia=curabitur&curae=gravida&donec=nisi&pharetra=at&magna=nibh&vestibulum=in&aliquet=hac&ultrices=habitasse&erat=platea&tortor=dictumst&sollicitudin=aliquam&mi=augue&sit=quam&amet=sollicitudin&lobortis=vitae&sapien=consectetuer&sapien=eget&non=rutrum&mi=at&integer=lorem&ac=integer&neque=tincidunt&duis=ante&bibendum=vel&morbi=ipsum&non=praesent&quam=blandit&nec=lacinia&dui=erat&luctus=vestibulum&rutrum=sed&nulla=magna&tellus=at&in=nunc&sagittis=commodo&dui=placerat&vel=praesent&nisl=blandit&duis=nam&ac=nulla&nibh=integer&fusce=pede&lacus=justo&purus=lacinia&aliquet=eget');
insert into Map (mapID, trailID, mapURL) values (68, 68, 'http://google.com/dolor/quis/odio/consequat/varius/integer/ac.jpg?viverra=ante&pede=nulla&ac=justo&diam=aliquam&cras=quis&pellentesque=turpis&volutpat=eget&dui=elit&maecenas=sodales&tristique=scelerisque&est=mauris&et=sit&tempus=amet&semper=eros&est=suspendisse&quam=accumsan&pharetra=tortor&magna=quis&ac=turpis&consequat=sed&metus=ante&sapien=vivamus&ut=tortor&nunc=duis&vestibulum=mattis&ante=egestas&ipsum=metus&primis=aenean&in=fermentum&faucibus=donec&orci=ut&luctus=mauris&et=eget&ultrices=massa&posuere=tempor&cubilia=convallis&curae=nulla&mauris=neque&viverra=libero&diam=convallis&vitae=eget&quam=eleifend&suspendisse=luctus&potenti=ultricies&nullam=eu&porttitor=nibh&lacus=quisque&at=id&turpis=justo&donec=sit&posuere=amet&metus=sapien');
insert into Map (mapID, trailID, mapURL) values (69, 69, 'https://163.com/quis/augue.js?tincidunt=felis&in=sed&leo=lacus&maecenas=morbi&pulvinar=sem&lobortis=mauris&est=laoreet&phasellus=ut&sit=rhoncus&amet=aliquet&erat=pulvinar&nulla=sed&tempus=nisl&vivamus=nunc&in=rhoncus&felis=dui&eu=vel&sapien=sem&cursus=sed&vestibulum=sagittis&proin=nam&eu=congue&mi=risus&nulla=semper&ac=porta&enim=volutpat&in=quam&tempor=pede&turpis=lobortis&nec=ligula&euismod=sit&scelerisque=amet&quam=eleifend&turpis=pede&adipiscing=libero&lorem=quis&vitae=orci&mattis=nullam&nibh=molestie&ligula=nibh&nec=in&sem=lectus&duis=pellentesque&aliquam=at&convallis=nulla&nunc=suspendisse&proin=potenti&at=cras&turpis=in&a=purus&pede=eu&posuere=magna&nonummy=vulputate&integer=luctus&non=cum&velit=sociis&donec=natoque&diam=penatibus&neque=et&vestibulum=magnis&eget=dis&vulputate=parturient&ut=montes&ultrices=nascetur&vel=ridiculus&augue=mus&vestibulum=vivamus&ante=vestibulum');
insert into Map (mapID, trailID, mapURL) values (70, 70, 'http://gmpg.org/in/tempus/sit/amet.json?vivamus=ac&metus=nibh&arcu=fusce&adipiscing=lacus&molestie=purus&hendrerit=aliquet&at=at&vulputate=feugiat&vitae=non&nisl=pretium&aenean=quis&lectus=lectus&pellentesque=suspendisse&eget=potenti&nunc=in&donec=eleifend&quis=quam&orci=a&eget=odio&orci=in&vehicula=hac&condimentum=habitasse&curabitur=platea&in=dictumst&libero=maecenas&ut=ut&massa=massa&volutpat=quis&convallis=augue&morbi=luctus&odio=tincidunt&odio=nulla&elementum=mollis&eu=molestie&interdum=lorem&eu=quisque&tincidunt=ut&in=erat&leo=curabitur&maecenas=gravida&pulvinar=nisi&lobortis=at&est=nibh&phasellus=in&sit=hac&amet=habitasse&erat=platea&nulla=dictumst&tempus=aliquam&vivamus=augue&in=quam&felis=sollicitudin&eu=vitae&sapien=consectetuer&cursus=eget&vestibulum=rutrum&proin=at&eu=lorem&mi=integer&nulla=tincidunt&ac=ante&enim=vel&in=ipsum&tempor=praesent&turpis=blandit&nec=lacinia&euismod=erat&scelerisque=vestibulum&quam=sed&turpis=magna&adipiscing=at&lorem=nunc&vitae=commodo&mattis=placerat&nibh=praesent&ligula=blandit&nec=nam&sem=nulla&duis=integer');
insert into Map (mapID, trailID, mapURL) values (71, 71, 'http://ycombinator.com/condimentum/id/luctus.png?aenean=venenatis&lectus=tristique&pellentesque=fusce&eget=congue&nunc=diam&donec=id&quis=ornare&orci=imperdiet&eget=sapien&orci=urna&vehicula=pretium&condimentum=nisl&curabitur=ut&in=volutpat&libero=sapien&ut=arcu&massa=sed&volutpat=augue&convallis=aliquam&morbi=erat&odio=volutpat&odio=in&elementum=congue&eu=etiam&interdum=justo&eu=etiam&tincidunt=pretium&in=iaculis&leo=justo&maecenas=in&pulvinar=hac&lobortis=habitasse&est=platea&phasellus=dictumst&sit=etiam&amet=faucibus&erat=cursus&nulla=urna&tempus=ut&vivamus=tellus&in=nulla&felis=ut&eu=erat&sapien=id&cursus=mauris&vestibulum=vulputate&proin=elementum&eu=nullam&mi=varius&nulla=nulla&ac=facilisi&enim=cras&in=non&tempor=velit&turpis=nec&nec=nisi&euismod=vulputate&scelerisque=nonummy&quam=maecenas&turpis=tincidunt&adipiscing=lacus&lorem=at&vitae=velit&mattis=vivamus&nibh=vel&ligula=nulla&nec=eget&sem=eros&duis=elementum&aliquam=pellentesque&convallis=quisque&nunc=porta&proin=volutpat&at=erat&turpis=quisque&a=erat&pede=eros&posuere=viverra&nonummy=eget&integer=congue&non=eget&velit=semper&donec=rutrum&diam=nulla&neque=nunc&vestibulum=purus&eget=phasellus&vulputate=in&ut=felis&ultrices=donec&vel=semper');
insert into Map (mapID, trailID, mapURL) values (72, 72, 'http://vistaprint.com/magna/bibendum/imperdiet/nullam/orci.html?ante=commodo&ipsum=vulputate&primis=justo&in=in&faucibus=blandit&orci=ultrices&luctus=enim&et=lorem&ultrices=ipsum&posuere=dolor&cubilia=sit&curae=amet&nulla=consectetuer&dapibus=adipiscing&dolor=elit');
insert into Map (mapID, trailID, mapURL) values (73, 73, 'http://umn.edu/at/turpis/donec/posuere.jsp?dolor=accumsan&sit=felis&amet=ut&consectetuer=at&adipiscing=dolor&elit=quis&proin=odio&risus=consequat&praesent=varius&lectus=integer&vestibulum=ac&quam=leo&sapien=pellentesque&varius=ultrices&ut=mattis&blandit=odio&non=donec&interdum=vitae&in=nisi&ante=nam&vestibulum=ultrices&ante=libero&ipsum=non&primis=mattis&in=pulvinar&faucibus=nulla&orci=pede&luctus=ullamcorper&et=augue&ultrices=a&posuere=suscipit&cubilia=nulla&curae=elit&duis=ac&faucibus=nulla&accumsan=sed&odio=vel&curabitur=enim&convallis=sit&duis=amet&consequat=nunc&dui=viverra&nec=dapibus&nisi=nulla&volutpat=suscipit&eleifend=ligula');
insert into Map (mapID, trailID, mapURL) values (74, 74, 'https://narod.ru/nisl.html?posuere=congue&metus=eget&vitae=semper&ipsum=rutrum&aliquam=nulla&non=nunc&mauris=purus');
insert into Map (mapID, trailID, mapURL) values (75, 75, 'http://ycombinator.com/donec/quis/orci/eget/orci/vehicula.html?molestie=odio&nibh=curabitur&in=convallis&lectus=duis&pellentesque=consequat&at=dui&nulla=nec&suspendisse=nisi&potenti=volutpat&cras=eleifend&in=donec&purus=ut&eu=dolor&magna=morbi&vulputate=vel&luctus=lectus&cum=in&sociis=quam&natoque=fringilla&penatibus=rhoncus&et=mauris&magnis=enim&dis=leo&parturient=rhoncus');
insert into Map (mapID, trailID, mapURL) values (76, 76, 'http://wordpress.com/erat.png?vel=ac&nulla=est&eget=lacinia&eros=nisi&elementum=venenatis&pellentesque=tristique&quisque=fusce&porta=congue&volutpat=diam&erat=id&quisque=ornare&erat=imperdiet&eros=sapien&viverra=urna&eget=pretium&congue=nisl&eget=ut&semper=volutpat&rutrum=sapien&nulla=arcu&nunc=sed&purus=augue&phasellus=aliquam&in=erat&felis=volutpat&donec=in&semper=congue&sapien=etiam&a=justo&libero=etiam&nam=pretium&dui=iaculis&proin=justo&leo=in&odio=hac&porttitor=habitasse&id=platea&consequat=dictumst&in=etiam&consequat=faucibus&ut=cursus&nulla=urna&sed=ut&accumsan=tellus&felis=nulla&ut=ut&at=erat&dolor=id&quis=mauris&odio=vulputate&consequat=elementum&varius=nullam&integer=varius&ac=nulla&leo=facilisi&pellentesque=cras&ultrices=non&mattis=velit&odio=nec&donec=nisi&vitae=vulputate&nisi=nonummy&nam=maecenas&ultrices=tincidunt&libero=lacus&non=at&mattis=velit&pulvinar=vivamus&nulla=vel');
insert into Map (mapID, trailID, mapURL) values (77, 77, 'http://patch.com/libero/nam/dui/proin/leo.json?erat=nisi&tortor=venenatis&sollicitudin=tristique&mi=fusce&sit=congue&amet=diam&lobortis=id&sapien=ornare&sapien=imperdiet&non=sapien&mi=urna&integer=pretium&ac=nisl&neque=ut&duis=volutpat&bibendum=sapien&morbi=arcu&non=sed&quam=augue&nec=aliquam&dui=erat&luctus=volutpat&rutrum=in&nulla=congue&tellus=etiam&in=justo&sagittis=etiam&dui=pretium&vel=iaculis&nisl=justo');
insert into Map (mapID, trailID, mapURL) values (78, 78, 'https://techcrunch.com/nulla/suspendisse/potenti/cras.jpg?tincidunt=erat&lacus=fermentum&at=justo&velit=nec&vivamus=condimentum&vel=neque&nulla=sapien&eget=placerat&eros=ante&elementum=nulla&pellentesque=justo&quisque=aliquam&porta=quis&volutpat=turpis&erat=eget&quisque=elit&erat=sodales&eros=scelerisque&viverra=mauris&eget=sit&congue=amet&eget=eros&semper=suspendisse&rutrum=accumsan&nulla=tortor&nunc=quis&purus=turpis&phasellus=sed&in=ante&felis=vivamus&donec=tortor&semper=duis&sapien=mattis&a=egestas&libero=metus&nam=aenean&dui=fermentum&proin=donec&leo=ut&odio=mauris&porttitor=eget&id=massa&consequat=tempor&in=convallis&consequat=nulla&ut=neque&nulla=libero&sed=convallis&accumsan=eget&felis=eleifend&ut=luctus&at=ultricies&dolor=eu&quis=nibh&odio=quisque&consequat=id&varius=justo&integer=sit&ac=amet&leo=sapien&pellentesque=dignissim&ultrices=vestibulum&mattis=vestibulum&odio=ante&donec=ipsum');
insert into Map (mapID, trailID, mapURL) values (79, 79, 'https://biglobe.ne.jp/consequat/in/consequat/ut.js?volutpat=ut&erat=erat&quisque=id&erat=mauris&eros=vulputate&viverra=elementum&eget=nullam&congue=varius&eget=nulla&semper=facilisi&rutrum=cras');
insert into Map (mapID, trailID, mapURL) values (80, 80, 'https://shinystat.com/pede/morbi/porttitor/lorem/id.html?non=suscipit&pretium=nulla&quis=elit&lectus=ac&suspendisse=nulla&potenti=sed&in=vel&eleifend=enim&quam=sit&a=amet&odio=nunc&in=viverra&hac=dapibus&habitasse=nulla&platea=suscipit&dictumst=ligula&maecenas=in&ut=lacus&massa=curabitur&quis=at&augue=ipsum&luctus=ac&tincidunt=tellus&nulla=semper&mollis=interdum&molestie=mauris&lorem=ullamcorper&quisque=purus');
insert into Map (mapID, trailID, mapURL) values (81, 81, 'http://unblog.fr/fringilla/rhoncus/mauris/enim/leo/rhoncus/sed.png?dolor=sapien&sit=a&amet=libero&consectetuer=nam&adipiscing=dui&elit=proin&proin=leo&interdum=odio&mauris=porttitor&non=id&ligula=consequat&pellentesque=in&ultrices=consequat&phasellus=ut&id=nulla&sapien=sed&in=accumsan&sapien=felis&iaculis=ut&congue=at&vivamus=dolor&metus=quis&arcu=odio&adipiscing=consequat&molestie=varius&hendrerit=integer&at=ac&vulputate=leo&vitae=pellentesque&nisl=ultrices&aenean=mattis&lectus=odio&pellentesque=donec&eget=vitae&nunc=nisi&donec=nam&quis=ultrices&orci=libero&eget=non&orci=mattis&vehicula=pulvinar&condimentum=nulla&curabitur=pede&in=ullamcorper&libero=augue&ut=a&massa=suscipit&volutpat=nulla&convallis=elit&morbi=ac&odio=nulla&odio=sed&elementum=vel&eu=enim&interdum=sit&eu=amet&tincidunt=nunc&in=viverra&leo=dapibus&maecenas=nulla&pulvinar=suscipit&lobortis=ligula&est=in&phasellus=lacus&sit=curabitur&amet=at&erat=ipsum&nulla=ac&tempus=tellus&vivamus=semper&in=interdum');
insert into Map (mapID, trailID, mapURL) values (82, 82, 'http://sun.com/fusce/consequat/nulla.jsp?lorem=fusce&quisque=lacus&ut=purus&erat=aliquet&curabitur=at&gravida=feugiat&nisi=non&at=pretium&nibh=quis&in=lectus&hac=suspendisse&habitasse=potenti&platea=in&dictumst=eleifend&aliquam=quam&augue=a&quam=odio&sollicitudin=in&vitae=hac&consectetuer=habitasse&eget=platea&rutrum=dictumst&at=maecenas&lorem=ut&integer=massa&tincidunt=quis&ante=augue&vel=luctus&ipsum=tincidunt&praesent=nulla&blandit=mollis&lacinia=molestie&erat=lorem&vestibulum=quisque&sed=ut&magna=erat&at=curabitur&nunc=gravida&commodo=nisi&placerat=at&praesent=nibh&blandit=in&nam=hac');
insert into Map (mapID, trailID, mapURL) values (83, 83, 'http://tumblr.com/curabitur/in/libero/ut/massa/volutpat.jpg?quis=eros&turpis=suspendisse&eget=accumsan');
insert into Map (mapID, trailID, mapURL) values (84, 84, 'https://mit.edu/ut/nulla/sed/accumsan/felis.jsp?aliquet=eleifend&ultrices=pede&erat=libero&tortor=quis&sollicitudin=orci&mi=nullam&sit=molestie&amet=nibh&lobortis=in&sapien=lectus&sapien=pellentesque&non=at&mi=nulla&integer=suspendisse&ac=potenti&neque=cras&duis=in&bibendum=purus&morbi=eu&non=magna&quam=vulputate&nec=luctus&dui=cum&luctus=sociis&rutrum=natoque&nulla=penatibus&tellus=et&in=magnis&sagittis=dis&dui=parturient&vel=montes');
insert into Map (mapID, trailID, mapURL) values (85, 85, 'http://freewebs.com/sit/amet/cursus/id/turpis.png?quisque=at&porta=velit&volutpat=vivamus&erat=vel&quisque=nulla&erat=eget&eros=eros&viverra=elementum&eget=pellentesque&congue=quisque&eget=porta&semper=volutpat&rutrum=erat&nulla=quisque&nunc=erat&purus=eros&phasellus=viverra&in=eget&felis=congue&donec=eget&semper=semper&sapien=rutrum&a=nulla&libero=nunc&nam=purus&dui=phasellus&proin=in&leo=felis&odio=donec&porttitor=semper&id=sapien');
insert into Map (mapID, trailID, mapURL) values (86, 86, 'https://accuweather.com/tempus/semper/est/quam.jsp?suscipit=morbi&nulla=non&elit=lectus&ac=aliquam&nulla=sit&sed=amet&vel=diam&enim=in&sit=magna&amet=bibendum&nunc=imperdiet&viverra=nullam&dapibus=orci&nulla=pede&suscipit=venenatis&ligula=non&in=sodales&lacus=sed&curabitur=tincidunt&at=eu&ipsum=felis&ac=fusce&tellus=posuere');
insert into Map (mapID, trailID, mapURL) values (87, 87, 'https://shareasale.com/ut/mauris/eget.aspx?in=congue&quam=eget&fringilla=semper&rhoncus=rutrum&mauris=nulla&enim=nunc&leo=purus&rhoncus=phasellus&sed=in&vestibulum=felis&sit=donec&amet=semper&cursus=sapien&id=a&turpis=libero&integer=nam&aliquet=dui&massa=proin&id=leo&lobortis=odio&convallis=porttitor&tortor=id&risus=consequat&dapibus=in&augue=consequat&vel=ut&accumsan=nulla&tellus=sed&nisi=accumsan&eu=felis&orci=ut&mauris=at&lacinia=dolor&sapien=quis&quis=odio&libero=consequat&nullam=varius&sit=integer&amet=ac&turpis=leo&elementum=pellentesque&ligula=ultrices&vehicula=mattis&consequat=odio&morbi=donec&a=vitae&ipsum=nisi&integer=nam&a=ultrices&nibh=libero&in=non&quis=mattis&justo=pulvinar&maecenas=nulla&rhoncus=pede&aliquam=ullamcorper&lacus=augue&morbi=a&quis=suscipit&tortor=nulla&id=elit&nulla=ac&ultrices=nulla&aliquet=sed&maecenas=vel&leo=enim&odio=sit&condimentum=amet&id=nunc&luctus=viverra&nec=dapibus&molestie=nulla&sed=suscipit&justo=ligula&pellentesque=in&viverra=lacus&pede=curabitur&ac=at&diam=ipsum&cras=ac&pellentesque=tellus&volutpat=semper&dui=interdum&maecenas=mauris&tristique=ullamcorper&est=purus&et=sit&tempus=amet&semper=nulla');
insert into Map (mapID, trailID, mapURL) values (88, 88, 'http://purevolume.com/tortor.png?sit=eu&amet=mi&erat=nulla&nulla=ac&tempus=enim&vivamus=in&in=tempor&felis=turpis&eu=nec&sapien=euismod&cursus=scelerisque&vestibulum=quam&proin=turpis&eu=adipiscing&mi=lorem&nulla=vitae&ac=mattis&enim=nibh&in=ligula&tempor=nec&turpis=sem&nec=duis&euismod=aliquam&scelerisque=convallis&quam=nunc&turpis=proin&adipiscing=at&lorem=turpis&vitae=a&mattis=pede&nibh=posuere&ligula=nonummy&nec=integer&sem=non&duis=velit&aliquam=donec&convallis=diam&nunc=neque&proin=vestibulum&at=eget&turpis=vulputate&a=ut&pede=ultrices&posuere=vel&nonummy=augue&integer=vestibulum&non=ante&velit=ipsum&donec=primis&diam=in&neque=faucibus&vestibulum=orci&eget=luctus&vulputate=et&ut=ultrices&ultrices=posuere&vel=cubilia&augue=curae&vestibulum=donec&ante=pharetra&ipsum=magna&primis=vestibulum&in=aliquet&faucibus=ultrices&orci=erat&luctus=tortor&et=sollicitudin&ultrices=mi');
insert into Map (mapID, trailID, mapURL) values (89, 89, 'http://reuters.com/arcu.jpg?luctus=aliquam&et=erat&ultrices=volutpat&posuere=in&cubilia=congue&curae=etiam&mauris=justo&viverra=etiam&diam=pretium&vitae=iaculis&quam=justo&suspendisse=in&potenti=hac&nullam=habitasse&porttitor=platea&lacus=dictumst&at=etiam&turpis=faucibus&donec=cursus&posuere=urna&metus=ut&vitae=tellus&ipsum=nulla&aliquam=ut&non=erat&mauris=id&morbi=mauris&non=vulputate&lectus=elementum&aliquam=nullam&sit=varius&amet=nulla&diam=facilisi&in=cras&magna=non&bibendum=velit&imperdiet=nec&nullam=nisi&orci=vulputate&pede=nonummy&venenatis=maecenas&non=tincidunt&sodales=lacus&sed=at&tincidunt=velit&eu=vivamus&felis=vel&fusce=nulla&posuere=eget&felis=eros&sed=elementum&lacus=pellentesque&morbi=quisque&sem=porta&mauris=volutpat');
insert into Map (mapID, trailID, mapURL) values (90, 90, 'https://elegantthemes.com/ultrices/posuere/cubilia/curae/duis/faucibus/accumsan.jsp?eros=mauris&viverra=eget&eget=massa&congue=tempor&eget=convallis&semper=nulla&rutrum=neque&nulla=libero&nunc=convallis&purus=eget&phasellus=eleifend&in=luctus&felis=ultricies&donec=eu&semper=nibh&sapien=quisque&a=id&libero=justo&nam=sit&dui=amet&proin=sapien&leo=dignissim&odio=vestibulum&porttitor=vestibulum&id=ante&consequat=ipsum&in=primis&consequat=in&ut=faucibus&nulla=orci&sed=luctus&accumsan=et&felis=ultrices&ut=posuere&at=cubilia&dolor=curae&quis=nulla&odio=dapibus&consequat=dolor&varius=vel&integer=est&ac=donec&leo=odio&pellentesque=justo&ultrices=sollicitudin&mattis=ut&odio=suscipit&donec=a&vitae=feugiat&nisi=et&nam=eros&ultrices=vestibulum&libero=ac&non=est&mattis=lacinia&pulvinar=nisi&nulla=venenatis&pede=tristique&ullamcorper=fusce&augue=congue&a=diam&suscipit=id&nulla=ornare&elit=imperdiet&ac=sapien&nulla=urna');
insert into Map (mapID, trailID, mapURL) values (91, 91, 'https://ox.ac.uk/integer/non/velit.jsp?etiam=aenean&pretium=fermentum&iaculis=donec&justo=ut&in=mauris&hac=eget&habitasse=massa&platea=tempor&dictumst=convallis&etiam=nulla&faucibus=neque&cursus=libero&urna=convallis&ut=eget&tellus=eleifend&nulla=luctus&ut=ultricies&erat=eu&id=nibh&mauris=quisque&vulputate=id&elementum=justo&nullam=sit&varius=amet&nulla=sapien&facilisi=dignissim&cras=vestibulum&non=vestibulum&velit=ante&nec=ipsum&nisi=primis&vulputate=in&nonummy=faucibus&maecenas=orci&tincidunt=luctus&lacus=et&at=ultrices&velit=posuere&vivamus=cubilia&vel=curae&nulla=nulla&eget=dapibus&eros=dolor&elementum=vel&pellentesque=est&quisque=donec&porta=odio&volutpat=justo&erat=sollicitudin&quisque=ut&erat=suscipit&eros=a&viverra=feugiat&eget=et&congue=eros&eget=vestibulum&semper=ac&rutrum=est&nulla=lacinia&nunc=nisi&purus=venenatis&phasellus=tristique');
insert into Map (mapID, trailID, mapURL) values (92, 92, 'https://utexas.edu/interdum/mauris/non/ligula.jsp?ultrices=ut&posuere=ultrices&cubilia=vel&curae=augue&nulla=vestibulum&dapibus=ante&dolor=ipsum&vel=primis&est=in&donec=faucibus&odio=orci&justo=luctus&sollicitudin=et&ut=ultrices&suscipit=posuere&a=cubilia&feugiat=curae&et=donec&eros=pharetra&vestibulum=magna&ac=vestibulum&est=aliquet&lacinia=ultrices&nisi=erat&venenatis=tortor&tristique=sollicitudin&fusce=mi&congue=sit&diam=amet&id=lobortis&ornare=sapien&imperdiet=sapien&sapien=non&urna=mi&pretium=integer&nisl=ac&ut=neque&volutpat=duis&sapien=bibendum&arcu=morbi&sed=non&augue=quam&aliquam=nec&erat=dui&volutpat=luctus&in=rutrum&congue=nulla&etiam=tellus&justo=in&etiam=sagittis&pretium=dui&iaculis=vel&justo=nisl&in=duis&hac=ac&habitasse=nibh&platea=fusce&dictumst=lacus&etiam=purus&faucibus=aliquet&cursus=at&urna=feugiat&ut=non&tellus=pretium&nulla=quis&ut=lectus&erat=suspendisse&id=potenti&mauris=in&vulputate=eleifend&elementum=quam&nullam=a&varius=odio&nulla=in&facilisi=hac&cras=habitasse&non=platea&velit=dictumst&nec=maecenas&nisi=ut&vulputate=massa&nonummy=quis&maecenas=augue&tincidunt=luctus&lacus=tincidunt&at=nulla&velit=mollis&vivamus=molestie&vel=lorem&nulla=quisque&eget=ut&eros=erat&elementum=curabitur&pellentesque=gravida&quisque=nisi&porta=at');
insert into Map (mapID, trailID, mapURL) values (93, 93, 'https://symantec.com/curabitur/in/libero/ut.html?pede=ligula&ac=pellentesque&diam=ultrices&cras=phasellus&pellentesque=id&volutpat=sapien&dui=in&maecenas=sapien&tristique=iaculis&est=congue&et=vivamus&tempus=metus&semper=arcu&est=adipiscing&quam=molestie&pharetra=hendrerit&magna=at&ac=vulputate&consequat=vitae&metus=nisl&sapien=aenean&ut=lectus&nunc=pellentesque&vestibulum=eget&ante=nunc&ipsum=donec&primis=quis&in=orci&faucibus=eget&orci=orci&luctus=vehicula&et=condimentum&ultrices=curabitur&posuere=in&cubilia=libero&curae=ut&mauris=massa&viverra=volutpat&diam=convallis&vitae=morbi&quam=odio&suspendisse=odio&potenti=elementum&nullam=eu&porttitor=interdum&lacus=eu&at=tincidunt&turpis=in&donec=leo&posuere=maecenas&metus=pulvinar&vitae=lobortis&ipsum=est&aliquam=phasellus');
insert into Map (mapID, trailID, mapURL) values (94, 94, 'http://springer.com/nisi/at/nibh/in/hac/habitasse/platea.png?eu=felis&sapien=donec&cursus=semper&vestibulum=sapien&proin=a&eu=libero&mi=nam&nulla=dui&ac=proin&enim=leo&in=odio&tempor=porttitor&turpis=id&nec=consequat&euismod=in&scelerisque=consequat&quam=ut&turpis=nulla&adipiscing=sed&lorem=accumsan&vitae=felis&mattis=ut&nibh=at&ligula=dolor&nec=quis&sem=odio&duis=consequat&aliquam=varius&convallis=integer&nunc=ac&proin=leo&at=pellentesque&turpis=ultrices&a=mattis&pede=odio&posuere=donec&nonummy=vitae&integer=nisi&non=nam&velit=ultrices&donec=libero&diam=non&neque=mattis&vestibulum=pulvinar&eget=nulla&vulputate=pede&ut=ullamcorper&ultrices=augue&vel=a&augue=suscipit&vestibulum=nulla&ante=elit&ipsum=ac');
insert into Map (mapID, trailID, mapURL) values (95, 95, 'http://miibeian.gov.cn/elit/proin/interdum/mauris/non/ligula/pellentesque.jpg?felis=diam&fusce=erat&posuere=fermentum&felis=justo&sed=nec&lacus=condimentum&morbi=neque&sem=sapien&mauris=placerat&laoreet=ante&ut=nulla&rhoncus=justo&aliquet=aliquam&pulvinar=quis&sed=turpis&nisl=eget&nunc=elit&rhoncus=sodales&dui=scelerisque&vel=mauris&sem=sit&sed=amet&sagittis=eros&nam=suspendisse&congue=accumsan&risus=tortor&semper=quis&porta=turpis&volutpat=sed&quam=ante&pede=vivamus&lobortis=tortor&ligula=duis&sit=mattis&amet=egestas&eleifend=metus&pede=aenean&libero=fermentum&quis=donec&orci=ut&nullam=mauris&molestie=eget&nibh=massa&in=tempor&lectus=convallis&pellentesque=nulla&at=neque&nulla=libero&suspendisse=convallis&potenti=eget&cras=eleifend&in=luctus&purus=ultricies&eu=eu&magna=nibh&vulputate=quisque&luctus=id&cum=justo&sociis=sit&natoque=amet&penatibus=sapien&et=dignissim&magnis=vestibulum&dis=vestibulum&parturient=ante&montes=ipsum&nascetur=primis&ridiculus=in&mus=faucibus&vivamus=orci&vestibulum=luctus&sagittis=et&sapien=ultrices&cum=posuere');
insert into Map (mapID, trailID, mapURL) values (96, 96, 'https://wikipedia.org/est/phasellus/sit.png?iaculis=lacinia&congue=erat&vivamus=vestibulum&metus=sed&arcu=magna&adipiscing=at&molestie=nunc&hendrerit=commodo&at=placerat&vulputate=praesent&vitae=blandit&nisl=nam&aenean=nulla&lectus=integer&pellentesque=pede&eget=justo&nunc=lacinia&donec=eget&quis=tincidunt&orci=eget&eget=tempus&orci=vel&vehicula=pede&condimentum=morbi&curabitur=porttitor&in=lorem&libero=id&ut=ligula&massa=suspendisse&volutpat=ornare&convallis=consequat&morbi=lectus&odio=in&odio=est&elementum=risus&eu=auctor&interdum=sed&eu=tristique&tincidunt=in&in=tempus&leo=sit&maecenas=amet&pulvinar=sem&lobortis=fusce&est=consequat&phasellus=nulla');
insert into Map (mapID, trailID, mapURL) values (97, 97, 'http://disqus.com/vestibulum/aliquet/ultrices/erat/tortor/sollicitudin.jpg?quam=ultrices&sapien=aliquet&varius=maecenas&ut=leo&blandit=odio&non=condimentum&interdum=id&in=luctus&ante=nec&vestibulum=molestie&ante=sed&ipsum=justo&primis=pellentesque&in=viverra&faucibus=pede&orci=ac&luctus=diam&et=cras&ultrices=pellentesque&posuere=volutpat');
insert into Map (mapID, trailID, mapURL) values (98, 98, 'https://nih.gov/tortor.xml?dictumst=metus&aliquam=vitae&augue=ipsum&quam=aliquam&sollicitudin=non&vitae=mauris&consectetuer=morbi&eget=non&rutrum=lectus&at=aliquam&lorem=sit&integer=amet&tincidunt=diam&ante=in&vel=magna&ipsum=bibendum&praesent=imperdiet&blandit=nullam&lacinia=orci&erat=pede&vestibulum=venenatis&sed=non&magna=sodales&at=sed&nunc=tincidunt&commodo=eu&placerat=felis&praesent=fusce&blandit=posuere&nam=felis&nulla=sed&integer=lacus&pede=morbi&justo=sem&lacinia=mauris&eget=laoreet&tincidunt=ut&eget=rhoncus&tempus=aliquet&vel=pulvinar&pede=sed&morbi=nisl&porttitor=nunc&lorem=rhoncus&id=dui&ligula=vel&suspendisse=sem&ornare=sed&consequat=sagittis&lectus=nam&in=congue&est=risus&risus=semper&auctor=porta&sed=volutpat&tristique=quam&in=pede&tempus=lobortis&sit=ligula&amet=sit&sem=amet&fusce=eleifend&consequat=pede&nulla=libero&nisl=quis&nunc=orci&nisl=nullam&duis=molestie&bibendum=nibh&felis=in&sed=lectus&interdum=pellentesque&venenatis=at&turpis=nulla&enim=suspendisse&blandit=potenti&mi=cras&in=in&porttitor=purus&pede=eu&justo=magna&eu=vulputate&massa=luctus&donec=cum&dapibus=sociis&duis=natoque&at=penatibus&velit=et&eu=magnis&est=dis&congue=parturient&elementum=montes&in=nascetur&hac=ridiculus&habitasse=mus&platea=vivamus&dictumst=vestibulum');
insert into Map (mapID, trailID, mapURL) values (99, 99, 'https://bing.com/integer/aliquet.jsp?luctus=sit&ultricies=amet&eu=erat&nibh=nulla&quisque=tempus&id=vivamus&justo=in&sit=felis&amet=eu&sapien=sapien&dignissim=cursus&vestibulum=vestibulum&vestibulum=proin&ante=eu&ipsum=mi&primis=nulla&in=ac&faucibus=enim&orci=in&luctus=tempor&et=turpis&ultrices=nec&posuere=euismod&cubilia=scelerisque&curae=quam&nulla=turpis&dapibus=adipiscing&dolor=lorem&vel=vitae&est=mattis&donec=nibh&odio=ligula&justo=nec&sollicitudin=sem&ut=duis&suscipit=aliquam&a=convallis&feugiat=nunc&et=proin&eros=at&vestibulum=turpis&ac=a&est=pede&lacinia=posuere&nisi=nonummy&venenatis=integer&tristique=non&fusce=velit&congue=donec&diam=diam&id=neque&ornare=vestibulum&imperdiet=eget&sapien=vulputate&urna=ut&pretium=ultrices&nisl=vel&ut=augue&volutpat=vestibulum&sapien=ante&arcu=ipsum');
insert into Map (mapID, trailID, mapURL) values (100, 100, 'https://buzzfeed.com/semper/rutrum.xml?non=mi&lectus=nulla&aliquam=ac&sit=enim&amet=in&diam=tempor&in=turpis&magna=nec&bibendum=euismod&imperdiet=scelerisque&nullam=quam&orci=turpis&pede=adipiscing&venenatis=lorem&non=vitae&sodales=mattis&sed=nibh&tincidunt=ligula&eu=nec&felis=sem&fusce=duis&posuere=aliquam&felis=convallis&sed=nunc&lacus=proin&morbi=at&sem=turpis&mauris=a&laoreet=pede&ut=posuere&rhoncus=nonummy&aliquet=integer&pulvinar=non&sed=velit&nisl=donec&nunc=diam&rhoncus=neque&dui=vestibulum&vel=eget&sem=vulputate&sed=ut&sagittis=ultrices&nam=vel&congue=augue');

insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (1, 1, 1, 36, '8/14/2023', 'Metz, Wolff and Beier');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (2, 2, 2, 52, '12/28/2023', 'Bogisich Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (3, 3, 3, 61, '9/18/2023', 'VonRueden-Bruen');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (4, 4, 4, 46, '10/26/2023', 'Smitham, Botsford and Hilpert');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (5, 5, 5, 59, '5/17/2023', 'Mayer, Heller and Johns');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (6, 6, 6, 29, '2/29/2024', 'Farrell-Padberg');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (7, 7, 7, 82, '9/19/2023', 'Murazik Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (8, 8, 8, 89, '2/14/2024', 'Jacobs and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (9, 9, 9, 28, '6/11/2023', 'Weissnat, King and Schoen');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (10, 10, 10, 82, '9/7/2023', 'Blick Inc');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (11, 11, 11, 45, '1/9/2024', 'Hayes LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (12, 12, 12, 38, '8/6/2023', 'Fisher-Mohr');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (13, 13, 13, 52, '7/13/2023', 'Ernser-Grady');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (14, 14, 14, 7, '9/27/2023', 'Legros, Moore and Halvorson');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (15, 15, 15, 80, '12/11/2023', 'Waters and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (16, 16, 16, 84, '1/6/2024', 'Wilderman, Marquardt and Pollich');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (17, 17, 17, 45, '6/19/2023', 'Gleichner, Upton and Roberts');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (18, 18, 18, 50, '2/13/2024', 'Hodkiewicz-Hoppe');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (19, 19, 19, 95, '2/8/2024', 'Terry-Miller');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (20, 20, 20, 49, '11/17/2023', 'O''Keefe and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (21, 21, 21, 69, '10/23/2023', 'Homenick Inc');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (22, 22, 22, 33, '1/30/2024', 'Daniel, Reynolds and Abbott');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (23, 23, 23, 67, '8/16/2023', 'Rohan-Hodkiewicz');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (24, 24, 24, 54, '4/22/2023', 'Rolfson, Paucek and Harris');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (25, 25, 25, 22, '10/27/2023', 'Stehr Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (26, 26, 26, 13, '5/29/2023', 'Little-Nolan');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (27, 27, 27, 82, '12/2/2023', 'Fay, Von and Zieme');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (28, 28, 28, 92, '1/12/2024', 'Effertz-Bayer');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (29, 29, 29, 1, '10/31/2023', 'Leuschke and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (30, 30, 30, 34, '8/18/2023', 'O''Conner LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (31, 31, 31, 59, '12/25/2023', 'Daniel, Aufderhar and Bergnaum');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (32, 32, 32, 52, '5/14/2023', 'Leffler-Lehner');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (33, 33, 33, 2, '7/26/2023', 'Schumm, Willms and Steuber');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (34, 34, 34, 84, '9/22/2023', 'Borer-Erdman');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (35, 35, 35, 65, '11/8/2023', 'Murray, Kiehn and Moen');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (36, 36, 36, 6, '11/22/2023', 'Hahn-Batz');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (37, 37, 37, 69, '2/22/2024', 'Prosacco Inc');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (38, 38, 38, 6, '4/26/2023', 'Okuneva, Hamill and Tromp');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (39, 39, 39, 29, '6/2/2023', 'Ebert Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (40, 40, 40, 29, '11/30/2023', 'Rosenbaum, Schowalter and Goldner');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (41, 41, 41, 93, '5/27/2023', 'Labadie, Ruecker and Hickle');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (42, 42, 42, 99, '5/20/2023', 'Grady and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (43, 43, 43, 64, '3/21/2023', 'Legros-Mueller');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (44, 44, 44, 38, '6/3/2023', 'Hickle, Bruen and Lockman');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (45, 45, 45, 75, '1/7/2024', 'Bartell LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (46, 46, 46, 16, '3/2/2024', 'Sanford, Conroy and Beer');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (47, 47, 47, 88, '11/2/2023', 'Denesik, Gutkowski and Wunsch');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (48, 48, 48, 5, '11/25/2023', 'Nitzsche, Lebsack and Lueilwitz');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (49, 49, 49, 64, '4/28/2023', 'Erdman, Quigley and Hane');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (50, 50, 50, 53, '5/12/2023', 'Mohr-Pfeffer');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (51, 51, 51, 73, '10/13/2023', 'Walter-Gleichner');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (52, 52, 52, 85, '12/18/2023', 'Jacobs, Kreiger and Larkin');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (53, 53, 53, 41, '10/30/2023', 'Beier-Hettinger');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (54, 54, 54, 94, '12/5/2023', 'Donnelly LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (55, 55, 55, 88, '1/20/2024', 'Krajcik Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (56, 56, 56, 2, '11/10/2023', 'Runte-Yost');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (57, 57, 57, 70, '12/23/2023', 'Weimann, Fay and Hoeger');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (58, 58, 58, 37, '9/16/2023', 'Schroeder, Gutkowski and Hartmann');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (59, 59, 59, 31, '12/20/2023', 'Bednar-Feil');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (60, 60, 60, 14, '4/20/2023', 'Harber, Dooley and Bartoletti');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (61, 61, 61, 65, '3/13/2023', 'Emard-Kling');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (62, 62, 62, 64, '7/8/2023', 'Wintheiser LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (63, 63, 63, 55, '2/11/2024', 'Johnston and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (64, 64, 64, 59, '7/31/2023', 'Grimes, Harvey and Crona');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (65, 65, 65, 74, '8/3/2023', 'Gerlach, Hansen and Nader');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (66, 66, 66, 36, '9/16/2023', 'Bernier-Gleason');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (67, 67, 67, 82, '4/6/2023', 'Lind and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (68, 68, 68, 45, '11/4/2023', 'Spencer and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (69, 69, 69, 68, '8/17/2023', 'Ferry and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (70, 70, 70, 26, '3/5/2023', 'Kulas and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (71, 71, 71, 58, '9/2/2023', 'Prohaska, Heaney and Satterfield');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (72, 72, 72, 26, '10/19/2023', 'Heaney, Blanda and Sawayn');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (73, 73, 73, 19, '5/14/2023', 'Schoen, Veum and Shields');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (74, 74, 74, 87, '6/10/2023', 'Greenholt-Hahn');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (75, 75, 75, 12, '1/26/2024', 'Luettgen-Hoeger');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (76, 76, 76, 4, '3/8/2023', 'Littel-Aufderhar');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (77, 77, 77, 70, '7/28/2023', 'Homenick-Franecki');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (78, 78, 78, 65, '8/21/2023', 'Schaden LLC');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (79, 79, 79, 68, '5/15/2023', 'Watsica-Von');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (80, 80, 80, 81, '2/9/2024', 'Rolfson, Mante and Gutmann');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (81, 81, 81, 49, '6/16/2023', 'Fadel-Parisian');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (82, 82, 82, 4, '1/25/2024', 'Effertz and Sons');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (83, 83, 83, 68, '1/1/2024', 'Treutel, Little and Roob');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (84, 84, 84, 72, '6/24/2023', 'Deckow-Orn');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (85, 85, 85, 10, '4/4/2023', 'Anderson, Windler and Emard');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (86, 86, 86, 46, '8/19/2023', 'Boyle, Schmidt and Schimmel');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (87, 87, 87, 14, '1/2/2024', 'Robel-Murray');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (88, 88, 88, 90, '1/16/2024', 'Ritchie Inc');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (89, 89, 89, 24, '8/6/2023', 'Shields Inc');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (90, 90, 90, 47, '12/18/2023', 'Ratke-Renner');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (91, 91, 91, 72, '4/23/2023', 'Robel-Gibson');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (92, 92, 92, 13, '1/3/2024', 'Dickinson-Romaguera');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (93, 93, 93, 68, '1/25/2024', 'O''Hara, Von and Schimmel');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (94, 94, 94, 57, '6/30/2023', 'Ernser Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (95, 95, 95, 76, '11/2/2023', 'O''Connell, Nienow and Rau');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (96, 96, 96, 71, '11/27/2023', 'VonRueden Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (97, 97, 97, 96, '5/29/2023', 'Wolff, Doyle and Reichel');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (98, 98, 98, 32, '8/12/2023', 'Hermiston Group');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (99, 99, 99, 46, '2/18/2024', 'Leuschke, Runolfsson and Johns');
insert into Rating (ratingID, userID, trailID, ratingNum, date, review) values (100, 100, 100, 31, '9/20/2023', 'Batz, Windler and Cole');

insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (1, 1, 1, 1, 1, 'Shields and Sons', 1, false, '672-644-7324', 'hgregolotti0@vkontakte.ru');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (2, 2, 2, 2, 2, 'Fisher Inc', 2, false, '921-694-3053', 'spassion1@canalblog.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (3, 3, 3, 3, 3, 'Jones, Goyette and Little', 3, false, '190-802-2588', 'rstukings2@ed.gov');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (4, 4, 4, 4, 4, 'Hane LLC', 4, true, '961-395-6728', 'dleeburn3@princeton.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (5, 5, 5, 5, 5, 'Harber-Walsh', 5, false, '127-160-6727', 'bmaty4@fotki.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (6, 6, 6, 6, 6, 'Ryan-Tremblay', 6, false, '734-271-6004', 'ctudgay5@mtv.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (7, 7, 7, 7, 7, 'Gislason-Jenkins', 7, false, '995-258-1037', 'gcharkham6@tripadvisor.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (8, 8, 8, 8, 8, 'McLaughlin, Kuphal and Runolfsson', 8, false, '495-928-7896', 'mmaxwell7@nymag.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (9, 9, 9, 9, 9, 'Heidenreich-Volkman', 9, true, '979-299-4220', 'rgaudin8@techcrunch.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (10, 10, 10, 10, 10, 'O''Kon-Baumbach', 10, true, '356-433-5835', 'bwehden9@e-recht24.de');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (11, 11, 11, 11, 11, 'Connelly, Baumbach and Hodkiewicz', 11, false, '684-960-2747', 'uabbiea@npr.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (12, 12, 12, 12, 12, 'Heller-Mante', 12, true, '700-221-7884', 'bmctearb@mit.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (13, 13, 13, 13, 13, 'Schoen, Rolfson and Schaden', 13, true, '828-315-5565', 'ldoerfferc@slate.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (14, 14, 14, 14, 14, 'Gulgowski, Mraz and Gerhold', 14, false, '200-908-9289', 'jaudusd@msu.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (15, 15, 15, 15, 15, 'Beer Inc', 15, false, '150-414-9412', 'rdeversone@un.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (16, 16, 16, 16, 16, 'Kohler-Daniel', 16, false, '434-249-5558', 'vjorckef@comcast.net');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (17, 17, 17, 17, 17, 'Lebsack, O''Kon and Botsford', 17, false, '272-500-4876', 'kshankleg@woothemes.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (18, 18, 18, 18, 18, 'Rodriguez-Lindgren', 18, true, '300-329-0469', 'ebrayh@cornell.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (19, 19, 19, 19, 19, 'Hickle, Abbott and Becker', 19, false, '449-481-5391', 'tpicklei@sina.com.cn');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (20, 20, 20, 20, 20, 'Hilpert and Sons', 20, false, '327-441-8980', 'vshevlanej@chicagotribune.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (21, 21, 21, 21, 21, 'Schmitt and Sons', 21, true, '182-732-5617', 'rjaggersk@surveymonkey.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (22, 22, 22, 22, 22, 'Balistreri LLC', 22, false, '144-342-6671', 'gcollinsonl@merriam-webster.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (23, 23, 23, 23, 23, 'Jacobi-Gerlach', 23, false, '372-109-5503', 'tgwilliamm@disqus.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (24, 24, 24, 24, 24, 'Kilback LLC', 24, true, '433-741-2723', 'hrollingn@instagram.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (25, 25, 25, 25, 25, 'Smitham, O''Conner and Zieme', 25, false, '517-397-1267', 'eitzcovicho@flickr.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (26, 26, 26, 26, 26, 'Hagenes, Wilderman and Dare', 26, false, '990-887-4651', 'mquadlingp@csmonitor.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (27, 27, 27, 27, 27, 'Jacobi-Beatty', 27, false, '523-681-0760', 'mamphlettq@arizona.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (28, 28, 28, 28, 28, 'Towne, Rice and Auer', 28, false, '985-614-9081', 'evaggesr@wired.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (29, 29, 29, 29, 29, 'Stoltenberg-Barton', 29, false, '642-184-0635', 'gcharrissons@xing.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (30, 30, 30, 30, 30, 'Rohan, Lebsack and Purdy', 30, true, '798-842-6631', 'dphilpotst@nih.gov');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (31, 31, 31, 31, 31, 'Sawayn, Morissette and Feest', 31, false, '378-712-5335', 'cshowellu@weebly.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (32, 32, 32, 32, 32, 'Raynor-Fay', 32, false, '421-907-5712', 'ksollyv@goo.gl');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (33, 33, 33, 33, 33, 'Carter, Smitham and Dietrich', 33, true, '861-401-5215', 'njollyw@soundcloud.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (34, 34, 34, 34, 34, 'Kirlin-Braun', 34, true, '800-716-4025', 'dcheasmanx@engadget.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (35, 35, 35, 35, 35, 'Swift, Hintz and Christiansen', 35, false, '225-129-2413', 'dmccoveneyy@goodreads.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (36, 36, 36, 36, 36, 'Stamm, Cole and Runolfsdottir', 36, false, '317-820-6229', 'gbroomhallz@fc2.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (37, 37, 37, 37, 37, 'Kub-Schaden', 37, true, '221-834-4996', 'opriditt10@fda.gov');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (38, 38, 38, 38, 38, 'Stroman-Abshire', 38, false, '305-810-6900', 'mgoodswen11@yellowpages.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (39, 39, 39, 39, 39, 'Halvorson-O''Kon', 39, true, '634-366-4486', 'ivellden12@gmpg.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (40, 40, 40, 40, 40, 'Funk, Bruen and Osinski', 40, false, '400-532-0913', 'bhelstrom13@bloomberg.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (41, 41, 41, 41, 41, 'Kunde, Kassulke and McDermott', 41, true, '424-166-8482', 'renstone14@amazon.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (42, 42, 42, 42, 42, 'Goyette-Rodriguez', 42, false, '299-737-6581', 'ajanoschek15@marketwatch.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (43, 43, 43, 43, 43, 'Parker, Schultz and Lindgren', 43, false, '514-304-4037', 'mborne16@wikipedia.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (44, 44, 44, 44, 44, 'Lynch-Anderson', 44, false, '692-787-9382', 'mrubenfeld17@harvard.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (45, 45, 45, 45, 45, 'Harber-Herzog', 45, false, '664-698-8878', 'esyplus18@soup.io');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (46, 46, 46, 46, 46, 'Grant-Reichel', 46, true, '948-651-7697', 'jfitzgeorge19@studiopress.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (47, 47, 47, 47, 47, 'Rempel-Armstrong', 47, true, '304-827-2966', 'rtempleman1a@comcast.net');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (48, 48, 48, 48, 48, 'McLaughlin-Runolfsson', 48, true, '213-244-8507', 'jschruyer1b@php.net');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (49, 49, 49, 49, 49, 'Wiza, Dickens and Bayer', 49, false, '214-500-8156', 'bforber1c@lulu.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (50, 50, 50, 50, 50, 'Stracke Inc', 50, true, '165-588-5324', 'lmarcussen1d@wp.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (51, 51, 51, 51, 51, 'Hintz-Konopelski', 51, true, '608-233-8980', 'hgrishaev1e@yahoo.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (52, 52, 52, 52, 52, 'Gleason, Reynolds and Mohr', 52, true, '154-352-7377', 'kkembry1f@patch.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (53, 53, 53, 53, 53, 'Hegmann-Champlin', 53, false, '504-424-9027', 'mfilipputti1g@discuz.net');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (54, 54, 54, 54, 54, 'Glover-Rutherford', 54, true, '853-410-8757', 'bcraney1h@ucoz.ru');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (55, 55, 55, 55, 55, 'Sanford, Lindgren and Stanton', 55, false, '124-395-4041', 'mcromblehome1i@hatena.ne.jp');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (56, 56, 56, 56, 56, 'Breitenberg, Botsford and Boyle', 56, true, '254-186-5052', 'dfrench1j@posterous.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (57, 57, 57, 57, 57, 'Bartoletti, Quitzon and Hills', 57, false, '815-517-3417', 'nchristophers1k@umn.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (58, 58, 58, 58, 58, 'Bode Group', 58, false, '643-993-4593', 'acolborn1l@blogtalkradio.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (59, 59, 59, 59, 59, 'Von-Goodwin', 59, false, '584-700-8875', 'kerrichelli1m@cisco.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (60, 60, 60, 60, 60, 'Bosco Inc', 60, true, '186-843-3915', 'fohrt1n@wikia.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (61, 61, 61, 61, 61, 'Reynolds-Metz', 61, true, '124-518-8553', 'nseakings1o@g.co');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (62, 62, 62, 62, 62, 'MacGyver Inc', 62, true, '349-551-2665', 'rwoodward1p@seattletimes.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (63, 63, 63, 63, 63, 'Ullrich-Swaniawski', 63, true, '420-345-5352', 'ckellie1q@mediafire.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (64, 64, 64, 64, 64, 'Moen LLC', 64, true, '964-701-8712', 'anouch1r@ted.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (65, 65, 65, 65, 65, 'Bayer, Pacocha and Kilback', 65, true, '568-270-6637', 'uduncan1s@army.mil');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (66, 66, 66, 66, 66, 'Mann, Wiza and Goldner', 66, false, '116-788-4989', 'acamilleri1t@examiner.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (67, 67, 67, 67, 67, 'Hermann-Kovacek', 67, true, '669-391-2798', 'ehaberjam1u@joomla.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (68, 68, 68, 68, 68, 'Morar-Lakin', 68, false, '290-678-2604', 'eprop1v@t-online.de');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (69, 69, 69, 69, 69, 'Schumm LLC', 69, false, '499-130-8874', 'ghakonsson1w@live.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (70, 70, 70, 70, 70, 'Moore, Ebert and Paucek', 70, true, '207-827-5388', 'yworner1x@businessinsider.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (71, 71, 71, 71, 71, 'O''Conner Inc', 71, true, '757-845-2104', 'tsleight1y@yandex.ru');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (72, 72, 72, 72, 72, 'Sipes Inc', 72, false, '585-147-7690', 'horriss1z@army.mil');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (73, 73, 73, 73, 73, 'Abshire-Okuneva', 73, true, '196-172-2733', 'hsleeman20@chron.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (74, 74, 74, 74, 74, 'Parker, Cremin and Cremin', 74, false, '404-254-9863', 'jnickols21@yandex.ru');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (75, 75, 75, 75, 75, 'Padberg Group', 75, true, '636-350-1038', 'gbye22@mit.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (76, 76, 76, 76, 76, 'Mueller, Kautzer and Ratke', 76, true, '629-204-1717', 'sdagostino23@mysql.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (77, 77, 77, 77, 77, 'Renner LLC', 77, false, '861-647-2471', 'mfernandez24@rakuten.co.jp');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (78, 78, 78, 78, 78, 'Kovacek-Pfeffer', 78, false, '152-752-6849', 'grawlin25@imageshack.us');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (79, 79, 79, 79, 79, 'Spencer-Goodwin', 79, true, '714-351-8660', 'vcopping26@edublogs.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (80, 80, 80, 80, 80, 'Jacobs-Moore', 80, true, '874-238-6406', 'cdunbabin27@foxnews.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (81, 81, 81, 81, 81, 'Lueilwitz-Herman', 81, true, '896-101-2550', 'lbenz28@com.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (82, 82, 82, 82, 82, 'Dickinson Inc', 82, true, '776-949-2731', 'tshackle29@bizjournals.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (83, 83, 83, 83, 83, 'Mante-Adams', 83, true, '582-674-4472', 'lscobie2a@vkontakte.ru');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (84, 84, 84, 84, 84, 'Streich, Howe and Wiza', 84, true, '712-742-3701', 'bdooney2b@g.co');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (85, 85, 85, 85, 85, 'Reynolds Group', 85, false, '479-735-7899', 'hspinnace2c@paypal.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (86, 86, 86, 86, 86, 'Connelly, Anderson and Sporer', 86, false, '860-697-9171', 'esharma2d@fc2.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (87, 87, 87, 87, 87, 'Mohr-Rowe', 87, true, '650-729-1503', 'egatman2e@admin.ch');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (88, 88, 88, 88, 88, 'Ratke Group', 88, true, '868-541-1042', 'bhendrickson2f@tiny.cc');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (89, 89, 89, 89, 89, 'Morar and Sons', 89, true, '976-570-5822', 'dbownass2g@forbes.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (90, 90, 90, 90, 90, 'Nienow-Heathcote', 90, true, '394-119-0971', 'cseary2h@about.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (91, 91, 91, 91, 91, 'Borer, Vandervort and Wiza', 91, false, '729-541-7978', 'rfrobisher2i@uol.com.br');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (92, 92, 92, 92, 92, 'Stiedemann LLC', 92, true, '452-520-7277', 'dvenditto2j@livejournal.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (93, 93, 93, 93, 93, 'Bosco-Ernser', 93, false, '534-724-0902', 'kbalas2k@apache.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (94, 94, 94, 94, 94, 'Halvorson-Bruen', 94, true, '196-430-2765', 'screasey2l@google.cn');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (95, 95, 95, 95, 95, 'Kertzmann-Hirthe', 95, false, '523-121-5387', 'balsina2m@virginia.edu');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (96, 96, 96, 96, 96, 'Metz Inc', 96, true, '492-471-9947', 'gtortice2n@gmpg.org');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (97, 97, 97, 97, 97, 'Moore-Greenholt', 97, true, '384-440-2348', 'iwadham2o@nhs.uk');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (98, 98, 98, 98, 98, 'Williamson LLC', 98, false, '493-578-4902', 'kfreire2p@latimes.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (99, 99, 99, 99, 99, 'Barton LLC', 99, false, '630-549-6903', 'gcutbush2q@chronoengine.com');
insert into User (userID, reportID, galleryID, photoID, rangerID, name, ratingID, admin, phone, email) values (100, 100, 100, 100, 100, 'Lakin, Runolfsdottir and Veum', 100, true, '730-501-8091', 'pjacobi2r@howstuffworks.com');

insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (1, 1, 1, 1, '6/5/2023', 'Hodkiewicz LLC', 'Dickens, Brakus and Brakus', 71);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (2, 2, 2, 2, '12/18/2023', 'Dicki-Blanda', 'Turner-Kihn', 37);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (3, 3, 3, 3, '9/24/2023', 'Stehr, Goodwin and Boyle', 'Price, Hagenes and Hessel', 6);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (4, 4, 4, 4, '10/5/2023', 'Rippin-Towne', 'Lockman, Green and Renner', 82);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (5, 5, 5, 5, '4/5/2023', 'Goodwin Inc', 'Larson-Buckridge', 56);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (6, 6, 6, 6, '9/11/2023', 'Hessel LLC', 'Corkery, Towne and Douglas', 6);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (7, 7, 7, 7, '7/4/2023', 'Runte Inc', 'Gutmann Group', 41);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (8, 8, 8, 8, '7/9/2023', 'Green, Harber and Nikolaus', 'McGlynn LLC', 82);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (9, 9, 9, 9, '3/1/2024', 'Marvin Inc', 'Hoppe Group', 1);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (10, 10, 10, 10, '3/8/2023', 'Dibbert, Runolfsdottir and Senger', 'Weissnat LLC', 91);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (11, 11, 11, 11, '5/14/2023', 'Dare, Hilpert and Treutel', 'Metz-Will', 45);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (12, 12, 12, 12, '11/3/2023', 'Rosenbaum-Barrows', 'Fadel-Sipes', 13);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (13, 13, 13, 13, '1/25/2024', 'Tromp, Purdy and Jaskolski', 'Hoeger, Schinner and Lowe', 54);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (14, 14, 14, 14, '4/7/2023', 'Huels, Ratke and Sporer', 'Renner Group', 83);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (15, 15, 15, 15, '11/1/2023', 'Prohaska-Rogahn', 'Anderson Group', 72);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (16, 16, 16, 16, '8/11/2023', 'Stehr-Lubowitz', 'Harvey, Lowe and Swaniawski', 83);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (17, 17, 17, 17, '11/7/2023', 'Lesch-Hamill', 'Hettinger-Koss', 97);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (18, 18, 18, 18, '4/18/2023', 'Ziemann-Spencer', 'Johns-Armstrong', 45);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (19, 19, 19, 19, '11/19/2023', 'Witting-Block', 'Harber, Boehm and Lueilwitz', 84);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (20, 20, 20, 20, '9/14/2023', 'Daugherty-Gerlach', 'Harber LLC', 21);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (21, 21, 21, 21, '5/24/2023', 'Hodkiewicz-Cormier', 'Klein-Braun', 82);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (22, 22, 22, 22, '8/14/2023', 'Volkman Group', 'Graham and Sons', 15);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (23, 23, 23, 23, '6/16/2023', 'Bogan and Sons', 'Kautzer Inc', 11);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (24, 24, 24, 24, '6/20/2023', 'Stroman, Kassulke and Lesch', 'Donnelly, Bayer and Hudson', 62);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (25, 25, 25, 25, '11/8/2023', 'Greenholt-Cassin', 'Hartmann Inc', 16);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (26, 26, 26, 26, '10/27/2023', 'Batz LLC', 'Turner Group', 47);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (27, 27, 27, 27, '2/5/2024', 'McDermott, Satterfield and Kuhlman', 'Kulas-Greenholt', 40);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (28, 28, 28, 28, '9/27/2023', 'Hilpert-Jones', 'Gislason-Tremblay', 32);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (29, 29, 29, 29, '10/7/2023', 'Gislason-Mraz', 'Thompson, Stehr and Jakubowski', 33);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (30, 30, 30, 30, '7/4/2023', 'Koss LLC', 'Swift LLC', 18);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (31, 31, 31, 31, '7/12/2023', 'Schumm Inc', 'Kutch LLC', 15);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (32, 32, 32, 32, '10/27/2023', 'Waelchi, West and Welch', 'Dicki, Schumm and Dach', 41);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (33, 33, 33, 33, '12/21/2023', 'Hettinger, Macejkovic and Bogisich', 'Dare-Hudson', 47);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (34, 34, 34, 34, '10/4/2023', 'Crooks-Brakus', 'Collins-Kuphal', 82);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (35, 35, 35, 35, '1/17/2024', 'Russel, Shields and Crona', 'Simonis, McDermott and Jacobi', 61);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (36, 36, 36, 36, '4/5/2023', 'Pacocha-Herzog', 'Gerlach Group', 87);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (37, 37, 37, 37, '1/23/2024', 'Larkin, VonRueden and Cassin', 'Schneider Inc', 67);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (38, 38, 38, 38, '8/17/2023', 'Ziemann LLC', 'O''Connell-Franecki', 78);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (39, 39, 39, 39, '1/13/2024', 'Huels, Bradtke and Spinka', 'Klein LLC', 98);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (40, 40, 40, 40, '2/19/2024', 'O''Keefe, Legros and Mertz', 'Reinger, Bruen and Sporer', 64);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (41, 41, 41, 41, '1/17/2024', 'Farrell Inc', 'Bailey, Schimmel and McClure', 91);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (42, 42, 42, 42, '5/5/2023', 'Thompson-Pollich', 'Bayer-Rosenbaum', 46);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (43, 43, 43, 43, '6/14/2023', 'Murazik, Wehner and Schuster', 'Muller, Kuhic and Stoltenberg', 9);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (44, 44, 44, 44, '5/9/2023', 'Murazik Group', 'Kautzer Group', 10);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (45, 45, 45, 45, '9/5/2023', 'Heidenreich-Friesen', 'Zieme, Little and Herman', 76);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (46, 46, 46, 46, '10/1/2023', 'Bradtke Group', 'Nicolas-Cassin', 47);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (47, 47, 47, 47, '10/18/2023', 'Kulas-Mertz', 'Krajcik and Sons', 60);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (48, 48, 48, 48, '8/14/2023', 'Daniel, Sporer and Gibson', 'Bashirian Group', 43);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (49, 49, 49, 49, '8/1/2023', 'Rau, Feest and Larkin', 'White and Sons', 40);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (50, 50, 50, 50, '3/31/2023', 'Breitenberg LLC', 'Klocko LLC', 16);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (51, 51, 51, 51, '7/8/2023', 'Vandervort Group', 'Weissnat, Reilly and Reichel', 16);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (52, 52, 52, 52, '7/3/2023', 'Bosco-Dietrich', 'Zemlak, Pollich and White', 35);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (53, 53, 53, 53, '7/24/2023', 'Mohr, Donnelly and Monahan', 'Ritchie-O''Keefe', 54);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (54, 54, 54, 54, '11/17/2023', 'Hermann-Collier', 'Zulauf-Maggio', 44);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (55, 55, 55, 55, '2/8/2024', 'Frami-Schmeler', 'Moore-Monahan', 61);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (56, 56, 56, 56, '2/9/2024', 'Romaguera, Medhurst and Jenkins', 'Hartmann, Streich and Deckow', 20);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (57, 57, 57, 57, '1/29/2024', 'Klein, Rempel and Mohr', 'Kessler-Ferry', 44);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (58, 58, 58, 58, '4/30/2023', 'Konopelski Inc', 'Bartoletti-Klein', 37);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (59, 59, 59, 59, '5/11/2023', 'Windler-Bailey', 'Mante LLC', 40);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (60, 60, 60, 60, '8/21/2023', 'Roob-Kirlin', 'O''Conner-Stehr', 94);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (61, 61, 61, 61, '6/19/2023', 'Emmerich and Sons', 'Kemmer LLC', 72);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (62, 62, 62, 62, '12/28/2023', 'Marvin, Cormier and Kuhic', 'Pagac, Cruickshank and Denesik', 93);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (63, 63, 63, 63, '4/3/2023', 'Prohaska, Weissnat and Orn', 'Rempel, Krajcik and Lemke', 50);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (64, 64, 64, 64, '9/2/2023', 'Sporer, Pfannerstill and Walter', 'Purdy, Nitzsche and Goldner', 76);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (65, 65, 65, 65, '2/4/2024', 'Mayer Inc', 'Boyer-Parker', 75);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (66, 66, 66, 66, '6/6/2023', 'Carter, Braun and Schowalter', 'Schoen and Sons', 47);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (67, 67, 67, 67, '2/9/2024', 'Hirthe, McClure and Wisoky', 'Bogan-Crist', 38);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (68, 68, 68, 68, '11/12/2023', 'Hahn Inc', 'McDermott, MacGyver and Reichert', 57);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (69, 69, 69, 69, '3/5/2023', 'Pfeffer, Swift and Bednar', 'Considine-Williamson', 40);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (70, 70, 70, 70, '5/18/2023', 'Batz, Heaney and Kling', 'Waters Group', 94);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (71, 71, 71, 71, '12/19/2023', 'Dooley Group', 'Renner, Terry and Gleason', 94);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (72, 72, 72, 72, '12/13/2023', 'Beier Group', 'Dickens-Conroy', 30);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (73, 73, 73, 73, '8/30/2023', 'Nitzsche-Brekke', 'Boehm and Sons', 49);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (74, 74, 74, 74, '4/29/2023', 'Langworth Inc', 'Raynor, Ferry and Pagac', 29);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (75, 75, 75, 75, '2/26/2024', 'Frami LLC', 'Wilkinson-Collier', 57);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (76, 76, 76, 76, '8/30/2023', 'Boyle, Ullrich and Rath', 'Swaniawski, Walter and Hoeger', 27);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (77, 77, 77, 77, '4/2/2023', 'Langworth-Schmitt', 'Rempel-Dicki', 90);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (78, 78, 78, 78, '5/24/2023', 'DuBuque-Beahan', 'Littel Group', 7);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (79, 79, 79, 79, '6/27/2023', 'Jaskolski-Dibbert', 'Zboncak Group', 69);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (80, 80, 80, 80, '4/25/2023', 'Dach, Rosenbaum and Torphy', 'Conn LLC', 21);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (81, 81, 81, 81, '12/22/2023', 'Okuneva, Corwin and Bernhard', 'McClure Group', 39);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (82, 82, 82, 82, '9/11/2023', 'Schimmel, Emard and O''Conner', 'Wilkinson-Wiza', 89);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (83, 83, 83, 83, '9/24/2023', 'Kunde LLC', 'Stoltenberg-Fahey', 64);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (84, 84, 84, 84, '5/3/2023', 'Erdman LLC', 'Buckridge-Harris', 2);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (85, 85, 85, 85, '9/5/2023', 'Hand Group', 'Douglas-Gutkowski', 7);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (86, 86, 86, 86, '9/13/2023', 'Pagac-Schaefer', 'Moen-Rempel', 29);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (87, 87, 87, 87, '11/3/2023', 'Witting, Kris and Denesik', 'Walter LLC', 85);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (88, 88, 88, 88, '7/8/2023', 'Sanford LLC', 'Altenwerth and Sons', 87);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (89, 89, 89, 89, '11/5/2023', 'Waelchi, Mosciski and Ratke', 'Kutch, Little and Flatley', 87);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (90, 90, 90, 90, '11/17/2023', 'Reichert-Ullrich', 'Harvey, Predovic and Orn', 92);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (91, 91, 91, 91, '7/19/2023', 'Luettgen, Stanton and Howe', 'Kilback LLC', 11);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (92, 92, 92, 92, '1/30/2024', 'Balistreri Group', 'MacGyver, Reichert and Rippin', 6);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (93, 93, 93, 93, '9/16/2023', 'West-Macejkovic', 'Schneider, Moore and Ullrich', 27);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (94, 94, 94, 94, '3/1/2024', 'Ortiz and Sons', 'Mueller LLC', 69);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (95, 95, 95, 95, '6/5/2023', 'Moen and Sons', 'Thiel-Gerhold', 63);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (96, 96, 96, 96, '5/27/2023', 'Senger LLC', 'Lakin, Jacobson and Quigley', 48);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (97, 97, 97, 97, '12/16/2023', 'Swaniawski-Hayes', 'Jakubowski, Kris and Corwin', 74);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (98, 98, 98, 98, '8/7/2023', 'Pacocha-Bergstrom', 'Champlin Group', 93);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (99, 99, 99, 99, '1/22/2024', 'Halvorson-Daniel', 'Strosin-Grady', 14);
insert into Report (reportID, userID, trailID, galleryID, date, reportDescription, alert, condition) values (100, 100, 100, 100, '6/13/2023', 'O''Keefe, Zboncak and Lemke', 'Cole-Witting', 95);

insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (1, 1, 1, 1, 'Libellula quadrimaculata');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (2, 2, 2, 2, 'Colobus guerza');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (3, 3, 3, 3, 'Herpestes javanicus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (4, 4, 4, 4, 'Globicephala melas');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (5, 5, 5, 5, 'Procyon lotor');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (6, 6, 6, 6, 'Limosa haemastica');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (7, 7, 7, 7, 'Phalaropus fulicarius');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (8, 8, 8, 8, 'Cathartes aura');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (9, 9, 9, 9, 'Naja nivea');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (10, 10, 10, 10, 'Vulpes chama');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (11, 11, 11, 11, 'Canis lupus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (12, 12, 12, 12, 'Phalaropus lobatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (13, 13, 13, 13, 'Gekko gecko');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (14, 14, 14, 14, 'Theropithecus gelada');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (15, 15, 15, 15, 'Streptopelia senegalensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (16, 16, 16, 16, 'Felis libyca');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (17, 17, 17, 17, 'Columba palumbus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (18, 18, 18, 18, 'Macropus agilis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (19, 19, 19, 19, 'Herpestes javanicus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (20, 20, 20, 20, 'Herpestes javanicus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (21, 21, 21, 21, 'Felis wiedi or Leopardus weidi');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (22, 22, 22, 22, 'Lorythaixoides concolor');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (23, 23, 23, 23, 'Speotyte cuniculata');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (24, 24, 24, 24, 'Sarcorhamphus papa');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (25, 25, 25, 25, 'Eremophila alpestris');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (26, 26, 26, 26, 'Dusicyon thous');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (27, 27, 27, 27, 'Sagittarius serpentarius');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (28, 28, 28, 28, 'Lutra canadensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (29, 29, 29, 29, 'Macropus fuliginosus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (30, 30, 30, 30, 'Gabianus pacificus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (31, 31, 31, 31, 'Pseudocheirus peregrinus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (32, 32, 32, 32, 'Vulpes chama');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (33, 33, 33, 33, 'unavailable');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (34, 34, 34, 34, 'Sus scrofa');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (35, 35, 35, 35, 'Pycnonotus nigricans');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (36, 36, 36, 36, 'Acrobates pygmaeus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (37, 37, 37, 37, 'Milvago chimachima');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (38, 38, 38, 38, 'Gopherus agassizii');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (39, 39, 39, 39, 'Caiman crocodilus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (40, 40, 40, 40, 'Deroptyus accipitrinus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (41, 41, 41, 41, 'Lepus townsendii');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (42, 42, 42, 42, 'Ovis canadensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (43, 43, 43, 43, 'Mazama americana');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (44, 44, 44, 44, 'Thamnolaea cinnmomeiventris');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (45, 45, 45, 45, 'Estrilda erythronotos');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (46, 46, 46, 46, 'Tenrec ecaudatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (47, 47, 47, 47, 'Ictonyx striatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (48, 48, 48, 48, 'Naja sp.');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (49, 49, 49, 49, 'Leptoptilos crumeniferus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (50, 50, 50, 50, 'Gymnorhina tibicen');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (51, 51, 51, 51, 'Scolopax minor');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (52, 52, 52, 52, 'Dasyurus maculatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (53, 53, 53, 53, 'Acrobates pygmaeus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (54, 54, 54, 54, 'Tiliqua scincoides');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (55, 55, 55, 55, 'Alces alces');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (56, 56, 56, 56, 'Hystrix cristata');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (57, 57, 57, 57, 'Trachyphonus vaillantii');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (58, 58, 58, 58, 'Bison bison');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (59, 59, 59, 59, 'Uraeginthus angolensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (60, 60, 60, 60, 'Coluber constrictor');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (61, 61, 61, 61, 'Panthera onca');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (62, 62, 62, 62, 'Paraxerus cepapi');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (63, 63, 63, 63, 'Propithecus verreauxi');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (64, 64, 64, 64, 'Macropus agilis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (65, 65, 65, 65, 'Ictonyx striatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (66, 66, 66, 66, 'Anas bahamensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (67, 67, 67, 67, 'Lepilemur rufescens');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (68, 68, 68, 68, 'Iguana iguana');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (69, 69, 69, 69, 'Anthropoides paradisea');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (70, 70, 70, 70, 'Genetta genetta');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (71, 71, 71, 71, 'Pterocles gutturalis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (72, 72, 72, 72, 'Ctenophorus ornatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (73, 73, 73, 73, 'Cervus duvauceli');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (74, 74, 74, 74, 'unavailable');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (75, 75, 75, 75, 'Tamiasciurus hudsonicus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (76, 76, 76, 76, 'Threskionis aethiopicus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (77, 77, 77, 77, 'Phalacrocorax carbo');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (78, 78, 78, 78, 'Cacatua tenuirostris');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (79, 79, 79, 79, 'Phoeniconaias minor');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (80, 80, 80, 80, 'Oreamnos americanus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (81, 81, 81, 81, 'Macropus rufogriseus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (82, 82, 82, 82, 'Pycnonotus barbatus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (83, 83, 83, 83, 'Mabuya spilogaster');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (84, 84, 84, 84, 'Ratufa indica');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (85, 85, 85, 85, 'Ovis ammon');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (86, 86, 86, 86, 'Phoenicopterus ruber');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (87, 87, 87, 87, 'Neotis denhami');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (88, 88, 88, 88, 'Chloephaga melanoptera');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (89, 89, 89, 89, 'unavailable');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (90, 90, 90, 90, 'Chlamydosaurus kingii');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (91, 91, 91, 91, 'Capreolus capreolus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (92, 92, 92, 92, 'Myiarchus tuberculifer');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (93, 93, 93, 93, 'Leprocaulinus vipera');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (94, 94, 94, 94, 'Plectopterus gambensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (95, 95, 95, 95, 'Pedetes capensis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (96, 96, 96, 96, 'Axis axis');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (97, 97, 97, 97, 'Kobus leche robertsi');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (98, 98, 98, 98, 'Crotalus adamanteus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (99, 99, 99, 99, 'Geochelone elephantopus');
insert into Gallery (galleryID, photoID, reportID, userID, galleryName) values (100, 100, 100, 100, 'Macropus robustus');

insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (1, 'Baumbach-Gutkowski', 'Zieme and Sons', 1, 'Ratufa indica', '10/31/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (2, 'Homenick-O''Connell', 'Borer-Bogisich', 2, 'Dasyprocta leporina', '2/18/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (3, 'Blick Inc', 'Feil LLC', 3, 'Trichosurus vulpecula', '9/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (4, 'Kunde Inc', 'Grant-Bergnaum', 4, 'Felis concolor', '8/21/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (5, 'Erdman-McClure', 'Pagac, Hudson and Dietrich', 5, 'Spheniscus magellanicus', '12/3/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (6, 'McGlynn, O''Keefe and Volkman', 'Okuneva, Jones and Dibbert', 6, 'Phalaropus lobatus', '11/23/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (7, 'Murphy-Jast', 'Schmitt-Deckow', 7, 'Ephippiorhynchus mycteria', '6/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (8, 'Anderson Inc', 'Breitenberg-Parker', 8, 'Mirounga angustirostris', '7/24/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (9, 'Lueilwitz, Gislason and Pouros', 'Leffler, Abshire and Padberg', 9, 'Macropus fuliginosus', '3/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (10, 'Langworth Group', 'Mraz-Harris', 10, 'Varanus sp.', '12/11/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (11, 'Windler, Nolan and Jerde', 'Senger, Cruickshank and Gorczany', 11, 'Lamprotornis sp.', '4/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (12, 'Blick, VonRueden and Jacobs', 'Rosenbaum and Sons', 12, 'Eira barbata', '12/2/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (13, 'Gleichner-Schumm', 'Davis, Hermiston and Lemke', 13, 'Ramphastos tucanus', '2/13/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (14, 'Rath-Kuhic', 'Waelchi, Daugherty and Bogisich', 14, 'Rhea americana', '11/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (15, 'Corkery Inc', 'Doyle, Ankunding and Mertz', 15, 'Crocuta crocuta', '7/15/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (16, 'Schinner-MacGyver', 'Nikolaus, Gulgowski and Strosin', 16, 'Platalea leucordia', '12/3/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (17, 'Langworth, Mann and Hyatt', 'Hauck, Bradtke and Lesch', 17, 'Butorides striatus', '4/20/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (18, 'Paucek LLC', 'Towne and Sons', 18, 'Laniarius ferrugineus', '11/24/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (19, 'Buckridge Group', 'Sawayn, Kessler and Reynolds', 19, 'Acridotheres tristis', '6/30/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (20, 'Kulas-Wehner', 'Kuhlman, Vandervort and MacGyver', 20, 'unavailable', '7/1/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (21, 'Larson, Beatty and Mills', 'Franecki Group', 21, 'Bassariscus astutus', '8/4/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (22, 'Breitenberg, Klein and Prohaska', 'Miller, Block and Kshlerin', 22, 'Taxidea taxus', '9/8/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (23, 'Morar and Sons', 'Zboncak, Price and Thompson', 23, 'Vanellus armatus', '1/17/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (24, 'Daniel, Paucek and Pollich', 'Ebert, Toy and Gibson', 24, 'Tachybaptus ruficollis', '10/4/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (25, 'Hahn, Dooley and Pfeffer', 'Nolan, Weimann and Cruickshank', 25, 'Corvus brachyrhynchos', '11/18/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (26, 'Rutherford LLC', 'Dietrich, D''Amore and Pagac', 26, 'Sarcophilus harrisii', '6/29/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (27, 'Schoen Group', 'Reichert-Zemlak', 27, 'Coendou prehensilis', '4/20/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (28, 'Hagenes, Hodkiewicz and Gutmann', 'Rempel, Hilll and Bauch', 28, 'Eudromia elegans', '3/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (29, 'Feest-Murazik', 'Barrows-Flatley', 29, 'Nyctereutes procyonoides', '3/25/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (30, 'Green, Klocko and Swaniawski', 'Renner, Grimes and Jacobi', 30, 'Pycnonotus nigricans', '10/25/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (31, 'Stiedemann-Wilderman', 'Ratke LLC', 31, 'Picoides pubescens', '4/2/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (32, 'Durgan-Kling', 'Conn, Schmeler and Kiehn', 32, 'Butorides striatus', '6/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (33, 'Lemke-Franecki', 'Heller and Sons', 33, 'Smithopsis crassicaudata', '11/6/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (34, 'Ernser, Ullrich and Kub', 'Okuneva-Wehner', 34, 'Anas platyrhynchos', '5/6/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (35, 'Hyatt-Will', 'O''Connell-Kunde', 35, 'Vulpes chama', '12/3/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (36, 'Dietrich, Fahey and Hand', 'Dach LLC', 36, 'Crotalus adamanteus', '6/16/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (37, 'Jacobson and Sons', 'Mohr, Bosco and Kovacek', 37, 'Papio ursinus', '5/22/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (38, 'Yundt, Tremblay and Kilback', 'O''Reilly and Sons', 38, 'Coluber constrictor', '11/11/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (39, 'Murazik and Sons', 'Raynor Group', 39, 'Lorythaixoides concolor', '7/15/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (40, 'Huels Inc', 'Jacobs-Mraz', 40, 'Ovis canadensis', '12/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (41, 'O''Connell-Corwin', 'Gusikowski, Luettgen and Dicki', 41, 'Phalacrocorax albiventer', '8/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (42, 'Hackett, Kassulke and Veum', 'Konopelski-Schaefer', 42, 'Myotis lucifugus', '8/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (43, 'Welch, Mills and Jacobi', 'Gislason, Dare and Cummings', 43, 'Naja sp.', '1/28/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (44, 'Auer-Bernier', 'Nikolaus-Harvey', 44, 'Epicrates cenchria maurus', '8/26/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (45, 'Durgan, Bartell and Huels', 'Franecki and Sons', 45, 'Anas punctata', '12/31/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (46, 'Herman Inc', 'Leuschke LLC', 46, 'Odocoilenaus virginianus', '9/24/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (47, 'Abbott-Olson', 'Goldner Inc', 47, 'Kobus defassa', '2/2/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (48, 'Witting LLC', 'Gulgowski-Brekke', 48, 'Naja haje', '5/23/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (49, 'Paucek, Feeney and Hauck', 'Hessel-D''Amore', 49, 'Numida meleagris', '2/5/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (50, 'Klocko Group', 'Vandervort-Beer', 50, 'Mazama gouazoubira', '9/8/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (51, 'Goldner-Schimmel', 'Cummings-Dickinson', 51, 'Macropus giganteus', '7/10/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (52, 'Green, Bailey and Smitham', 'Feeney-Marvin', 52, 'Butorides striatus', '8/12/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (53, 'Wuckert LLC', 'Ondricka, Senger and Denesik', 53, 'Amphibolurus barbatus', '2/14/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (54, 'Donnelly LLC', 'Beer, Stiedemann and Boyle', 54, 'Ovis ammon', '6/1/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (55, 'Ernser, Orn and Beier', 'Lehner-Gibson', 55, 'Galago crassicaudataus', '11/4/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (56, 'Thiel, Hudson and Wolff', 'Hegmann, McClure and Rosenbaum', 56, 'Cercopithecus aethiops', '3/26/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (57, 'Funk-Davis', 'Swaniawski and Sons', 57, 'Semnopithecus entellus', '8/22/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (58, 'Pagac-Carter', 'Metz-Grimes', 58, 'Aonyx capensis', '3/15/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (59, 'Kshlerin-Bergstrom', 'O''Reilly-Considine', 59, 'Acrobates pygmaeus', '4/9/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (60, 'Weissnat, Herman and Feil', 'White, Aufderhar and Quitzon', 60, 'Eremophila alpestris', '5/22/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (61, 'Murray, Hand and Emmerich', 'Abshire Group', 61, 'Canis aureus', '12/27/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (62, 'Schowalter-Stamm', 'Gerlach and Sons', 62, 'Ciconia episcopus', '2/5/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (63, 'West, Armstrong and Sauer', 'Mayer-Hahn', 63, 'Papilio canadensis', '1/4/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (64, 'Schimmel, Ward and Smith', 'Kerluke and Sons', 64, 'Columba livia', '2/1/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (65, 'Schmeler Inc', 'Davis-Prosacco', 65, 'Spermophilus tridecemlineatus', '8/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (66, 'Cassin Inc', 'Little, Hayes and Okuneva', 66, 'Ursus arctos', '7/2/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (67, 'Hammes-Beer', 'Streich-Durgan', 67, 'Pitangus sulphuratus', '5/22/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (68, 'Wisozk Group', 'Sawayn-Christiansen', 68, 'Dasyurus viverrinus', '1/17/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (69, 'Kassulke-Ondricka', 'Hamill and Sons', 69, 'Merops sp.', '4/30/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (70, 'Rau Inc', 'Senger-Hansen', 70, 'Gerbillus sp.', '10/17/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (71, 'Larson Inc', 'Spinka, Strosin and Steuber', 71, 'Stercorarius longicausus', '9/1/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (72, 'Jakubowski, Botsford and Upton', 'Koch and Sons', 72, 'Bos taurus', '9/26/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (73, 'Raynor and Sons', 'Bins, Balistreri and Bergnaum', 73, 'Choloepus hoffmani', '3/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (74, 'Hoeger Inc', 'Bruen, Bernhard and Braun', 74, 'Ceratotherium simum', '8/15/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (75, 'O''Connell, Jacobson and Hauck', 'Stroman-Witting', 75, 'Colobus guerza', '7/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (76, 'Stamm LLC', 'Schimmel-Quigley', 76, 'Varanus salvator', '5/23/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (77, 'Grimes-Quitzon', 'Herzog, Muller and Kilback', 77, 'Zenaida asiatica', '6/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (78, 'Ledner Group', 'Stehr, O''Kon and Ratke', 78, 'Pelecans onocratalus', '2/15/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (79, 'Lesch, Kunde and Turner', 'Mohr, Koepp and Yost', 79, 'Ictonyx striatus', '4/2/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (80, 'Kohler, Hyatt and Schaden', 'Macejkovic, Murazik and Yost', 80, 'Phalacrocorax varius', '3/29/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (81, 'Witting LLC', 'Schoen-Schroeder', 81, 'Canis lupus baileyi', '3/22/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (82, 'Hayes-Harris', 'Metz-Langosh', 82, 'Alcelaphus buselaphus cokii', '7/16/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (83, 'Gleason and Sons', 'Stiedemann Inc', 83, 'Graspus graspus', '6/11/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (84, 'Zboncak, Heaney and Klein', 'Harris-Kassulke', 84, 'Uraeginthus angolensis', '6/30/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (85, 'Feil-Trantow', 'Pouros-Cormier', 85, 'Ovis ammon', '2/23/2024');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (86, 'Gibson-Willms', 'Beier-Grant', 86, 'Spizaetus coronatus', '12/1/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (87, 'Zboncak-Considine', 'Maggio Inc', 87, 'Bettongia penicillata', '5/10/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (88, 'Little, Fahey and Ebert', 'Pfeffer-Waelchi', 88, 'Spermophilus richardsonii', '9/14/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (89, 'Paucek, Murazik and Reinger', 'Wilkinson-Rice', 89, 'Mazama americana', '8/7/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (90, 'Greenholt-Parker', 'Schmitt and Sons', 90, 'Litrocranius walleri', '7/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (91, 'Kautzer-Parker', 'Botsford Group', 91, 'unavailable', '10/16/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (92, 'Morar, Kovacek and Crooks', 'Hane, Wisozk and Mueller', 92, 'Picoides pubescens', '8/28/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (93, 'Murphy-Schiller', 'Brekke, Wyman and Feeney', 93, 'Diceros bicornis', '4/19/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (94, 'Jones, Schultz and Ziemann', 'Bahringer-Schoen', 94, 'Erethizon dorsatum', '12/23/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (95, 'Bauch Inc', 'Heathcote Group', 95, 'Dendrocitta vagabunda', '12/31/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (96, 'Effertz Group', 'Langosh-Tillman', 96, 'Pelecans onocratalus', '3/5/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (97, 'Schaefer-Carter', 'Nader-Spencer', 97, 'Capra ibex', '8/1/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (98, 'Zieme, Ziemann and Lind', 'Ratke, Kuvalis and Zemlak', 98, 'Ciconia episcopus', '4/3/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (99, 'O''Reilly Group', 'McGlynn Group', 99, 'Ursus americanus', '9/23/2023');
insert into Photo (photoID, photoName, Descript, userID, fileType, dateUploaded) values (100, 'Koss-Kovacek', 'Gutkowski-Cummerata', 100, 'Diomedea irrorata', '9/17/2023');

insert into Rangers (rangerID, dateEmployed, userID) values (1, '3/27/2023', 1);
insert into Rangers (rangerID, dateEmployed, userID) values (2, '6/19/2023', 2);
insert into Rangers (rangerID, dateEmployed, userID) values (3, '3/4/2023', 3);
insert into Rangers (rangerID, dateEmployed, userID) values (4, '4/21/2023', 4);
insert into Rangers (rangerID, dateEmployed, userID) values (5, '1/18/2024', 5);
insert into Rangers (rangerID, dateEmployed, userID) values (6, '3/20/2023', 6);
insert into Rangers (rangerID, dateEmployed, userID) values (7, '12/20/2023', 7);
insert into Rangers (rangerID, dateEmployed, userID) values (8, '9/17/2023', 8);
insert into Rangers (rangerID, dateEmployed, userID) values (9, '11/21/2023', 9);
insert into Rangers (rangerID, dateEmployed, userID) values (10, '7/21/2023', 10);
insert into Rangers (rangerID, dateEmployed, userID) values (11, '11/24/2023', 11);
insert into Rangers (rangerID, dateEmployed, userID) values (12, '2/16/2024', 12);
insert into Rangers (rangerID, dateEmployed, userID) values (13, '9/21/2023', 13);
insert into Rangers (rangerID, dateEmployed, userID) values (14, '5/31/2023', 14);
insert into Rangers (rangerID, dateEmployed, userID) values (15, '7/17/2023', 15);
insert into Rangers (rangerID, dateEmployed, userID) values (16, '3/8/2023', 16);
insert into Rangers (rangerID, dateEmployed, userID) values (17, '7/12/2023', 17);
insert into Rangers (rangerID, dateEmployed, userID) values (18, '12/6/2023', 18);
insert into Rangers (rangerID, dateEmployed, userID) values (19, '3/25/2023', 19);
insert into Rangers (rangerID, dateEmployed, userID) values (20, '12/26/2023', 20);
insert into Rangers (rangerID, dateEmployed, userID) values (21, '5/19/2023', 21);
insert into Rangers (rangerID, dateEmployed, userID) values (22, '11/17/2023', 22);
insert into Rangers (rangerID, dateEmployed, userID) values (23, '12/7/2023', 23);
insert into Rangers (rangerID, dateEmployed, userID) values (24, '6/26/2023', 24);
insert into Rangers (rangerID, dateEmployed, userID) values (25, '12/12/2023', 25);
insert into Rangers (rangerID, dateEmployed, userID) values (26, '9/10/2023', 26);
insert into Rangers (rangerID, dateEmployed, userID) values (27, '12/16/2023', 27);
insert into Rangers (rangerID, dateEmployed, userID) values (28, '3/9/2023', 28);
insert into Rangers (rangerID, dateEmployed, userID) values (29, '11/6/2023', 29);
insert into Rangers (rangerID, dateEmployed, userID) values (30, '2/23/2024', 30);
insert into Rangers (rangerID, dateEmployed, userID) values (31, '12/2/2023', 31);
insert into Rangers (rangerID, dateEmployed, userID) values (32, '3/18/2023', 32);
insert into Rangers (rangerID, dateEmployed, userID) values (33, '9/3/2023', 33);
insert into Rangers (rangerID, dateEmployed, userID) values (34, '7/1/2023', 34);
insert into Rangers (rangerID, dateEmployed, userID) values (35, '7/31/2023', 35);
insert into Rangers (rangerID, dateEmployed, userID) values (36, '9/10/2023', 36);
insert into Rangers (rangerID, dateEmployed, userID) values (37, '3/26/2023', 37);
insert into Rangers (rangerID, dateEmployed, userID) values (38, '8/14/2023', 38);
insert into Rangers (rangerID, dateEmployed, userID) values (39, '11/24/2023', 39);
insert into Rangers (rangerID, dateEmployed, userID) values (40, '6/1/2023', 40);
insert into Rangers (rangerID, dateEmployed, userID) values (41, '1/4/2024', 41);
insert into Rangers (rangerID, dateEmployed, userID) values (42, '11/1/2023', 42);
insert into Rangers (rangerID, dateEmployed, userID) values (43, '12/6/2023', 43);
insert into Rangers (rangerID, dateEmployed, userID) values (44, '6/5/2023', 44);
insert into Rangers (rangerID, dateEmployed, userID) values (45, '7/16/2023', 45);
insert into Rangers (rangerID, dateEmployed, userID) values (46, '7/27/2023', 46);
insert into Rangers (rangerID, dateEmployed, userID) values (47, '4/12/2023', 47);
insert into Rangers (rangerID, dateEmployed, userID) values (48, '12/13/2023', 48);
insert into Rangers (rangerID, dateEmployed, userID) values (49, '3/30/2023', 49);
insert into Rangers (rangerID, dateEmployed, userID) values (50, '9/13/2023', 50);
insert into Rangers (rangerID, dateEmployed, userID) values (51, '12/5/2023', 51);
insert into Rangers (rangerID, dateEmployed, userID) values (52, '11/24/2023', 52);
insert into Rangers (rangerID, dateEmployed, userID) values (53, '2/8/2024', 53);
insert into Rangers (rangerID, dateEmployed, userID) values (54, '9/10/2023', 54);
insert into Rangers (rangerID, dateEmployed, userID) values (55, '10/13/2023', 55);
insert into Rangers (rangerID, dateEmployed, userID) values (56, '8/5/2023', 56);
insert into Rangers (rangerID, dateEmployed, userID) values (57, '6/14/2023', 57);
insert into Rangers (rangerID, dateEmployed, userID) values (58, '2/9/2024', 58);
insert into Rangers (rangerID, dateEmployed, userID) values (59, '3/7/2023', 59);
insert into Rangers (rangerID, dateEmployed, userID) values (60, '8/26/2023', 60);
insert into Rangers (rangerID, dateEmployed, userID) values (61, '9/13/2023', 61);
insert into Rangers (rangerID, dateEmployed, userID) values (62, '11/2/2023', 62);
insert into Rangers (rangerID, dateEmployed, userID) values (63, '1/14/2024', 63);
insert into Rangers (rangerID, dateEmployed, userID) values (64, '1/24/2024', 64);
insert into Rangers (rangerID, dateEmployed, userID) values (65, '2/29/2024', 65);
insert into Rangers (rangerID, dateEmployed, userID) values (66, '6/4/2023', 66);
insert into Rangers (rangerID, dateEmployed, userID) values (67, '1/9/2024', 67);
insert into Rangers (rangerID, dateEmployed, userID) values (68, '7/16/2023', 68);
insert into Rangers (rangerID, dateEmployed, userID) values (69, '4/16/2023', 69);
insert into Rangers (rangerID, dateEmployed, userID) values (70, '3/14/2023', 70);
insert into Rangers (rangerID, dateEmployed, userID) values (71, '5/14/2023', 71);
insert into Rangers (rangerID, dateEmployed, userID) values (72, '3/7/2023', 72);
insert into Rangers (rangerID, dateEmployed, userID) values (73, '8/1/2023', 73);
insert into Rangers (rangerID, dateEmployed, userID) values (74, '10/4/2023', 74);
insert into Rangers (rangerID, dateEmployed, userID) values (75, '2/6/2024', 75);
insert into Rangers (rangerID, dateEmployed, userID) values (76, '6/17/2023', 76);
insert into Rangers (rangerID, dateEmployed, userID) values (77, '12/8/2023', 77);
insert into Rangers (rangerID, dateEmployed, userID) values (78, '7/30/2023', 78);
insert into Rangers (rangerID, dateEmployed, userID) values (79, '4/7/2023', 79);
insert into Rangers (rangerID, dateEmployed, userID) values (80, '3/22/2023', 80);
insert into Rangers (rangerID, dateEmployed, userID) values (81, '1/2/2024', 81);
insert into Rangers (rangerID, dateEmployed, userID) values (82, '3/5/2023', 82);
insert into Rangers (rangerID, dateEmployed, userID) values (83, '7/21/2023', 83);
insert into Rangers (rangerID, dateEmployed, userID) values (84, '1/9/2024', 84);
insert into Rangers (rangerID, dateEmployed, userID) values (85, '6/29/2023', 85);
insert into Rangers (rangerID, dateEmployed, userID) values (86, '11/18/2023', 86);
insert into Rangers (rangerID, dateEmployed, userID) values (87, '5/26/2023', 87);
insert into Rangers (rangerID, dateEmployed, userID) values (88, '11/22/2023', 88);
insert into Rangers (rangerID, dateEmployed, userID) values (89, '2/22/2024', 89);
insert into Rangers (rangerID, dateEmployed, userID) values (90, '5/11/2023', 90);
insert into Rangers (rangerID, dateEmployed, userID) values (91, '1/8/2024', 91);
insert into Rangers (rangerID, dateEmployed, userID) values (92, '5/28/2023', 92);
insert into Rangers (rangerID, dateEmployed, userID) values (93, '8/20/2023', 93);
insert into Rangers (rangerID, dateEmployed, userID) values (94, '7/10/2023', 94);
insert into Rangers (rangerID, dateEmployed, userID) values (95, '6/1/2023', 95);
insert into Rangers (rangerID, dateEmployed, userID) values (96, '9/17/2023', 96);
insert into Rangers (rangerID, dateEmployed, userID) values (97, '6/5/2023', 97);
insert into Rangers (rangerID, dateEmployed, userID) values (98, '2/12/2024', 98);
insert into Rangers (rangerID, dateEmployed, userID) values (99, '10/16/2023', 99);
insert into Rangers (rangerID, dateEmployed, userID) values (100, '2/12/2024', 100);

insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (1, 1, 1, 'Fox, cape', '2/11/2024', null, 32);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (2, 2, 2, 'Quoll, eastern', '10/18/2023', null, 52);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (3, 3, 3, 'Savannah deer (unidentified)', '4/13/2023', null, 26);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (4, 4, 4, 'Red hartebeest', '7/24/2023', null, 5);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (5, 5, 5, 'Starling, cape', '9/22/2023', null, 13);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (6, 6, 6, 'Hen, sage', '2/24/2024', null, 9);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (7, 7, 7, 'Squirrel, european red', '9/21/2023', null, 26);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (8, 8, 8, 'Buffalo, african', '3/9/2023', 'Nordrhein-Westfalen', 4);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (9, 9, 9, 'Hyrax', '9/10/2023', 'Haute-Normandie', 83);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (10, 10, 10, 'Prairie falcon', '7/6/2023', null, 50);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (11, 11, 11, 'Crane, sandhill', '12/17/2023', null, 11);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (12, 12, 12, 'Pygmy possum', '10/20/2023', 'Stockholm', 69);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (13, 13, 13, 'Large cormorant', '5/28/2023', null, 21);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (14, 14, 14, 'Black-throated cardinal', '6/28/2023', null, 64);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (15, 15, 15, 'Gazer, sun', '8/11/2023', null, 98);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (16, 16, 16, 'Agouti', '2/19/2024', null, 93);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (17, 17, 17, 'Zebra, plains', '6/18/2023', 'Georgia', 55);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (18, 18, 18, 'Wild boar', '7/8/2023', null, 95);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (19, 19, 19, 'Common wombat', '1/12/2024', null, 46);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (20, 20, 20, 'Stone sheep', '3/11/2023', 'Provincie Zuid-Holland', 44);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (21, 21, 21, 'Sheep, red', '12/5/2023', null, 13);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (22, 22, 22, 'Kinkajou', '7/30/2023', null, 58);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (23, 23, 23, 'Kelp gull', '5/6/2023', null, 56);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (24, 24, 24, 'African lion', '11/26/2023', null, 96);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (25, 25, 25, 'Stork, white', '1/17/2024', null, 69);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (26, 26, 26, 'Mudskipper (unidentified)', '5/1/2023', null, 35);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (27, 27, 27, 'Stork, european', '8/30/2023', null, 67);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (28, 28, 28, 'Blue wildebeest', '4/7/2023', null, 55);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (29, 29, 29, 'Oystercatcher, blackish', '1/20/2024', null, 84);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (30, 30, 30, 'Flamingo, greater', '11/8/2023', null, 7);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (31, 31, 31, 'Greater roadrunner', '11/29/2023', null, 13);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (32, 32, 32, 'White-eye, pale', '12/14/2023', null, 6);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (33, 33, 33, 'Squirrel, red', '8/3/2023', null, 73);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (34, 34, 34, 'Ibex', '3/31/2023', null, 91);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (35, 35, 35, 'Ground monitor (unidentified)', '6/16/2023', null, 5);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (36, 36, 36, 'Painted stork', '8/20/2023', 'Ontario', 6);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (37, 37, 37, 'Dark-winged trumpeter', '10/10/2023', 'Västmanland', 24);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (38, 38, 38, 'Little grebe', '1/26/2024', null, 97);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (39, 39, 39, 'Hyena, brown', '4/26/2023', null, 82);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (40, 40, 40, 'Pie, indian tree', '3/17/2023', null, 82);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (41, 41, 41, 'Owl, snowy', '11/29/2023', null, 24);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (42, 42, 42, 'Black-throated cardinal', '4/19/2023', null, 63);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (43, 43, 43, 'Brown capuchin', '5/31/2023', null, 10);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (44, 44, 44, 'Raccoon, crab-eating', '11/23/2023', 'Oklahoma', 23);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (45, 45, 45, 'Magellanic penguin', '6/9/2023', null, 93);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (46, 46, 46, 'Nile crocodile', '9/27/2023', null, 87);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (47, 47, 47, 'Adouri (unidentified)', '6/20/2023', null, 5);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (48, 48, 48, 'Moccasin, water', '9/14/2023', null, 66);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (49, 49, 49, 'Collared peccary', '12/7/2023', null, 29);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (50, 50, 50, 'Fowl, helmeted guinea', '4/30/2023', null, 86);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (51, 51, 51, 'Sidewinder', '11/1/2023', null, 90);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (52, 52, 52, 'Tree porcupine', '4/29/2023', 'Stockholm', 49);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (53, 53, 53, 'Dabchick', '3/27/2023', null, 9);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (54, 54, 54, 'Raccoon dog', '8/28/2023', 'Västra Götaland', 6);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (55, 55, 55, 'Eurasian badger', '8/25/2023', null, 50);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (56, 56, 56, 'Dragon, frilled', '1/24/2024', null, 53);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (57, 57, 57, 'Grey mouse lemur', '5/12/2023', 'Braga', 5);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (58, 58, 58, 'Cat, ringtail', '1/28/2024', null, 93);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (59, 59, 59, 'Eastern grey kangaroo', '6/14/2023', 'Lisboa', 24);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (60, 60, 60, 'Red lava crab', '11/23/2023', null, 2);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (61, 61, 61, 'Woodchuck', '1/10/2024', null, 85);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (62, 62, 62, 'Grey lourie', '11/22/2023', null, 7);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (63, 63, 63, 'Mississippi alligator', '7/6/2023', null, 100);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (64, 64, 64, 'Green-backed heron', '5/17/2023', 'Colorado', 34);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (65, 65, 65, 'Eagle, long-crested hawk', '6/3/2023', null, 76);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (66, 66, 66, 'Rattlesnake, eastern diamondback', '2/6/2024', null, 88);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (67, 67, 67, 'Darwin ground finch (unidentified)', '5/23/2023', 'Alabama', 11);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (68, 68, 68, 'Chameleon (unidentified)', '8/7/2023', null, 4);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (69, 69, 69, 'Tawny frogmouth', '6/4/2023', null, 7);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (70, 70, 70, 'Parakeet, rose-ringed', '7/22/2023', 'Québec', 69);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (71, 71, 71, 'Oystercatcher, blackish', '12/17/2023', null, 81);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (72, 72, 72, 'Cape clawless otter', '5/27/2023', null, 67);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (73, 73, 73, 'Albatross, galapagos', '5/27/2023', null, 19);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (74, 74, 74, 'Hanuman langur', '12/3/2023', null, 50);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (75, 75, 75, 'Rhesus macaque', '9/9/2023', 'Wisconsin', 78);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (76, 76, 76, 'Darter, african', '1/16/2024', 'Washington', 67);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (77, 77, 77, 'Long-necked turtle', '8/27/2023', null, 87);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (78, 78, 78, 'Hartebeest, red', '12/28/2023', null, 4);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (79, 79, 79, 'Springbuck', '12/4/2023', null, 77);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (80, 80, 80, 'Tenrec, tailless', '11/21/2023', null, 65);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (81, 81, 81, 'Lion, australian sea', '1/4/2024', null, 69);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (82, 82, 82, 'Crab-eating raccoon', '10/2/2023', null, 90);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (83, 83, 83, 'Wombat, southern hairy-nosed', '5/26/2023', null, 76);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (84, 84, 84, 'Dark-winged trumpeter', '11/26/2023', 'Québec', 63);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (85, 85, 85, 'Swan, trumpeter', '1/6/2024', null, 42);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (86, 86, 86, 'Deer, swamp', '10/30/2023', null, 54);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (87, 87, 87, 'Feathertail glider', '5/12/2023', null, 71);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (88, 88, 88, 'Python, carpet', '12/26/2023', null, 1);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (89, 89, 89, 'Goose, andean', '2/14/2024', null, 71);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (90, 90, 90, 'African polecat', '11/29/2023', null, 63);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (91, 91, 91, 'Waxbill, blue', '10/6/2023', null, 95);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (92, 92, 92, 'Cockatoo, red-tailed', '11/5/2023', null, 14);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (93, 93, 93, 'North American porcupine', '9/19/2023', null, 79);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (94, 94, 94, 'Four-horned antelope', '10/24/2023', null, 2);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (95, 95, 95, 'Cormorant, king', '2/24/2024', null, 29);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (96, 96, 96, 'Iguana, common green', '11/13/2023', null, 48);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (97, 97, 97, 'Kaffir cat', '8/22/2023', null, 86);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (98, 98, 98, 'Kingfisher, pied', '11/20/2023', null, 59);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (99, 99, 99, 'Little blue penguin', '10/15/2023', null, 59);
insert into Park (parkID, trailID, campsiteID, parkName, parkEstablishment, stateUS, averageTrafficperYear) values (100, 100, 100, 'Madagascar fruit bat', '1/13/2024', 'Pays de la Loire', 76);

insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (1, 'Andalax', 1, true, 41, 34);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (2, 'Stim', 2, false, 76, 18);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (3, 'Viva', 3, true, 63, 44);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (4, 'Bitchip', 4, true, 14, 6);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (5, 'Bytecard', 5, false, 69, 16);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (6, 'Opela', 6, false, 10, 64);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (7, 'Asoka', 7, false, 40, 15);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (8, 'Matsoft', 8, true, 64, 92);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (9, 'Fintone', 9, true, 3, 47);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (10, 'Sonair', 10, false, 52, 24);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (11, 'Trippledex', 11, false, 52, 48);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (12, 'Stim', 12, false, 57, 50);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (13, 'Fix San', 13, true, 2, 94);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (14, 'Andalax', 14, false, 100, 55);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (15, 'Fix San', 15, true, 84, 95);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (16, 'Konklux', 16, true, 18, 40);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (17, 'Quo Lux', 17, false, 81, 56);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (18, 'Holdlamis', 18, false, 19, 54);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (19, 'Stim', 19, false, 23, 81);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (20, 'Ventosanzap', 20, false, 9, 20);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (21, 'Stronghold', 21, false, 11, 8);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (22, 'Ventosanzap', 22, true, 30, 70);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (23, 'Zontrax', 23, false, 40, 1);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (24, 'Stronghold', 24, false, 23, 6);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (25, 'Daltfresh', 25, true, 36, 42);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (26, 'Fixflex', 26, false, 24, 94);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (27, 'Tin', 27, false, 86, 62);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (28, 'Zaam-Dox', 28, true, 86, 79);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (29, 'Cookley', 29, false, 8, 21);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (30, 'Tempsoft', 30, false, 12, 80);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (31, 'Konklab', 31, false, 91, 56);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (32, 'Wrapsafe', 32, true, 50, 2);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (33, 'Solarbreeze', 33, true, 54, 21);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (34, 'Ronstring', 34, false, 55, 49);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (35, 'Subin', 35, false, 84, 73);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (36, 'Overhold', 36, true, 31, 2);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (37, 'Sub-Ex', 37, false, 52, 8);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (38, 'Tin', 38, true, 99, 56);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (39, 'Stim', 39, false, 81, 21);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (40, 'Alphazap', 40, true, 67, 48);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (41, 'Sub-Ex', 41, true, 49, 89);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (42, 'Cardify', 42, true, 78, 74);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (43, 'Pannier', 43, true, 90, 90);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (44, 'Konklux', 44, true, 16, 91);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (45, 'Toughjoyfax', 45, true, 44, 54);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (46, 'Kanlam', 46, true, 52, 70);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (47, 'Cardify', 47, true, 82, 35);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (48, 'Y-Solowarm', 48, false, 8, 13);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (49, 'Job', 49, true, 50, 48);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (50, 'Namfix', 50, true, 75, 78);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (51, 'Lotstring', 51, true, 42, 88);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (52, 'Vagram', 52, false, 34, 89);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (53, 'Otcom', 53, true, 9, 82);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (54, 'Duobam', 54, false, 28, 59);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (55, 'Alphazap', 55, true, 90, 93);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (56, 'Voltsillam', 56, false, 6, 54);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (57, 'Fintone', 57, false, 47, 10);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (58, 'Bigtax', 58, true, 80, 13);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (59, 'Redhold', 59, true, 19, 94);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (60, 'Gembucket', 60, false, 65, 60);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (61, 'Tampflex', 61, true, 98, 9);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (62, 'Otcom', 62, true, 81, 100);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (63, 'Asoka', 63, true, 57, 81);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (64, 'Daltfresh', 64, false, 1, 88);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (65, 'Alphazap', 65, true, 85, 62);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (66, 'Tresom', 66, true, 3, 84);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (67, 'Namfix', 67, false, 48, 47);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (68, 'Treeflex', 68, true, 94, 66);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (69, 'Zamit', 69, false, 3, 37);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (70, 'Voltsillam', 70, true, 98, 51);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (71, 'Gembucket', 71, false, 50, 50);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (72, 'Mat Lam Tam', 72, false, 11, 44);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (73, 'Zontrax', 73, true, 4, 55);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (74, 'It', 74, false, 69, 38);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (75, 'Bytecard', 75, false, 60, 25);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (76, 'Toughjoyfax', 76, true, 19, 69);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (77, 'Flowdesk', 77, true, 37, 19);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (78, 'Sub-Ex', 78, true, 3, 11);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (79, 'Quo Lux', 79, false, 71, 85);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (80, 'Fixflex', 80, false, 2, 18);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (81, 'Zoolab', 81, false, 38, 36);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (82, 'Tin', 82, true, 49, 79);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (83, 'Cookley', 83, false, 16, 63);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (84, 'Stim', 84, false, 7, 99);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (85, 'Y-find', 85, true, 99, 89);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (86, 'Tresom', 86, false, 58, 68);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (87, 'It', 87, true, 19, 61);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (88, 'Voltsillam', 88, false, 26, 53);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (89, 'Subin', 89, false, 5, 70);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (90, 'Stim', 90, false, 85, 50);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (91, 'Span', 91, false, 34, 9);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (92, 'Konklux', 92, true, 41, 6);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (93, 'Zamit', 93, false, 82, 22);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (94, 'Wrapsafe', 94, true, 51, 55);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (95, 'Ronstring', 95, true, 2, 32);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (96, 'Fix San', 96, false, 49, 91);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (97, 'Trippledex', 97, true, 97, 43);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (98, 'Sub-Ex', 98, false, 7, 52);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (99, 'Pannier', 99, false, 29, 52);
insert into Campsites (campsiteID, name, parkID, restroom, numspots, numSpotsOpen) values (100, 'Zoolab', 100, true, 41, 71);

insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (1, 1, 1, 1, true, 'Bitwolf', 'Bigtax', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (2, 2, 2, 2, false, 'Matsoft', 'Kanlam', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (3, 3, 3, 3, false, 'Alpha', 'Duobam', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (4, 4, 4, 4, true, 'Temp', 'Otcom', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (5, 5, 5, 5, true, 'Zoolab', 'Zamit', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (6, 6, 6, 6, true, 'Ronstring', 'Treeflex', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (7, 7, 7, 7, false, 'Matsoft', 'Bigtax', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (8, 8, 8, 8, false, 'Bytecard', 'Prodder', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (9, 9, 9, 9, false, 'Bitwolf', 'Trippledex', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (10, 10, 10, 10, false, 'Ronstring', 'Voyatouch', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (11, 11, 11, 11, false, 'Latlux', 'Regrant', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (12, 12, 12, 12, true, 'Konklux', 'Holdlamis', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (13, 13, 13, 13, true, 'Home Ing', 'Stronghold', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (14, 14, 14, 14, true, 'Prodder', 'Tin', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (15, 15, 15, 15, false, 'Temp', 'Alphazap', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (16, 16, 16, 16, true, 'Keylex', 'Otcom', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (17, 17, 17, 17, false, 'Stim', 'Hatity', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (18, 18, 18, 18, true, 'Zoolab', 'Stim', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (19, 19, 19, 19, false, 'Pannier', 'Viva', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (20, 20, 20, 20, false, 'Ronstring', 'Fixflex', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (21, 21, 21, 21, false, 'Lotlux', 'Cardguard', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (22, 22, 22, 22, true, 'Zontrax', 'Voyatouch', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (23, 23, 23, 23, true, 'Alpha', 'Sonsing', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (24, 24, 24, 24, false, 'Greenlam', 'Y-Solowarm', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (25, 25, 25, 25, true, 'Voyatouch', 'Alphazap', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (26, 26, 26, 26, false, 'Redhold', 'Redhold', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (27, 27, 27, 27, true, 'Asoka', 'Quo Lux', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (28, 28, 28, 28, false, 'Stronghold', 'Mat Lam Tam', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (29, 29, 29, 29, true, 'Flexidy', 'Keylex', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (30, 30, 30, 30, true, 'Alpha', 'Sonair', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (31, 31, 31, 31, false, 'Toughjoyfax', 'Kanlam', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (32, 32, 32, 32, false, 'Flexidy', 'Redhold', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (33, 33, 33, 33, true, 'Sub-Ex', 'Transcof', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (34, 34, 34, 34, false, 'Andalax', 'Kanlam', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (35, 35, 35, 35, false, 'Greenlam', 'Bitchip', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (36, 36, 36, 36, true, 'Aerified', 'Span', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (37, 37, 37, 37, true, 'Wrapsafe', 'Home Ing', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (38, 38, 38, 38, false, 'Toughjoyfax', 'Subin', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (39, 39, 39, 39, false, 'Job', 'Kanlam', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (40, 40, 40, 40, true, 'Vagram', 'Fintone', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (41, 41, 41, 41, true, 'Gembucket', 'Keylex', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (42, 42, 42, 42, true, 'Bigtax', 'Temp', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (43, 43, 43, 43, false, 'Treeflex', 'Tresom', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (44, 44, 44, 44, true, 'Hatity', 'Stringtough', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (45, 45, 45, 45, false, 'Fix San', 'Alphazap', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (46, 46, 46, 46, true, 'Fix San', 'Opela', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (47, 47, 47, 47, true, 'Wrapsafe', 'Ronstring', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (48, 48, 48, 48, true, 'Kanlam', 'Temp', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (49, 49, 49, 49, true, 'Vagram', 'Prodder', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (50, 50, 50, 50, false, 'Fix San', 'Sonsing', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (51, 51, 51, 51, true, 'Kanlam', 'Viva', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (52, 52, 52, 52, true, 'Solarbreeze', 'Transcof', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (53, 53, 53, 53, false, 'Bitwolf', 'Opela', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (54, 54, 54, 54, true, 'Zoolab', 'Overhold', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (55, 55, 55, 55, false, 'Treeflex', 'Andalax', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (56, 56, 56, 56, false, 'Sonair', 'Bytecard', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (57, 57, 57, 57, true, 'Lotlux', 'Prodder', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (58, 58, 58, 58, true, 'Aerified', 'Matsoft', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (59, 59, 59, 59, false, 'Gembucket', 'Y-Solowarm', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (60, 60, 60, 60, true, 'Matsoft', 'Viva', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (61, 61, 61, 61, false, 'Fintone', 'Temp', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (62, 62, 62, 62, true, 'Stim', 'Transcof', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (63, 63, 63, 63, false, 'Prodder', 'Fixflex', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (64, 64, 64, 64, true, 'Holdlamis', 'Sonair', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (65, 65, 65, 65, false, 'Flowdesk', 'Zamit', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (66, 66, 66, 66, false, 'Lotlux', 'Viva', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (67, 67, 67, 67, false, 'Solarbreeze', 'Toughjoyfax', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (68, 68, 68, 68, true, 'Transcof', 'Y-Solowarm', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (69, 69, 69, 69, true, 'Sonair', 'Daltfresh', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (70, 70, 70, 70, false, 'Aerified', 'Overhold', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (71, 71, 71, 71, true, 'Stronghold', 'Keylex', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (72, 72, 72, 72, false, 'Bitwolf', 'Opela', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (73, 73, 73, 73, true, 'Solarbreeze', 'Pannier', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (74, 74, 74, 74, true, 'Bytecard', 'Veribet', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (75, 75, 75, 75, false, 'Alpha', 'Cookley', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (76, 76, 76, 76, false, 'Trippledex', 'Tres-Zap', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (77, 77, 77, 77, true, 'Tres-Zap', 'Wrapsafe', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (78, 78, 78, 78, true, 'Y-find', 'Otcom', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (79, 79, 79, 79, false, 'Quo Lux', 'Rank', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (80, 80, 80, 80, true, 'Ronstring', 'Stronghold', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (81, 81, 81, 81, true, 'Veribet', 'Transcof', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (82, 82, 82, 82, true, 'Fix San', 'Holdlamis', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (83, 83, 83, 83, false, 'Holdlamis', 'Prodder', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (84, 84, 84, 84, false, 'Gembucket', 'Bamity', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (85, 85, 85, 85, false, 'Prodder', 'Y-find', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (86, 86, 86, 86, false, 'Konklux', 'Tresom', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (87, 87, 87, 87, false, 'Greenlam', 'Alpha', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (88, 88, 88, 88, true, 'Gembucket', 'Y-Solowarm', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (89, 89, 89, 89, false, 'Transcof', 'Cookley', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (90, 90, 90, 90, true, 'It', 'Home Ing', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (91, 91, 91, 91, false, 'Zaam-Dox', 'Daltfresh', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (92, 92, 92, 92, true, 'Greenlam', 'Otcom', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (93, 93, 93, 93, true, 'Stim', 'Zathin', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (94, 94, 94, 94, true, 'Aerified', 'Overhold', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (95, 95, 95, 95, false, 'Duobam', 'Stronghold', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (96, 96, 96, 96, true, 'Matsoft', 'It', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (97, 97, 97, 97, false, 'Flexidy', 'Temp', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (98, 98, 98, 98, true, 'Lotlux', 'Trippledex', true);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (99, 99, 99, 99, false, 'Y-Solowarm', 'Asoka', false);
insert into Safety (safetyID, trailID, permitID, monumentID, fireWarning, emergency, wildLife, closed) values (100, 100, 100, 100, false, 'Sonsing', 'Y-find', true);

insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (1, '6/29/2023', 1, '1/14/2024', 'Domainer');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (2, '2/3/2024', 2, '3/1/2024', 'Stringtough');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (3, '12/13/2023', 3, '11/13/2023', 'Daltfresh');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (4, '5/4/2023', 4, '8/27/2023', 'Tres-Zap');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (5, '11/8/2023', 5, '12/10/2023', 'Hatity');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (6, '5/3/2023', 6, '12/27/2023', 'Subin');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (7, '1/28/2024', 7, '6/13/2023', 'Tampflex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (8, '12/15/2023', 8, '5/11/2023', 'Zaam-Dox');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (9, '11/5/2023', 9, '8/27/2023', 'Sonair');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (10, '7/19/2023', 10, '10/20/2023', 'Y-find');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (11, '9/28/2023', 11, '2/7/2024', 'Redhold');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (12, '8/19/2023', 12, '11/24/2023', 'Zoolab');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (13, '3/20/2023', 13, '3/12/2023', 'Veribet');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (14, '8/31/2023', 14, '5/30/2023', 'Zontrax');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (15, '12/19/2023', 15, '6/22/2023', 'Kanlam');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (16, '4/25/2023', 16, '5/14/2023', 'Tempsoft');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (17, '6/13/2023', 17, '3/6/2023', 'Zamit');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (18, '8/27/2023', 18, '1/12/2024', 'Holdlamis');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (19, '5/18/2023', 19, '11/23/2023', 'Vagram');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (20, '4/19/2023', 20, '1/28/2024', 'Latlux');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (21, '8/17/2023', 21, '3/18/2023', 'Fintone');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (22, '12/8/2023', 22, '1/23/2024', 'Voltsillam');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (23, '7/20/2023', 23, '1/1/2024', 'Veribet');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (24, '1/15/2024', 24, '8/10/2023', 'Solarbreeze');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (25, '11/2/2023', 25, '9/28/2023', 'Regrant');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (26, '1/4/2024', 26, '2/24/2024', 'Ronstring');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (27, '11/30/2023', 27, '12/4/2023', 'Rank');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (28, '2/25/2024', 28, '9/3/2023', 'It');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (29, '11/19/2023', 29, '9/28/2023', 'Job');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (30, '4/23/2023', 30, '7/4/2023', 'Flowdesk');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (31, '3/9/2023', 31, '9/12/2023', 'It');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (32, '2/23/2024', 32, '8/7/2023', 'Tres-Zap');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (33, '1/3/2024', 33, '12/8/2023', 'Vagram');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (34, '1/22/2024', 34, '4/13/2023', 'Bamity');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (35, '9/18/2023', 35, '5/12/2023', 'Y-Solowarm');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (36, '7/25/2023', 36, '2/16/2024', 'Domainer');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (37, '2/20/2024', 37, '3/28/2023', 'Zamit');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (38, '9/6/2023', 38, '10/18/2023', 'Matsoft');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (39, '8/12/2023', 39, '4/8/2023', 'Tres-Zap');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (40, '2/19/2024', 40, '6/24/2023', 'Rank');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (41, '10/21/2023', 41, '12/30/2023', 'Treeflex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (42, '4/14/2023', 42, '2/16/2024', 'Fix San');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (43, '8/8/2023', 43, '10/10/2023', 'Otcom');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (44, '8/15/2023', 44, '8/1/2023', 'Ventosanzap');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (45, '1/27/2024', 45, '5/28/2023', 'Aerified');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (46, '7/29/2023', 46, '2/26/2024', 'Bytecard');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (47, '6/20/2023', 47, '6/10/2023', 'Tresom');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (48, '11/13/2023', 48, '10/20/2023', 'Mat Lam Tam');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (49, '1/21/2024', 49, '5/30/2023', 'Stringtough');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (50, '9/24/2023', 50, '4/23/2023', 'Fixflex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (51, '12/18/2023', 51, '12/30/2023', 'Pannier');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (52, '12/7/2023', 52, '7/30/2023', 'Konklux');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (53, '4/24/2023', 53, '5/13/2023', 'Alpha');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (54, '4/26/2023', 54, '1/20/2024', 'Namfix');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (55, '5/4/2023', 55, '10/20/2023', 'Span');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (56, '2/4/2024', 56, '3/24/2023', 'Gembucket');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (57, '10/11/2023', 57, '11/6/2023', 'Zathin');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (58, '11/30/2023', 58, '9/26/2023', 'Fix San');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (59, '10/29/2023', 59, '5/21/2023', 'Sub-Ex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (60, '12/13/2023', 60, '1/28/2024', 'Otcom');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (61, '5/12/2023', 61, '7/19/2023', 'Bitwolf');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (62, '9/19/2023', 62, '10/27/2023', 'Stim');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (63, '10/14/2023', 63, '2/15/2024', 'Job');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (64, '8/1/2023', 64, '2/6/2024', 'Tampflex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (65, '5/3/2023', 65, '10/25/2023', 'Flowdesk');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (66, '6/15/2023', 66, '9/1/2023', 'Biodex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (67, '11/18/2023', 67, '4/17/2023', 'Lotstring');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (68, '2/27/2024', 68, '3/8/2023', 'Konklux');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (69, '12/21/2023', 69, '7/28/2023', 'Trippledex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (70, '4/7/2023', 70, '9/13/2023', 'Span');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (71, '6/7/2023', 71, '6/1/2023', 'Fintone');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (72, '8/24/2023', 72, '1/14/2024', 'Redhold');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (73, '12/1/2023', 73, '11/26/2023', 'Hatity');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (74, '4/24/2023', 74, '8/28/2023', 'Regrant');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (75, '3/8/2023', 75, '10/13/2023', 'Zathin');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (76, '11/26/2023', 76, '7/31/2023', 'Tresom');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (77, '7/31/2023', 77, '11/5/2023', 'Fintone');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (78, '5/28/2023', 78, '5/14/2023', 'Bytecard');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (79, '8/20/2023', 79, '7/25/2023', 'Flexidy');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (80, '2/28/2024', 80, '7/17/2023', 'Lotlux');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (81, '8/22/2023', 81, '8/11/2023', 'Quo Lux');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (82, '12/31/2023', 82, '3/31/2023', 'Cookley');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (83, '9/7/2023', 83, '12/23/2023', 'Job');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (84, '11/11/2023', 84, '7/15/2023', 'Holdlamis');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (85, '4/23/2023', 85, '1/15/2024', 'Tres-Zap');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (86, '12/29/2023', 86, '10/4/2023', 'Voyatouch');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (87, '7/31/2023', 87, '1/8/2024', 'Alpha');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (88, '12/1/2023', 88, '4/9/2023', 'Rank');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (89, '10/16/2023', 89, '6/14/2023', 'Fixflex');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (90, '12/2/2023', 90, '3/29/2023', 'Cardguard');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (91, '4/13/2023', 91, '11/30/2023', 'Hatity');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (92, '5/9/2023', 92, '10/11/2023', 'Regrant');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (93, '3/10/2023', 93, '9/22/2023', 'Gembucket');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (94, '1/28/2024', 94, '3/30/2023', 'Stim');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (95, '9/2/2023', 95, '7/9/2023', 'Home Ing');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (96, '7/23/2023', 96, '1/3/2024', 'Mat Lam Tam');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (97, '2/10/2024', 97, '9/19/2023', 'Opela');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (98, '7/9/2023', 98, '6/20/2023', 'Span');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (99, '7/29/2023', 99, '6/9/2023', 'Ronstring');
insert into Permit (permitID, startDate, safetyID, endDate, permitType) values (100, '1/19/2024', 100, '12/5/2023', 'Cardguard');


insert into Monument (monumentID, safetyID, monumentName, markerID) values (1, 1, 'Paraxerus cepapi', 1);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (2, 2, 'Chlamydosaurus kingii', 2);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (3, 3, 'Conolophus subcristatus', 3);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (4, 4, 'Centrocercus urophasianus', 4);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (5, 5, 'Physignathus cocincinus', 5);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (6, 6, 'Uraeginthus granatina', 6);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (7, 7, 'Picoides pubescens', 7);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (8, 8, 'Phalacrocorax carbo', 8);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (9, 9, 'Anser caerulescens', 9);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (10, 10, 'Lophoaetus occipitalis', 10);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (11, 11, 'Lutra canadensis', 11);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (12, 12, 'Bison bison', 12);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (13, 13, 'Larus fuliginosus', 13);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (14, 14, 'Phalacrocorax carbo', 14);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (15, 15, 'Erethizon dorsatum', 15);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (16, 16, 'Pseudalopex gymnocercus', 16);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (17, 17, 'Aepyceros mylampus', 17);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (18, 18, 'Psittacula krameri', 18);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (19, 19, 'unavailable', 19);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (20, 20, 'Herpestes javanicus', 20);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (21, 21, 'Macropus rufogriseus', 21);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (22, 22, 'Milvus migrans', 22);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (23, 23, 'Chauna torquata', 23);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (24, 24, 'Ictonyx striatus', 24);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (25, 25, 'Paroaria gularis', 25);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (26, 26, 'Actophilornis africanus', 26);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (27, 27, 'Tyto novaehollandiae', 27);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (28, 28, 'Felis silvestris lybica', 28);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (29, 29, 'Ratufa indica', 29);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (30, 30, 'Cervus duvauceli', 30);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (31, 31, 'Ardea golieth', 31);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (32, 32, 'Tachyglossus aculeatus', 32);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (33, 33, 'Tayassu tajacu', 33);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (34, 34, 'Pytilia melba', 34);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (35, 35, 'Neotoma sp.', 35);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (36, 36, 'Mabuya spilogaster', 36);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (37, 37, 'Dasyurus viverrinus', 37);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (38, 38, 'Varanus sp.', 38);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (39, 39, 'Morelia spilotes variegata', 39);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (40, 40, 'Sus scrofa', 40);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (41, 41, 'Vulpes vulpes', 41);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (42, 42, 'Carduelis pinus', 42);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (43, 43, 'Chlidonias leucopterus', 43);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (44, 44, 'Antechinus flavipes', 44);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (45, 45, 'Alopex lagopus', 45);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (46, 46, 'Cebus apella', 46);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (47, 47, 'Ploceus rubiginosus', 47);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (48, 48, 'Equus burchelli', 48);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (49, 49, 'Nasua narica', 49);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (50, 50, 'Nesomimus trifasciatus', 50);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (51, 51, 'Bucorvus leadbeateri', 51);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (52, 52, 'Felis concolor', 52);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (53, 53, 'Canis lupus baileyi', 53);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (54, 54, 'Procyon lotor', 54);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (55, 55, 'Fulica cristata', 55);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (56, 56, 'unavailable', 56);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (57, 57, 'Varanus sp.', 57);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (58, 58, 'Cervus duvauceli', 58);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (59, 59, 'Pycnonotus barbatus', 59);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (60, 60, 'Phalacrocorax albiventer', 60);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (61, 61, 'Manouria emys', 61);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (62, 62, 'Spheniscus magellanicus', 62);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (63, 63, 'Bucephala clangula', 63);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (64, 64, 'Vombatus ursinus', 64);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (65, 65, 'Acridotheres tristis', 65);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (66, 66, 'Aonyx cinerea', 66);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (67, 67, 'Nasua narica', 67);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (68, 68, 'Delphinus delphis', 68);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (69, 69, 'Dicrostonyx groenlandicus', 69);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (70, 70, 'Aquila chrysaetos', 70);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (71, 71, 'Acinynox jubatus', 71);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (72, 72, 'Sus scrofa', 72);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (73, 73, 'Colaptes campestroides', 73);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (74, 74, 'Ursus americanus', 74);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (75, 75, 'Irania gutteralis', 75);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (76, 76, 'Agama sp.', 76);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (77, 77, 'Carduelis pinus', 77);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (78, 78, 'Leptoptilos crumeniferus', 78);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (79, 79, 'Amphibolurus barbatus', 79);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (80, 80, 'Ceryle rudis', 80);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (81, 81, 'Haliaetus vocifer', 81);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (82, 82, 'Platalea leucordia', 82);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (83, 83, 'Dusicyon thous', 83);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (84, 84, 'Corvus brachyrhynchos', 84);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (85, 85, 'Sciurus vulgaris', 85);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (86, 86, 'Hyaena hyaena', 86);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (87, 87, 'Rhabdomys pumilio', 87);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (88, 88, 'Dendrocitta vagabunda', 88);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (89, 89, 'Bettongia penicillata', 89);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (90, 90, 'Macropus fuliginosus', 90);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (91, 91, 'Pelecanus conspicillatus', 91);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (92, 92, 'Martes americana', 92);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (93, 93, 'Connochaetus taurinus', 93);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (94, 94, 'Milvago chimachima', 94);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (95, 95, 'Iguana iguana', 95);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (96, 96, 'Microcebus murinus', 96);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (97, 97, 'Dusicyon thous', 97);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (98, 98, 'Falco peregrinus', 98);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (99, 99, 'Gazella thompsonii', 99);
insert into Monument (monumentID, safetyID, monumentName, markerID) values (100, 100, 'Terathopius ecaudatus', 100);

insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (1, 1, 1, 'Felis caracal', 1, 1);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (2, 2, 2, 'Corallus hortulanus cooki', 2, 2);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (3, 3, 3, 'Phalaropus lobatus', 3, 3);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (4, 4, 4, 'Lepus arcticus', 4, 4);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (5, 5, 5, 'Rana sp.', 5, 5);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (6, 6, 6, 'Macaca radiata', 6, 6);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (7, 7, 7, 'Macropus giganteus', 7, 7);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (8, 8, 8, 'Meles meles', 8, 8);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (9, 9, 9, 'Chionis alba', 9, 9);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (10, 10, 10, 'Eubalaena australis', 10, 10);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (11, 11, 11, 'Spheniscus mendiculus', 11, 11);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (12, 12, 12, 'Fratercula corniculata', 12, 12);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (13, 13, 13, 'Chlamydosaurus kingii', 13, 13);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (14, 14, 14, 'Nyctanassa violacea', 14, 14);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (15, 15, 15, 'Chlamydosaurus kingii', 15, 15);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (16, 16, 16, 'unavailable', 16, 16);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (17, 17, 17, 'Corvus albicollis', 17, 17);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (18, 18, 18, 'Columba palumbus', 18, 18);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (19, 19, 19, 'Picoides pubescens', 19, 19);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (20, 20, 20, 'Orcinus orca', 20, 20);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (21, 21, 21, 'Anitibyx armatus', 21, 21);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (22, 22, 22, 'Dusicyon thous', 22, 22);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (23, 23, 23, 'Hymenolaimus malacorhynchus', 23, 23);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (24, 24, 24, 'Choloepus hoffmani', 24, 24);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (25, 25, 25, 'Varanus sp.', 25, 25);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (26, 26, 26, 'Anastomus oscitans', 26, 26);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (27, 27, 27, 'Aonyx capensis', 27, 27);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (28, 28, 28, 'Francolinus coqui', 28, 28);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (29, 29, 29, 'Columba palumbus', 29, 29);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (30, 30, 30, 'Ciconia ciconia', 30, 30);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (31, 31, 31, 'Grus rubicundus', 31, 31);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (32, 32, 32, 'Kobus vardonii vardoni', 32, 32);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (33, 33, 33, 'Choloepus hoffmani', 33, 33);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (34, 34, 34, 'Axis axis', 34, 34);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (35, 35, 35, 'Aonyx cinerea', 35, 35);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (36, 36, 36, 'Geochelone elephantopus', 36, 36);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (37, 37, 37, 'Streptopelia decipiens', 37, 37);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (38, 38, 38, 'Castor fiber', 38, 38);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (39, 39, 39, 'Tyto novaehollandiae', 39, 39);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (40, 40, 40, 'Tockus erythrorhyncus', 40, 40);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (41, 41, 41, 'Tapirus terrestris', 41, 41);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (42, 42, 42, 'Cyrtodactylus louisiadensis', 42, 42);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (43, 43, 43, 'Galictis vittata', 43, 43);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (44, 44, 44, 'Lorythaixoides concolor', 44, 44);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (45, 45, 45, 'Mephitis mephitis', 45, 45);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (46, 46, 46, 'Prionace glauca', 46, 46);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (47, 47, 47, 'Eolophus roseicapillus', 47, 47);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (48, 48, 48, 'Axis axis', 48, 48);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (49, 49, 49, 'Laniaurius atrococcineus', 49, 49);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (50, 50, 50, 'Phalaropus fulicarius', 50, 50);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (51, 51, 51, 'Pycnonotus barbatus', 51, 51);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (52, 52, 52, 'Nyctea scandiaca', 52, 52);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (53, 53, 53, 'Ciconia episcopus', 53, 53);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (54, 54, 54, 'Macropus agilis', 54, 54);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (55, 55, 55, 'Phalacrocorax niger', 55, 55);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (56, 56, 56, 'Antilocapra americana', 56, 56);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (57, 57, 57, 'Ardea cinerea', 57, 57);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (58, 58, 58, 'Meles meles', 58, 58);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (59, 59, 59, 'Cereopsis novaehollandiae', 59, 59);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (60, 60, 60, 'Madoqua kirkii', 60, 60);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (61, 61, 61, 'Leptoptilos crumeniferus', 61, 61);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (62, 62, 62, 'Threskionis aethiopicus', 62, 62);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (63, 63, 63, 'Grus antigone', 63, 63);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (64, 64, 64, 'Paroaria gularis', 64, 64);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (65, 65, 65, 'Cercatetus concinnus', 65, 65);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (66, 66, 66, 'Proteles cristatus', 66, 66);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (67, 67, 67, 'Scolopax minor', 67, 67);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (68, 68, 68, 'Bubalus arnee', 68, 68);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (69, 69, 69, 'Paradoxurus hermaphroditus', 69, 69);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (70, 70, 70, 'Acrobates pygmaeus', 70, 70);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (71, 71, 71, 'Paroaria gularis', 71, 71);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (72, 72, 72, 'Sciurus vulgaris', 72, 72);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (73, 73, 73, 'Crax sp.', 73, 73);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (74, 74, 74, 'Cynictis penicillata', 74, 74);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (75, 75, 75, 'Dasyurus viverrinus', 75, 75);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (76, 76, 76, 'unavailable', 76, 76);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (77, 77, 77, 'Corvus brachyrhynchos', 77, 77);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (78, 78, 78, 'Stercorarius longicausus', 78, 78);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (79, 79, 79, 'Odocoileus hemionus', 79, 79);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (80, 80, 80, 'Phalaropus lobatus', 80, 80);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (81, 81, 81, 'Spheniscus magellanicus', 81, 81);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (82, 82, 82, 'Uraeginthus bengalus', 82, 82);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (83, 83, 83, 'Acrobates pygmaeus', 83, 83);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (84, 84, 84, 'Colaptes campestroides', 84, 84);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (85, 85, 85, 'Phoca vitulina', 85, 85);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (86, 86, 86, 'Choloepus hoffmani', 86, 86);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (87, 87, 87, 'Capreolus capreolus', 87, 87);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (88, 88, 88, 'Acridotheres tristis', 88, 88);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (89, 89, 89, 'Phalaropus lobatus', 89, 89);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (90, 90, 90, 'Alopex lagopus', 90, 90);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (91, 91, 91, 'Chauna torquata', 91, 91);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (92, 92, 92, 'Otocyon megalotis', 92, 92);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (93, 93, 93, 'Philetairus socius', 93, 93);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (94, 94, 94, 'Crotalus cerastes', 94, 94);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (95, 95, 95, 'Manouria emys', 95, 95);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (96, 96, 96, 'Ara ararauna', 96, 96);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (97, 97, 97, 'Helogale undulata', 97, 97);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (98, 98, 98, 'Zalophus californicus', 98, 98);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (99, 99, 99, 'Felis chaus', 99, 99);
insert into Markers (markerID, descriptionID, monumentID, markerName, markerLatitude, markerLongitude) values (100, 100, 100, 'Nucifraga columbiana', 100, 100);

insert into Stores (galleryID, photoID) values (1, 1);
insert into Stores (galleryID, photoID) values (2, 2);
insert into Stores (galleryID, photoID) values (3, 3);
insert into Stores (galleryID, photoID) values (4, 4);
insert into Stores (galleryID, photoID) values (5, 5);
insert into Stores (galleryID, photoID) values (6, 6);
insert into Stores (galleryID, photoID) values (7, 7);
insert into Stores (galleryID, photoID) values (8, 8);
insert into Stores (galleryID, photoID) values (9, 9);
insert into Stores (galleryID, photoID) values (10, 10);
insert into Stores (galleryID, photoID) values (11, 11);
insert into Stores (galleryID, photoID) values (12, 12);
insert into Stores (galleryID, photoID) values (13, 13);
insert into Stores (galleryID, photoID) values (14, 14);
insert into Stores (galleryID, photoID) values (15, 15);
insert into Stores (galleryID, photoID) values (16, 16);
insert into Stores (galleryID, photoID) values (17, 17);
insert into Stores (galleryID, photoID) values (18, 18);
insert into Stores (galleryID, photoID) values (19, 19);
insert into Stores (galleryID, photoID) values (20, 20);
insert into Stores (galleryID, photoID) values (21, 21);
insert into Stores (galleryID, photoID) values (22, 22);
insert into Stores (galleryID, photoID) values (23, 23);
insert into Stores (galleryID, photoID) values (24, 24);
insert into Stores (galleryID, photoID) values (25, 25);
insert into Stores (galleryID, photoID) values (26, 26);
insert into Stores (galleryID, photoID) values (27, 27);
insert into Stores (galleryID, photoID) values (28, 28);
insert into Stores (galleryID, photoID) values (29, 29);
insert into Stores (galleryID, photoID) values (30, 30);
insert into Stores (galleryID, photoID) values (31, 31);
insert into Stores (galleryID, photoID) values (32, 32);
insert into Stores (galleryID, photoID) values (33, 33);
insert into Stores (galleryID, photoID) values (34, 34);
insert into Stores (galleryID, photoID) values (35, 35);
insert into Stores (galleryID, photoID) values (36, 36);
insert into Stores (galleryID, photoID) values (37, 37);
insert into Stores (galleryID, photoID) values (38, 38);
insert into Stores (galleryID, photoID) values (39, 39);
insert into Stores (galleryID, photoID) values (40, 40);
insert into Stores (galleryID, photoID) values (41, 41);
insert into Stores (galleryID, photoID) values (42, 42);
insert into Stores (galleryID, photoID) values (43, 43);
insert into Stores (galleryID, photoID) values (44, 44);
insert into Stores (galleryID, photoID) values (45, 45);
insert into Stores (galleryID, photoID) values (46, 46);
insert into Stores (galleryID, photoID) values (47, 47);
insert into Stores (galleryID, photoID) values (48, 48);
insert into Stores (galleryID, photoID) values (49, 49);
insert into Stores (galleryID, photoID) values (50, 50);
insert into Stores (galleryID, photoID) values (51, 51);
insert into Stores (galleryID, photoID) values (52, 52);
insert into Stores (galleryID, photoID) values (53, 53);
insert into Stores (galleryID, photoID) values (54, 54);
insert into Stores (galleryID, photoID) values (55, 55);
insert into Stores (galleryID, photoID) values (56, 56);
insert into Stores (galleryID, photoID) values (57, 57);
insert into Stores (galleryID, photoID) values (58, 58);
insert into Stores (galleryID, photoID) values (59, 59);
insert into Stores (galleryID, photoID) values (60, 60);
insert into Stores (galleryID, photoID) values (61, 61);
insert into Stores (galleryID, photoID) values (62, 62);
insert into Stores (galleryID, photoID) values (63, 63);
insert into Stores (galleryID, photoID) values (64, 64);
insert into Stores (galleryID, photoID) values (65, 65);
insert into Stores (galleryID, photoID) values (66, 66);
insert into Stores (galleryID, photoID) values (67, 67);
insert into Stores (galleryID, photoID) values (68, 68);
insert into Stores (galleryID, photoID) values (69, 69);
insert into Stores (galleryID, photoID) values (70, 70);
insert into Stores (galleryID, photoID) values (71, 71);
insert into Stores (galleryID, photoID) values (72, 72);
insert into Stores (galleryID, photoID) values (73, 73);
insert into Stores (galleryID, photoID) values (74, 74);
insert into Stores (galleryID, photoID) values (75, 75);
insert into Stores (galleryID, photoID) values (76, 76);
insert into Stores (galleryID, photoID) values (77, 77);
insert into Stores (galleryID, photoID) values (78, 78);
insert into Stores (galleryID, photoID) values (79, 79);
insert into Stores (galleryID, photoID) values (80, 80);
insert into Stores (galleryID, photoID) values (81, 81);
insert into Stores (galleryID, photoID) values (82, 82);
insert into Stores (galleryID, photoID) values (83, 83);
insert into Stores (galleryID, photoID) values (84, 84);
insert into Stores (galleryID, photoID) values (85, 85);
insert into Stores (galleryID, photoID) values (86, 86);
insert into Stores (galleryID, photoID) values (87, 87);
insert into Stores (galleryID, photoID) values (88, 88);
insert into Stores (galleryID, photoID) values (89, 89);
insert into Stores (galleryID, photoID) values (90, 90);
insert into Stores (galleryID, photoID) values (91, 91);
insert into Stores (galleryID, photoID) values (92, 92);
insert into Stores (galleryID, photoID) values (93, 93);
insert into Stores (galleryID, photoID) values (94, 94);
insert into Stores (galleryID, photoID) values (95, 95);
insert into Stores (galleryID, photoID) values (96, 96);
insert into Stores (galleryID, photoID) values (97, 97);
insert into Stores (galleryID, photoID) values (98, 98);
insert into Stores (galleryID, photoID) values (99, 99);
insert into Stores (galleryID, photoID) values (100, 100);

insert into WorksAt (parkID, rangerID) values (1, 1);
insert into WorksAt (parkID, rangerID) values (2, 2);
insert into WorksAt (parkID, rangerID) values (3, 3);
insert into WorksAt (parkID, rangerID) values (4, 4);
insert into WorksAt (parkID, rangerID) values (5, 5);
insert into WorksAt (parkID, rangerID) values (6, 6);
insert into WorksAt (parkID, rangerID) values (7, 7);
insert into WorksAt (parkID, rangerID) values (8, 8);
insert into WorksAt (parkID, rangerID) values (9, 9);
insert into WorksAt (parkID, rangerID) values (10, 10);
insert into WorksAt (parkID, rangerID) values (11, 11);
insert into WorksAt (parkID, rangerID) values (12, 12);
insert into WorksAt (parkID, rangerID) values (13, 13);
insert into WorksAt (parkID, rangerID) values (14, 14);
insert into WorksAt (parkID, rangerID) values (15, 15);
insert into WorksAt (parkID, rangerID) values (16, 16);
insert into WorksAt (parkID, rangerID) values (17, 17);
insert into WorksAt (parkID, rangerID) values (18, 18);
insert into WorksAt (parkID, rangerID) values (19, 19);
insert into WorksAt (parkID, rangerID) values (20, 20);
insert into WorksAt (parkID, rangerID) values (21, 21);
insert into WorksAt (parkID, rangerID) values (22, 22);
insert into WorksAt (parkID, rangerID) values (23, 23);
insert into WorksAt (parkID, rangerID) values (24, 24);
insert into WorksAt (parkID, rangerID) values (25, 25);
insert into WorksAt (parkID, rangerID) values (26, 26);
insert into WorksAt (parkID, rangerID) values (27, 27);
insert into WorksAt (parkID, rangerID) values (28, 28);
insert into WorksAt (parkID, rangerID) values (29, 29);
insert into WorksAt (parkID, rangerID) values (30, 30);
insert into WorksAt (parkID, rangerID) values (31, 31);
insert into WorksAt (parkID, rangerID) values (32, 32);
insert into WorksAt (parkID, rangerID) values (33, 33);
insert into WorksAt (parkID, rangerID) values (34, 34);
insert into WorksAt (parkID, rangerID) values (35, 35);
insert into WorksAt (parkID, rangerID) values (36, 36);
insert into WorksAt (parkID, rangerID) values (37, 37);
insert into WorksAt (parkID, rangerID) values (38, 38);
insert into WorksAt (parkID, rangerID) values (39, 39);
insert into WorksAt (parkID, rangerID) values (40, 40);
insert into WorksAt (parkID, rangerID) values (41, 41);
insert into WorksAt (parkID, rangerID) values (42, 42);
insert into WorksAt (parkID, rangerID) values (43, 43);
insert into WorksAt (parkID, rangerID) values (44, 44);
insert into WorksAt (parkID, rangerID) values (45, 45);
insert into WorksAt (parkID, rangerID) values (46, 46);
insert into WorksAt (parkID, rangerID) values (47, 47);
insert into WorksAt (parkID, rangerID) values (48, 48);
insert into WorksAt (parkID, rangerID) values (49, 49);
insert into WorksAt (parkID, rangerID) values (50, 50);
insert into WorksAt (parkID, rangerID) values (51, 51);
insert into WorksAt (parkID, rangerID) values (52, 52);
insert into WorksAt (parkID, rangerID) values (53, 53);
insert into WorksAt (parkID, rangerID) values (54, 54);
insert into WorksAt (parkID, rangerID) values (55, 55);
insert into WorksAt (parkID, rangerID) values (56, 56);
insert into WorksAt (parkID, rangerID) values (57, 57);
insert into WorksAt (parkID, rangerID) values (58, 58);
insert into WorksAt (parkID, rangerID) values (59, 59);
insert into WorksAt (parkID, rangerID) values (60, 60);
insert into WorksAt (parkID, rangerID) values (61, 61);
insert into WorksAt (parkID, rangerID) values (62, 62);
insert into WorksAt (parkID, rangerID) values (63, 63);
insert into WorksAt (parkID, rangerID) values (64, 64);
insert into WorksAt (parkID, rangerID) values (65, 65);
insert into WorksAt (parkID, rangerID) values (66, 66);
insert into WorksAt (parkID, rangerID) values (67, 67);
insert into WorksAt (parkID, rangerID) values (68, 68);
insert into WorksAt (parkID, rangerID) values (69, 69);
insert into WorksAt (parkID, rangerID) values (70, 70);
insert into WorksAt (parkID, rangerID) values (71, 71);
insert into WorksAt (parkID, rangerID) values (72, 72);
insert into WorksAt (parkID, rangerID) values (73, 73);
insert into WorksAt (parkID, rangerID) values (74, 74);
insert into WorksAt (parkID, rangerID) values (75, 75);
insert into WorksAt (parkID, rangerID) values (76, 76);
insert into WorksAt (parkID, rangerID) values (77, 77);
insert into WorksAt (parkID, rangerID) values (78, 78);
insert into WorksAt (parkID, rangerID) values (79, 79);
insert into WorksAt (parkID, rangerID) values (80, 80);
insert into WorksAt (parkID, rangerID) values (81, 81);
insert into WorksAt (parkID, rangerID) values (82, 82);
insert into WorksAt (parkID, rangerID) values (83, 83);
insert into WorksAt (parkID, rangerID) values (84, 84);
insert into WorksAt (parkID, rangerID) values (85, 85);
insert into WorksAt (parkID, rangerID) values (86, 86);
insert into WorksAt (parkID, rangerID) values (87, 87);
insert into WorksAt (parkID, rangerID) values (88, 88);
insert into WorksAt (parkID, rangerID) values (89, 89);
insert into WorksAt (parkID, rangerID) values (90, 90);
insert into WorksAt (parkID, rangerID) values (91, 91);
insert into WorksAt (parkID, rangerID) values (92, 92);
insert into WorksAt (parkID, rangerID) values (93, 93);
insert into WorksAt (parkID, rangerID) values (94, 94);
insert into WorksAt (parkID, rangerID) values (95, 95);
insert into WorksAt (parkID, rangerID) values (96, 96);
insert into WorksAt (parkID, rangerID) values (97, 97);
insert into WorksAt (parkID, rangerID) values (98, 98);
insert into WorksAt (parkID, rangerID) values (99, 99);
insert into WorksAt (parkID, rangerID) values (100, 100);
