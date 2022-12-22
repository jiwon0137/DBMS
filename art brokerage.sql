Drop DATABASE art_brokerage;
CREATE DATABASE art_brokerage;
USE art_brokerage;

CREATE table artist(
name VARCHAR(30) NOT NULL,
id VARCHAR(30) NOT NULL,
availability char(5) NOT NULL,
starting_rate int(10) NOT NULL,
medium	VARCHAR(30),
style 	VARCHAR(30),
mood	VARCHAR(30),
primary key(id)
);

CREATE TABLE artwork(
artist VARCHAR(30) NOT NULL,
a_id VARCHAR(30) NOT NULL,
a_name VARCHAR(50) NOT NULL,
price VARCHAR(30),
sold VARCHAR(3) NOT NULL,
medium VARCHAR(30),
style VARCHAR(30),
mood VARCHAR(30),
PRIMARY KEY(a_id),
FOREIGN KEY(artist) REFERENCES artist(id)
);

CREATE TABLE customer(
name VARCHAR(30) NOT NULL,
c_id VARCHAR(30) NOT NULL,
number VARCHAR(30) NOT NULL,
medium  VARCHAR(30),
style VARCHAR(30),
mood VARCHAR(30),
PRIMARY KEY(c_id)
);

CREATE TABLE  unique_orders(
artwork_id VARCHAR(30) NOT NULL,
c_id VARCHAR(30) NOT NULL,
order_id VARCHAR(30) NOT NULL,
status	VARCHAR(30) NOT NULL,
date DATE NOT NULL,
PRIMARY KEY(artwork_id, c_id, order_id),
FOREIGN KEY(artwork_id) REFERENCES artwork(a_id) ON UPDATE NO ACTION ON DELETE CASCADE,
FOREIGN KEY(c_id) REFERENCES customer(c_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE  custom_orders(
artist_id VARCHAR(30) NOT NULL,
c_id VARCHAR(30) NOT NULL,
order_id VARCHAR(30) NOT NULL,
status	VARCHAR(30) NOT NULL,
date DATE NOT NULL,
PRIMARY KEY(artist_id,c_id, order_id),
FOREIGN KEY(artist_id) REFERENCES artist(id) ON UPDATE NO ACTION ON DELETE CASCADE,
FOREIGN KEY(c_id) REFERENCES customer(c_id) ON UPDATE NO ACTION ON DELETE CASCADE
);

INSERT INTO  customer (name, c_id, number, medium, style, mood)
VALUES
('Benito Ocasio', '310994','325-120-1234',  'oil', 'abstract', 'delight'),
('Christopher Cerulli', '101786','325-120-1004', 'oil', 'realism', 'dark'),
('Tobias Forge', '030381', '325-112-0000', 'watercolor', 'impressionism', 'dark'),
('Sebastien Pietrapiana', '228899','320-120-1214', 'acrylic', 'futurism', 'chaotic'),
('Sharon den Adel', '121212', '312-111-1234','oil', 'landscapes', 'warmth'),
('Gerard Way', '549777', '325-888-2334','acrylic', 'futurism', 'dark'),
('Mathew Sanders', '678895', '325-000-9999','digital', 'portraits', 'calming'),
('Tarja Turunen', '33352', '344-166-1156','digital', 'impressionism', 'dark'),
('Atsushi Sakura', '444444', '325-100-1002','pen', 'portraits', 'delight'),
('Maria Felix', '151511', '325-880-7777','pencil', 'portraits', 'sensual');

INSERT INTO artist (name, id, availability, starting_rate, medium, style, mood) 
VALUES
('Elizabeth Robles', '01234', 'NO', '1500000', 'oil', 'realism', 'dark'),
('Humaira Abid', '12345', 'YES', '10000', 'pencil', 'portraits', 'sensual'),
('Golnar Adili', '12122', 'YES', '500', 'watercolor', 'realism', 'delight'),
('Laylah Ali', '37901', 'NO', '1000', 'acrylic', 'futurism', 'chaotic'),
('Miya Ando', '33333', 'YES', '20000', 'watercolor', 'impressionism', 'dark'),
('Carl Andre', '88900', 'YES', '1500', 'pen', 'abstract', 'chaotic'),
('Michael Dweck', '768891', 'YES', '8000','digital', 'portraits', 'calming'),
('Nancy Dwyer', '002367', 'NO', '500000', 'oil', 'landscapes', 'warmth'),
('Mel Edwards','111888', 'YES', '4300', 'pen', 'portraits', 'delight'),
('Awol Erizku', '733333', 'NO', '60000', 'acrylic', 'futurism', 'dark'),
('Ellen Gallagher', '666666', 'YES', '44444', 'oil', 'abstract', 'warmth');

INSERT INTO artwork  (artist, a_id, a_name, price, sold, medium, style, mood )
VALUES
('01234','10000', 'dancing with the goth', '180000', 'YES', 'Oil', 'impressionism', 'calming'),
('01234', '10001', 'rocky road', '100000', 'NO', 'Oil', 'impressionism', 'warmth'),
('01234', '10002', 'universe', '24000', 'YES', 'Oil', 'portraits', 'delight' ),
('12345', '10010', 'Searching for Home', '400', 'NO',  'acrylic', 'abstract', 'chaotic'),
('12345', '10011', 'The world is NOT Perfect', '1200', 'NO', 'pencil', 'abstract', 'sensual'),
('12122', '10020', 'Family History Woodblock book', '4600', 'NO', 'Oil', 'abstract', 'chaotic'),
('12122', '10021', 'Poetry to Politics','unknown', 'YES', 'Oil', 'impressionism', 'chaotic'),
('12122', '10022', 'She Feels Your Absence Deeply','3200', 'NO', 'pencil', 'realism', 'dark'),
('37901', '10030', 'Power','1500', 'NO', 'Oil', 'realism', 'sensual'),
('37901', '10031', 'American','38000', 'YES', 'Watercolor', 'realism', 'delight'),
('37901', '10032', 'Greenheads','700', 'NO', 'pencil', 'landscapes', 'warmth'),
('33333', '10040', 'Phenomena Kasumi Mist','56836', 'NO', 'Oil', 'landscapes', 'sensual'),
('33333', '10041', 'Kumo (Cloud) for The Glass HoUSE(Shizen) Nature','25000', 'NO','Oil', 'abstract', 'dark'),
('33333', '10042', 'Stanoff','30000', 'NO', 'Oil', 'landscapes', 'warmth'),
('33333', '10043', 'Mirror Shou Sugi Ban','145900', 'NO', 'acrylic', 'portraits', 'sensual'),
('88900', '10050', 'Sculpture as place','15660', 'NO', 'Oil','abstract', 'delight'),
('88900', '10051', 'Fire bricks','6160', 'NO','acrylic', 'abstract', 'delight'),
('768891', '10060', 'The Truffle Hunters','unknown', 'YES', 'digital', 'impressionism', 'delight'),
('768891', '10061', 'Joseph 1','1500', 'NO', 'pencil', 'futurism', 'dark'),
('768891', '10062', 'Mermaid 43','7500', 'NO', 'digital', 'futurism', 'chaotic'),
('768891', '10063', 'Trop 4 Blue','unknown', 'NO','digital', 'impressionism', 'dark'),
('002367', '10070', 'Your Name Here', '11000','NO', 'Watercolor', 'abstract', 'warmth'),
('002367', '10071', 'Out of MY Mind', '650','NO', 'Oil', 'impressionism', 'delight'),
('002367', '10072', 'Mayhem', '650','NO', 'digital', 'impressionism', 'warmth'),
('111888', '10080', 'Masterpiece', '14030','NO', 'pencil', 'landscapes', 'dark'),
('111888', '10081', 'Five Decades', 'unknown','YES', 'pen', 'futurism', 'chaotic'),
('733333', '10090', 'Memories of a Lost Sphinx', '508600','NO', 'acrylic', 'abstract', 'delight'),
('666666', '10100', 'DeLuxe', '78200','NO', 'pen', 'realism', 'sensual'),
('666666', '10101', 'Cutting', '148200','NO', 'pencil', 'realism', 'chaotic');

INSERT INTO unique_orders (artwork_id, c_id, order_id, status, date)
VALUES
('10000', '101786',  'S22210', 'delivered', '2022-11-15'),
('10002', '310994', 'S12323', 'delivered', '2022-03-15'),
('10021', '678895', 'S67731', 'shipped', '2022-07-21');

INSERT INTO custom_orders (artist_id, c_id, order_id, status, date )
VALUES
('33333', '101786', 'C33555', 'in progress', '2022-10-31');

select sum(price * .3)
from artwork
inner join unique_orders
on artwork.a_id = unique_orders.artwork_id;