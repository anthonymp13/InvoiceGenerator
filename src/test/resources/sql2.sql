/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `company`;

# /*!40101 SET @saved_cs_client     = @@character_set_client */;
# /*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE company (
                         id int NOT NULL AUTO_INCREMENT,
                         companyName varchar(32) NOT NULL,
                         address varchar(32) DEFAULT NULL,
                         city varchar(32) DEFAULT NULL,
                         state varchar(32) DEFAULT NULL,
                         zip int DEFAULT NULL,
                         phoneNumber varchar(32) DEFAULT NULL,
                         PRIMARY KEY (id)
);

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	69	, '	Feedbug	',  '	48868 Farwell Way	',  '	Corona	',  '	California	',  '	92878	',  '	951-799-5926	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	98	, '	Zoombox	',  '	770 Myrtle Pass	',  '	North Hollywood	',  '	California	',  '	91606	',  '	818-285-0020	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	33	, '	Linktype	',  '	57230 East Place	',  '	Louisville	',  '	Kentucky	',  '	40250	',  '	502-107-4725	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	29	, '	Oyoloo	',  '	85 Atwood Place	',  '	Topeka	',  '	Kansas	',  '	66622	',  '	785-480-1622	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	88	, '	Jabbertype	',  '	726 Farwell Place	',  '	Suffolk	',  '	Virginia	',  '	23436	',  '	757-274-4029	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	72	, '	Trilia	',  '	12034 1st Avenue	',  '	Gulfport	',  '	Mississippi	',  '	39505	',  '	228-501-5474	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	17	, '	Agivu	',  '	4476 Gateway Street	',  '	Roanoke	',  '	Virginia	',  '	24040	',  '	540-486-7032	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	76	, '	Vidoo	',  '	0004 Namekagon Hill	',  '	Denver	',  '	Colorado	',  '	80243	',  '	303-144-8089	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	94	, '	Thoughtworks	',  '	7792 Ohio Trail	',  '	Cincinnati	',  '	Ohio	',  '	45271	',  '	513-266-0697	');
insert into company (id, companyName, address, city, state, zip, phoneNumber) values (	2	, '	Eire	',  '	16 Crownhardt Plaza	',  '	Nashville	',  '	Tennessee	',  '	37215	',  '	615-623-8578	');

/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;

CREATE TABLE customer (
                          id int NOT NULL AUTO_INCREMENT,
                          firstName varchar(32) NOT NULL,
                          lastName varchar(32) NOT NULL,
                          street varchar(32) NOT NULL,
                          postalCode int NOT NULL,
                          city varchar(32) NOT NULL,
                          countryId varchar(32) NOT NULL,
                          state varchar(32) NOT NULL,
                          phoneNumber varchar(32) DEFAULT NULL,
                          email varchar(32) DEFAULT NULL,
                          companyId int NOT NULL,
                          PRIMARY KEY (id),
                          KEY customer_company_id_fk (companyId),
                          CONSTRAINT customer_company_id_fk FOREIGN KEY (companyId) REFERENCES company (id)
);

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (1, "Sim",  "Radnage",  "	34 Cody Road	",  "	76905	",  "	San Angelo	",  "	United States	",  "	California	",  "	325-862-5363	",  "	sradnage0@yellowbook.com	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	2	, "Huntley",  "	Esby	",  "	278 Oxford Circle	",  "	99507	",  "	Anchorage	",  "	United States	",  "	Mississippi	",  "	907-694-4737	",  "	hesby1@ask.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	3	, "Lexie",  "	Deware	",  "	7 Lakewood Alley	",  "	95818	",  "	Sacramento	",  "	United States	",  "	California	",  "	916-198-7273	",  "	ldeware2@deliciousdays.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	4	, "	Cyrillus",  "	Kowal	",  "	0908 American Ash Drive	",  "	87201	",  "	Albuquerque	",  "	United States	",  "	Colorado	",  "	505-179-3834	",  "	ckowal3@netvibes.com	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	5	, "Addie",  "	Cherrington	",  "	10697 Carioca Road	",  "	36689	",  "	Mobile	",  "	United States	",  "	California	",  "	251-163-0612	",  "	acherrington4@istockphoto.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	6	, "Betsey",  "	Kinsman	",  "	64543 Daystar Hill	",  "	33448	",  "	Delray Beach	",  "	United States	",  "	Kansas	",  "	561-595-2404	",  "	bkinsman5@umn.edu	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	7	, "	Jocelyn	",  "	Dobrowski	",  "	1 Prentice Point	",  "	27404	",  "	Greensboro	",  "	United States	",  "	Ohio	",  "	336-476-0414	",  "	jdobrowski6@smugmug.com	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	8	, "	Gloriana	",  "	Gillicuddy	",  "	8 Old Gate Trail	",  "	10004	",  "	New York City	",  "	United States	",  "	Mississippi	",  "	347-293-3636	",  "	ggillicuddy7@spotify.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	9	, "	Abba	",  "	D'Ugo	",  "	90 Transport Pass	",  "	71115	",  "	Shreveport	",  "	United States	",  "	California	",  "	318-367-3080	",  "	adugo8@usnews.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	10	, "	Belvia	",  "	Eggleston	",  "	98 Bowman Pass	",  "	94110	",  "	San Francisco	",  "	United States	",  "	Tennessee	",  "	562-899-4934	",  "	beggleston9@fastcompany.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	11	, "	Creight	",  "	Buff	",  "	43007 Glacier Hill Place	",  "	93094	",  "	Simi Valley	",  "	United States	",  "	Mississippi	",  "	805-578-3063	",  "	cbuffa@nsw.gov.au	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	12	, "	Rania	",  "	Alliott	",  "	323 Carpenter Place	",  "	22096	",  "	Reston	",  "	United States	",  "	Tennessee	",  "	571-671-5348	",  "	ralliottb@webmd.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	13	, "	Tina	",  "	Shields	",  "	74 Pond Alley	",  "	98158	",  "	Seattle	",  "	United States	",  "	California	",  "	360-238-2737	",  "	tshieldsc@histats.com	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	14	, "	Chloris	",  "	Bresnahan	",  "	92422 Oak Parkway	",  "	37924	",  "	Knoxville	",  "	United States	",  "	Kansas	",  "	865-919-4814	",  "	cbresnahand@altervista.org	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	15	, "	Daphene	",  "	Wonter	",  "	2537 Warbler Way	",  "	71213	",  "	Monroe	",  "	United States	",  "	Colorado	",  "	318-759-1883	",  "	dwontere@gnu.org	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	16	, "	Celestine	",  "	Attenburrow	",  "	43 Arapahoe Plaza	",  "	92170	",  "	San Diego	",  "	United States	",  "	Kansas	",  "	619-909-5570	",  "	cattenburrowf@google.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	17	, "	Conan	",  "	Rispen	",  "	364 Moose Crossing	",  "	32575	",  "	Pensacola	",  "	United States	",  "	Kansas	",  "	850-950-4918	",  "	crispeng@prnewswire.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	18	, "	Dinny	",  "	Prendeville	",  "	94410 Graceland Crossing	",  "	50981	",  "	Des Moines	",  "	United States	",  "	Virginia	",  "	515-511-9243	",  "	dprendevilleh@gov.uk	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	19	, "	Dukey	",  "	Whitefoot	",  "	8762 Sage Place	",  "	93094	",  "	Simi Valley	",  "	United States	",  "	Ohio	",  "	805-985-9032	",  "	dwhitefooti@cbc.ca	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	20	, "	Catlaina	",  "	Ciepluch	",  "	8873 Melody Alley	",  "	2745	",  "	New Bedford	",  "	United States	",  "	Kentucky	",  "	508-978-2742	",  "	cciepluchj@hubpages.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	21	, "	Krisha	",  "	Rosettini	",  "	66 Badeau Point	",  "	77288	",  "	Houston	",  "	United States	",  "	Tennessee	",  "	713-180-7888	",  "	krosettinik@wix.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	22	, "	Aime	",  "	Duiguid	",  "	04 Melrose Trail	",  "	52410	",  "	Cedar Rapids	",  "	United States	",  "	Ohio	",  "	319-969-3273	",  "	aduiguidl@networkadvertising.org	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	23	, "	Marylinda	",  "	Patron	",  "	303 Daystar Court	",  "	79940	",  "	El Paso	",  "	United States	",  "	Virginia	",  "	915-395-7074	",  "	mpatronm@ebay.com	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	24	, "	Gaylor	",  "	Listone	",  "	46 Mesta Lane	",  "	94237	",  "	Sacramento	",  "	United States	",  "	Tennessee	",  "	916-927-3895	",  "	glistonen@sun.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	25	, "	Cal	",  "	Reichardt	",  "	9059 Schurz Crossing	",  "	67236	",  "	Wichita	",  "	United States	",  "	California	",  "	316-957-4169	",  "	creichardto@scientificamerican.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	26	, "	Page	",  "	Scad	",  "	14 Arkansas Court	",  "	81505	",  "	Grand Junction	",  "	United States	",  "	California	",  "	970-859-3142	",  "	pscadp@spiegel.de	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	27	, "	Shellie	",  "	Heinrich	",  "	67414 Hollow Ridge Circle	",  "	84170	",  "	Salt Lake City	",  "	United States	",  "	California	",  "	801-611-4424	",  "	sheinrichq@nbcnews.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	28	, "	Alvira	",  "	Kennea	",  "	21713 Towne Road	",  "	46896	",  "	Fort Wayne	",  "	United States	",  "	Virginia	",  "	260-603-8218	",  "	akennear@tumblr.com	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	29	, "	Loren	",  "	Prati	",  "	8766 Sutteridge Trail	",  "	68144	",  "	Omaha	",  "	United States	",  "	Kentucky	",  "	402-115-7658	",  "	lpratis@scientificamerican.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	30	, "	Sander	",  "	Grassett	",  "	94 Ludington Avenue	",  "	98115	",  "	Seattle	",  "	United States	",  "	Tennessee	",  "	206-686-3763	",  "	sgrassettt@list-manage.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	31	, "	Alley	",  "	Featherstonhaugh	",  "	4 Cordelia Street	",  "	92415	",  "	San Bernardino	",  "	United States	",  "	Tennessee	",  "	760-645-4280	",  "	afeatherstonhaughu@friendfeed.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	32	, "	Tana	",  "	Cantera	",  "	4 John Wall Street	",  "	24009	",  "	Roanoke	",  "	United States	",  "	Ohio	",  "	540-376-3584	",  "	tcanterav@si.edu	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	33	, "	Sam	",  "	Gillatt	",  "	3 Jana Way	",  "	98682	",  "	Vancouver	",  "	United States	",  "	Kentucky	",  "	360-290-6445	",  "	sgillattw@washington.edu	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	34	, "	Caddric	",  "	Lowthorpe	",  "	791 Sloan Place	",  "	18105	",  "	Allentown	",  "	United States	",  "	Tennessee	",  "	610-778-2844	",  "	clowthorpex@live.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	35	, "	Germana	",  "	Crace	",  "	41766 Upham Drive	",  "	37131	",  "	Murfreesboro	",  "	United States	",  "	Kentucky	",  "	615-942-5116	",  "	gcracey@independent.co.uk	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	36	, "	Cheslie	",  "	Beevor	",  "	8670 Nevada Avenue	",  "	36109	",  "	Montgomery	",  "	United States	",  "	California	",  "	334-824-1022	",  "	cbeevorz@furl.net	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	37	, "	Wilow	",  "	Silk	",  "	53210 Sachtjen Place	",  "	46896	",  "	Fort Wayne	",  "	United States	",  "	Kentucky	",  "	260-372-5966	",  "	wsilk10@fotki.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	38	, "	Kit	",  "	Brothwell	",  "	64 Summerview Terrace	",  "	76198	",  "	Fort Worth	",  "	United States	",  "	Virginia	",  "	682-882-5148	",  "	kbrothwell11@istockphoto.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	39	, "	Glen	",  "	Sheilds	",  "	4 Boyd Drive	",  "	92132	",  "	San Diego	",  "	United States	",  "	Mississippi	",  "	858-512-1516	",  "	gsheilds12@marketwatch.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	40	, "	Kirbee	",  "	Bonnell	",  "	34 Mcbride Point	",  "	90505	",  "	Torrance	",  "	United States	",  "	Virginia	",  "	310-373-7176	",  "	kbonnell13@seesaa.net	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	41	, "	Eldin	",  "	Wedderburn	",  "	16 Vermont Avenue	",  "	27455	",  "	Greensboro	",  "	United States	",  "	Colorado	",  "	910-820-4211	",  "	ewedderburn14@scribd.com	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	42	, "	L;urette	",  "	Rawles	",  "	16552 School Road	",  "	32590	",  "	Pensacola	",  "	United States	",  "	Virginia	",  "	850-659-5477	",  "	lrawles15@ihg.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	43	, "	Aubrey	",  "	Edler	",  "	60 Monument Pass	",  "	73173	",  "	Oklahoma City	",  "	United States	",  "	Tennessee	",  "	405-381-8311	",  "	aedler16@facebook.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	44	, "	Tedda	",  "	Rother	",  "	250 Monument Pass	",  "	60624	",  "	Chicago	",  "	United States	",  "	Tennessee	",  "	312-616-7429	",  "	trother17@netscape.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	45	, "	Elena	",  "	Smythin	",  "	606 Prairie Rose Lane	",  "	70174	",  "	New Orleans	",  "	United States	",  "	Virginia	",  "	504-948-0226	",  "	esmythin18@addthis.com	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	46	, "	Aguistin	",  "	Lagde	",  "	6 Jenna Hill	",  "	27690	",  "	Raleigh	",  "	United States	",  "	Kansas	",  "	919-916-4552	",  "	alagde19@quantcast.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	47	, "	Thurstan	",  "	Kubek	",  "	2 Fieldstone Trail	",  "	33147	",  "	Miami	",  "	United States	",  "	Tennessee	",  "	786-353-8427	",  "	tkubek1a@wix.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	48	, "	Diahann	",  "	Anslow	",  "	89 Bartelt Drive	",  "	70820	",  "	Baton Rouge	",  "	United States	",  "	Kentucky	",  "	225-487-9710	",  "	danslow1b@tmall.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	49	, "	Tamiko	",  "	Coyle	",  "	20936 Heath Pass	",  "	10184	",  "	New York City	",  "	United States	",  "	Virginia	",  "	212-368-4055	",  "	tcoyle1c@imgur.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	50	, "	Inge	",  "	Antonellini	",  "	57681 Crownhardt Terrace	",  "	78285	",  "	San Antonio	",  "	United States	",  "	Mississippi	",  "	210-486-9770	",  "	iantonellini1d@answers.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	51	, "	Abramo	",  "	Hansod	",  "	2 Graedel Junction	",  "	67210	",  "	Wichita	",  "	United States	",  "	California	",  "	316-950-9066	",  "	ahansod1e@github.io	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	52	, "	Jeane	",  "	Bucher	",  "	96 Prentice Place	",  "	85743	",  "	Tucson	",  "	United States	",  "	Kansas	",  "	520-168-8502	",  "	jbucher1f@homestead.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	53	, "	Austina	",  "	Symmons	",  "	585 Mallory Court	",  "	32868	",  "	Orlando	",  "	United States	",  "	Kansas	",  "	407-634-0926	",  "	asymmons1g@dropbox.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	54	, "	Meryl	",  "	Pawelek	",  "	63987 Gateway Road	",  "	21229	",  "	Baltimore	",  "	United States	",  "	California	",  "	443-336-3444	",  "	mpawelek1h@redcross.org	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	55	, "	Carmel	",  "	Stihl	",  "	04663 Everett Alley	",  "	65110	",  "	Jefferson City	",  "	United States	",  "	Kansas	",  "	573-945-9252	",  "	cstihl1i@a8.net	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	56	, "	Filide	",  "	Grazier	",  "	52960 Milwaukee Terrace	",  "	89714	",  "	Carson City	",  "	United States	",  "	Ohio	",  "	775-861-2650	",  "	fgrazier1j@whitehouse.gov	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	57	, "	Augustina	",  "	Issard	",  "	55967 Old Gate Center	",  "	93726	",  "	Fresno	",  "	United States	",  "	Virginia	",  "	559-562-3658	",  "	aissard1k@istockphoto.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	58	, "	Glyn	",  "	Simkiss	",  "	906 Homewood Terrace	",  "	30045	",  "	Lawrenceville	",  "	United States	",  "	Colorado	",  "	404-252-4788	",  "	gsimkiss1l@weather.com	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	59	, "	Nikki	",  "	Zavittieri	",  "	6 Forest Place	",  "	67210	",  "	Wichita	",  "	United States	",  "	Virginia	",  "	316-132-7978	",  "	nzavittieri1m@chron.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	60	, "	Cort	",  "	Oblein	",  "	244 Crowley Trail	",  "	89510	",  "	Reno	",  "	United States	",  "	Kansas	",  "	775-153-6434	",  "	coblein1n@mayoclinic.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	61	, "	Scot	",  "	Brito	",  "	6860 3rd Plaza	",  "	27150	",  "	Winston Salem	",  "	United States	",  "	Kansas	",  "	336-945-8867	",  "	sbrito1o@tuttocitta.it	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	62	, "	Veronique	",  "	Veighey	",  "	6 Kings Pass	",  "	32941	",  "	Melbourne	",  "	United States	",  "	Kentucky	",  "	321-762-0751	",  "	vveighey1p@furl.net	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	63	, "	Leontine	",  "	McGloughlin	",  "	9951 Rusk Crossing	",  "	36177	",  "	Montgomery	",  "	United States	",  "	California	",  "	334-544-0972	",  "	lmcgloughlin1q@desdev.cn	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	64	, "	Renelle	",  "	Aveline	",  "	42743 Division Plaza	",  "	92878	",  "	Corona	",  "	United States	",  "	Mississippi	",  "	951-309-1501	",  "	raveline1r@cyberchimps.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	65	, "	Tamarra	",  "	Stoakley	",  "	62080 Glendale Court	",  "	90010	",  "	Los Angeles	",  "	United States	",  "	Virginia	",  "	949-627-3356	",  "	tstoakley1s@csmonitor.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	66	, "	Leta	",  "	Brinklow	",  "	672 Comanche Alley	",  "	23324	",  "	Chesapeake	",  "	United States	",  "	Kentucky	",  "	757-154-8760	",  "	lbrinklow1t@senate.gov	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	67	, "	Augie	",  "	McLarty	",  "	30226 Knutson Lane	",  "	87105	",  "	Albuquerque	",  "	United States	",  "	Virginia	",  "	505-962-7687	",  "	amclarty1u@lulu.com	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	68	, "	Willis	",  "	Kenningley	",  "	396 Raven Point	",  "	24034	",  "	Roanoke	",  "	United States	",  "	California	",  "	540-480-4771	",  "	wkenningley1v@independent.co.uk	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	69	, "	Allister	",  "	Breslauer	",  "	76 Moose Street	",  "	70187	",  "	New Orleans	",  "	United States	",  "	Tennessee	",  "	504-818-0744	",  "	abreslauer1w@creativecommons.org	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	70	, "	Lilias	",  "	Cicetti	",  "	2359 Badeau Pass	",  "	37131	",  "	Murfreesboro	",  "	United States	",  "	Kentucky	",  "	615-599-6495	",  "	lcicetti1x@google.cn	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	71	, "	Dell	",  "	Basset	",  "	9768 Erie Drive	",  "	11470	",  "	Jamaica	",  "	United States	",  "	California	",  "	212-899-8479	",  "	dbasset1y@rambler.ru	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	72	, "	Betsey	",  "	Longbone	",  "	0 Mandrake Junction	",  "	75799	",  "	Tyler	",  "	United States	",  "	Tennessee	",  "	903-642-1915	",  "	blongbone1z@house.gov	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	73	, "	Dacey	",  "	De Cruce	",  "	22 Susan Terrace	",  "	15286	",  "	Pittsburgh	",  "	United States	",  "	California	",  "	412-202-4209	",  "	ddecruce20@ted.com	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	74	, "	Arlen	",  "	Hilhouse	",  "	0697 Lerdahl Lane	",  "	28235	",  "	Charlotte	",  "	United States	",  "	Kansas	",  "	704-119-6674	",  "	ahilhouse21@cocolog-nifty.com	",  	29	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	75	, "	Edyth	",  "	Davion	",  "	388 International Point	",  "	49518	",  "	Grand Rapids	",  "	United States	",  "	Virginia	",  "	616-181-6373	",  "	edavion22@nba.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	76	, "	Ransom	",  "	Giraudo	",  "	07105 Ridge Oak Terrace	",  "	10705	",  "	Yonkers	",  "	United States	",  "	Virginia	",  "	914-147-4761	",  "	rgiraudo23@yellowpages.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	77	, "	Ardelle	",  "	Bollen	",  "	2857 Hoepker Terrace	",  "	79999	",  "	El Paso	",  "	United States	",  "	California	",  "	915-706-1725	",  "	abollen24@google.co.uk	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	78	, "	Lacie	",  "	Juppe	",  "	526 Ramsey Crossing	",  "	45249	",  "	Cincinnati	",  "	United States	",  "	Virginia	",  "	513-585-2318	",  "	ljuppe25@1688.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	79	, "	Rubi	",  "	Stooders	",  "	6 Melrose Way	",  "	94622	",  "	Oakland	",  "	United States	",  "	California	",  "	510-386-6821	",  "	rstooders26@admin.ch	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	80	, "	Quentin	",  "	Wragge	",  "	8261 Everett Point	",  "	40293	",  "	Louisville	",  "	United States	",  "	Kentucky	",  "	502-505-5347	",  "	qwragge27@usnews.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	81	, "	Davina	",  "	Corryer	",  "	79 Scofield Place	",  "	46202	",  "	Indianapolis	",  "	United States	",  "	Colorado	",  "	317-199-9042	",  "	dcorryer28@mail.ru	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	82	, "	Skye	",  "	Huddleston	",  "	4943 Londonderry Plaza	",  "	16534	",  "	Erie	",  "	United States	",  "	Virginia	",  "	814-194-6740	",  "	shuddleston29@un.org	",  	17	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	83	, "	Audra	",  "	Grady	",  "	3 Thompson Place	",  "	17110	",  "	Harrisburg	",  "	United States	",  "	Mississippi	",  "	717-495-9954	",  "	agrady2a@stanford.edu	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	84	, "	Reagen	",  "	Gilphillan	",  "	8 Dayton Street	",  "	13205	",  "	Syracuse	",  "	United States	",  "	Colorado	",  "	315-252-6681	",  "	rgilphillan2b@cam.ac.uk	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	85	, "	Grier	",  "	Spybey	",  "	114 Arkansas Way	",  "	44105	",  "	Cleveland	",  "	United States	",  "	Ohio	",  "	216-883-8319	",  "	gspybey2c@ifeng.com	",  	94	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	86	, "	Almeta	",  "	Abrahm	",  "	89520 Express Lane	",  "	10131	",  "	New York City	",  "	United States	",  "	Colorado	",  "	212-328-6626	",  "	aabrahm2d@edublogs.org	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	87	, "	Frank	",  "	Newburn	",  "	2 Westport Avenue	",  "	49544	",  "	Grand Rapids	",  "	United States	",  "	California	",  "	616-962-0722	",  "	fnewburn2e@gnu.org	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	88	, "	Rosie	",  "	Vell	",  "	10739 Pleasure Point	",  "	49544	",  "	Grand Rapids	",  "	United States	",  "	Virginia	",  "	616-880-5728	",  "	rvell2f@amazon.de	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	89	, "	Sholom	",  "	Gladtbach	",  "	27089 Valley Edge Trail	",  "	25326	",  "	Charleston	",  "	United States	",  "	Tennessee	",  "	304-560-9613	",  "	sgladtbach2g@facebook.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	90	, "	Zacharia	",  "	Vazquez	",  "	7622 Maple Crossing	",  "	73179	",  "	Oklahoma City	",  "	United States	",  "	Kentucky	",  "	405-588-7848	",  "	zvazquez2h@chicagotribune.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	91	, "	Axe	",  "	Eliesco	",  "	8 Memorial Circle	",  "	23454	",  "	Virginia Beach	",  "	United States	",  "	Virginia	",  "	757-157-7330	",  "	aeliesco2i@reddit.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	92	, "	Xena	",  "	Strangeway	",  "	39 Tony Street	",  "	27499	",  "	Greensboro	",  "	United States	",  "	Tennessee	",  "	336-291-2256	",  "	xstrangeway2j@vistaprint.com	",  	2	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	93	, "	Cristobal	",  "	Werrett	",  "	1228 Mitchell Terrace	",  "	92170	",  "	San Diego	",  "	United States	",  "	California	",  "	619-154-5987	",  "	cwerrett2k@reuters.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	94	, "	Martyn	",  "	Surgen	",  "	1876 Amoth Road	",  "	14652	",  "	Rochester	",  "	United States	",  "	Virginia	",  "	585-808-9612	",  "	msurgen2l@hao123.com	",  	88	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	95	, "	Lyssa	",  "	Lynes	",  "	0312 Melvin Hill	",  "	55458	",  "	Minneapolis	",  "	United States	",  "	Colorado	",  "	612-808-6557	",  "	llynes2m@google.pl	",  	76	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	96	, "	Allianora	",  "	MacKaig	",  "	35 Sommers Point	",  "	33355	",  "	Fort Lauderdale	",  "	United States	",  "	California	",  "	754-566-6328	",  "	amackaig2n@stumbleupon.com	",  	69	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	97	, "	Zechariah	",  "	Roomes	",  "	567 Farragut Plaza	",  "	90005	",  "	Los Angeles	",  "	United States	",  "	Kentucky	",  "	323-952-8848	",  "	zroomes2o@diigo.com	",  	33	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	98	, "	Dona	",  "	Piwell	",  "	24765 Golf View Center	",  "	78759	",  "	Austin	",  "	United States	",  "	California	",  "	512-358-1977	",  "	dpiwell2p@sohu.com	",  	98	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	99	, "	Elfie	",  "	Chaney	",  "	23711 School Parkway	",  "	92640	",  "	Fullerton	",  "	United States	",  "	Mississippi	",  "	714-182-8593	",  "	echaney2q@lycos.com	",  	72	);
insert into customer (id, firstName, lastName, street, postalCode, city, countryId, State, phoneNumber, email, companyId) values (	100	, "	Urbain	",  "	Miskin	",  "	87 Green Ridge Street	",  "	31165	",  "	Atlanta	",  "	United States	",  "	Virginia	",  "	404-729-8826	",  "	umiskin2r@alexa.com	",  	88	);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE invoice (
                         id int NOT NULL AUTO_INCREMENT,
                         invoiceDate date DEFAULT NULL,
                         customerId int NOT NULL,
                         terms varchar(32) NOT NULL,
                         total double DEFAULT NULL,
                         PRIMARY KEY (id),
                         KEY invoice_customer_id_fk (customerId),
                         CONSTRAINT invoice_customer_id_fk FOREIGN KEY (customerId) REFERENCES customer (id)
) ;

-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;

INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (2,'2022-3-4', 77,'Pay in Advance',23569.32);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (1,'2021-9-21', 7,'Due upon receipt',96079.96);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (3,'2021-10-30', 15,'Pay in Advance',83144.6);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (4,'2022-2-18', 99,'Due upon receipt',73178.15);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (5,'2021-5-2', 18,'Pay in Advance',79390.36);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (6,'2021-1-4', 19,'Pay in Advance',25053.19);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (7,'2021-12-14', 45,'Due upon receipt',70201.11);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (8,'2021-7-30', 6,'Due upon receipt',1138.61);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (9,'2021-7-19', 35,'Due upon receipt',56658.83);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (10,'2021-4-14', 21,'Due upon receipt',5512.48);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (11,'2021-10-18', 96,'Due upon receipt',91058.47);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (12,'2021-6-15', 56,'Pay in Advance',14614.64);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (13,'2021-7-26', 67,'Pay in Advance',83708.26);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (14,'2021-10-16', 45,'Due upon receipt',97908.94);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (15,'2021-10-20', 73,'Pay in Advance',59632.28);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (16,'2021-3-17', 66,'Due upon receipt',30723.66);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (17,'2021-3-3', 97,'Pay in Advance',54884.23);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (18,'2021-4-26', 77,'Due upon receipt',53575.3);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (19,'2021-8-8', 66,'Pay in Advance',48372.35);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (20,'2021-9-20', 4,'Pay in Advance',34136.55);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (21,'2021-5-4', 61,'Due upon receipt',42070.72);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (22,'2022-2-5', 42,'Pay in Advance',74028.23);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (23,'2021-10-25', 74,'Pay in Advance',71348.48);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (24,'2021-6-12', 69,'Due upon receipt',92321.36);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (25,'2021-10-8', 69,'Pay in Advance',30396.51);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (26,'2021-1-19', 34,'Due upon receipt',65703.68);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (27,'2022-1-5', 92,'Pay in Advance',13516.33);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (28,'2021-11-4', 32,'Pay in Advance',4902.59);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (29,'2021-6-23', 23,'Pay in Advance',91651.35);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (30,'2021-12-29', 59,'Due upon receipt',88104.54);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (31,'2021-7-9', 10,'Pay in Advance',53322.71);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (32,'2021-3-3', 62,'Due upon receipt',3708.42);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (33,'2021-12-10', 77,'Due upon receipt',75153.45);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (34,'2021-12-26', 16,'Pay in Advance',25736.56);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (35,'2021-5-21', 55,'Pay in Advance',95145.74);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (36,'2022-3-5', 89,'Pay in Advance',32541.7);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (37,'2021-9-22', 24,'Pay in Advance',33884.24);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (38,'2022-2-26', 61,'Pay in Advance',44444.8);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (39,'2021-3-28', 7,'Pay in Advance',47005.94);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (40,'2021-5-2', 68,'Due upon receipt',89850.9);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (41,'2021-9-3', 25,'Due upon receipt',94172.36);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (42,'2022-2-13', 2,'Pay in Advance',40806.49);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (43,'2021-12-17', 17,'Pay in Advance',55625.86);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (44,'2021-6-22', 15,'Due upon receipt',10096.43);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (45,'2021-7-10', 82,'Due upon receipt',94698.17);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (46,'2021-2-9', 17,'Pay in Advance',73745.56);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (47,'2021-9-19', 99,'Pay in Advance',61182.3);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (48,'2021-6-23', 49,'Due upon receipt',39860.63);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (49,'2021-11-12', 21,'Due upon receipt',37035.74);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (50,'2021-5-8', 79,'Pay in Advance',66020.17);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (51,'2021-2-17', 41,'Due upon receipt',38492.41);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (52,'2021-11-28', 59,'Due upon receipt',68629.91);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (53,'2021-6-30', 20,'Due upon receipt',47604.28);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (54,'2021-10-31', 42,'Due upon receipt',7610.31);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (55,'2022-1-7', 34,'Pay in Advance',20330.0);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (56,'2022-2-28', 27,'Pay in Advance',98655.72);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (57,'2021-4-26', 16,'Pay in Advance',69417.78);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (58,'2022-2-23', 81,'Due upon receipt',86462.23);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (59,'2021-9-17', 67,'Pay in Advance',22995.81);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (60,'2021-11-16', 65,'Due upon receipt',43976.35);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (61,'2022-2-3', 50,'Pay in Advance',78309.32);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (62,'2022-1-13', 9,'Pay in Advance',37195.73);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (63,'2021-11-13', 44,'Due upon receipt',46176.67);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (64,'2021-7-11', 14,'Pay in Advance',10924.98);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (65,'2021-6-14', 95,'Pay in Advance',11502.93);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (66,'2022-2-18', 41,'Pay in Advance',89973.76);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (67,'2021-5-10', 87,'Pay in Advance',34971.84);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (68,'2021-5-30', 58,'Pay in Advance',68373.71);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (69,'2021-5-12', 72,'Pay in Advance',11765.21);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (70,'2021-11-2', 61,'Due upon receipt',15722.54);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (71,'2021-10-2', 4,'Pay in Advance',77802.27);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (72,'2022-2-28', 26,'Pay in Advance',4066.44);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (73,'2021-10-31', 28,'Due upon receipt',35097.19);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (74,'2021-4-4', 74,'Pay in Advance',53312.72);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (75,'2021-3-28', 35,'Due upon receipt',83048.75);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (76,'2021-5-17', 30,'Due upon receipt',35633.0);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (77,'2021-10-27', 28,'Pay in Advance',26272.9);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (78,'2021-9-22', 31,'Pay in Advance',6304.61);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (79,'2021-10-5', 10,'Due upon receipt',15715.84);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (80,'2022-3-3', 3,'Due upon receipt',74708.46);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (81,'2021-8-31', 81,'Pay in Advance',65646.94);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (82,'2022-1-12', 53,'Due upon receipt',47609.98);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (83,'2021-3-3', 14,'Due upon receipt',65916.01);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (84,'2021-4-14', 31,'Due upon receipt',3029.37);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (85,'2021-11-28', 29,'Due upon receipt',88141.92);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (86,'2021-10-5', 79,'Due upon receipt',43579.04);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (87,'2021-8-11', 79,'Pay in Advance',3619.45);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (88,'2021-12-11', 27,'Due upon receipt',38478.83);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (89,'2021-5-8', 45,'Due upon receipt',74938.32);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (90,'2021-8-2', 73,'Pay in Advance',98323.86);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (91,'2021-6-27', 53,'Pay in Advance',39924.1);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (92,'2021-7-22', 20,'Due upon receipt',37266.28);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (93,'2021-11-14', 34,'Due upon receipt',47617.27);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (94,'2021-4-29', 88,'Due upon receipt',97774.25);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (95,'2021-11-8', 44,'Due upon receipt',78751.26);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (96,'2022-2-7', 53,'Pay in Advance',47990.28);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (97,'2021-12-28', 42,'Due upon receipt',66985.68);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (98,'2021-8-26', 5,'Pay in Advance',24425.04);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (99,'2021-6-30', 29,'Pay in Advance',9454.24);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (100,'2021-3-9', 53,'Pay in Advance',65748.95);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (101,'2021-3-19', 67,'Pay in Advance',15238.07);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (102,'2022-3-8', 85,'Due upon receipt',11144.72);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (103,'2021-8-27', 47,'Pay in Advance',87086.61);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (104,'2021-12-16', 10,'Due upon receipt',39176.36);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (105,'2021-11-26', 26,'Pay in Advance',13122.7);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (106,'2021-4-5', 73,'Due upon receipt',97190.04);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (107,'2022-1-21', 28,'Due upon receipt',32618.1);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (108,'2022-1-7', 87,'Due upon receipt',37440.75);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (109,'2022-2-17', 21,'Due upon receipt',34853.54);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (110,'2021-10-29', 55,'Due upon receipt',4897.84);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (111,'2021-1-12', 68,'Due upon receipt',7434.28);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (112,'2021-1-1', 73,'Pay in Advance',32073.19);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (113,'2021-4-12', 48,'Due upon receipt',19399.97);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (114,'2021-7-24', 74,'Due upon receipt',74424.58);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (115,'2021-7-3', 70,'Due upon receipt',44476.02);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (116,'2021-1-12', 37,'Pay in Advance',48630.71);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (117,'2021-4-6', 62,'Due upon receipt',94076.07);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (118,'2021-4-4', 46,'Due upon receipt',96319.22);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (119,'2021-8-6', 26,'Pay in Advance',83399.64);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (120,'2022-3-6', 63,'Pay in Advance',77490.11);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (121,'2021-10-22', 46,'Pay in Advance',82028.79);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (122,'2021-11-29', 6,'Due upon receipt',60158.04);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (123,'2021-7-30', 79,'Pay in Advance',26845.31);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (124,'2022-2-23', 44,'Due upon receipt',21497.41);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (125,'2021-3-7', 44,'Due upon receipt',96410.87);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (126,'2021-4-5', 53,'Pay in Advance',87997.52);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (127,'2022-1-1', 37,'Due upon receipt',32297.39);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (128,'2021-11-19', 75,'Due upon receipt',27037.96);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (129,'2021-4-9', 40,'Due upon receipt',51516.78);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (130,'2021-11-13', 16,'Pay in Advance',96665.53);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (131,'2021-6-8', 100,'Pay in Advance',21689.52);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (132,'2021-7-14', 40,'Pay in Advance',94952.67);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (133,'2021-4-23', 57,'Due upon receipt',27586.06);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (134,'2021-9-21', 94,'Pay in Advance',83892.1);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (135,'2021-10-15', 17,'Due upon receipt',41867.11);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (136,'2021-11-4', 1,'Due upon receipt',86157.63);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (137,'2021-8-26', 84,'Due upon receipt',34660.99);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (138,'2021-10-9', 38,'Pay in Advance',24505.39);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (139,'2022-1-10', 48,'Pay in Advance',65341.22);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (140,'2022-1-28', 5,'Pay in Advance',15754.77);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (141,'2021-8-31', 41,'Pay in Advance',39522.08);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (142,'2021-6-3', 9,'Due upon receipt',72879.57);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (143,'2021-8-6', 24,'Due upon receipt',31613.12);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (144,'2021-9-17', 78,'Due upon receipt',42254.44);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (145,'2021-6-29', 67,'Due upon receipt',67746.89);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (146,'2021-12-11', 11,'Due upon receipt',22300.4);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (147,'2022-1-3', 28,'Due upon receipt',64415.57);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (148,'2021-9-18', 13,'Due upon receipt',62986.76);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (149,'2021-6-6', 6,'Pay in Advance',91028.22);
INSERT INTO invoice(id,invoicedate,customerid,terms,total) VALUES (150,'2021-4-13', 61,'Pay in Advance',82483.95);

/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(32) NOT NULL,
                           `price` int NOT NULL,
                           `vat` int NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `Product_id_uindex` (`id`)
);

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO product(id,name,price,vat) VALUES (1,'Removal',239,34);
INSERT INTO product(id,name,price,vat) VALUES (2,'Stump grinding',416,16);
INSERT INTO product(id,name,price,vat) VALUES (3,'Pruning',1917,9);
INSERT INTO product(id,name,price,vat) VALUES (4,'Pruning',1214,60);
INSERT INTO product(id,name,price,vat) VALUES (5,'Removal',2591,98);
INSERT INTO product(id,name,price,vat) VALUES (6,'Pruning',1454,39);
INSERT INTO product(id,name,price,vat) VALUES (7,'Stump grinding',1339,74);
INSERT INTO product(id,name,price,vat) VALUES (8,'Stump grinding',1415,67);
INSERT INTO product(id,name,price,vat) VALUES (9,'Stump grinding',1514,47);
INSERT INTO product(id,name,price,vat) VALUES (10,'Pruning',908,34);
INSERT INTO product(id,name,price,vat) VALUES (11,'Pruning',2118,4);
INSERT INTO product(id,name,price,vat) VALUES (12,'Pruning',2738,86);
INSERT INTO product(id,name,price,vat) VALUES (13,'Stump grinding',1661,94);
INSERT INTO product(id,name,price,vat) VALUES (14,'Removal',1937,80);
INSERT INTO product(id,name,price,vat) VALUES (15,'Removal',1834,52);
INSERT INTO product(id,name,price,vat) VALUES (16,'Removal',911,96);
INSERT INTO product(id,name,price,vat) VALUES (17,'Removal',2186,33);
INSERT INTO product(id,name,price,vat) VALUES (18,'Stump grinding',813,43);
INSERT INTO product(id,name,price,vat) VALUES (19,'Removal',239,74);
INSERT INTO product(id,name,price,vat) VALUES (20,'Stump grinding',1287,28);
INSERT INTO product(id,name,price,vat) VALUES (21,'Stump grinding',2488,29);
INSERT INTO product(id,name,price,vat) VALUES (22,'Removal',2612,5);
INSERT INTO product(id,name,price,vat) VALUES (23,'Stump grinding',797,37);
INSERT INTO product(id,name,price,vat) VALUES (24,'Removal',1256,38);
INSERT INTO product(id,name,price,vat) VALUES (25,'Stump grinding',1356,5);
INSERT INTO product(id,name,price,vat) VALUES (26,'Pruning',1542,81);
INSERT INTO product(id,name,price,vat) VALUES (27,'Stump grinding',1272,69);
INSERT INTO product(id,name,price,vat) VALUES (28,'Pruning',2914,7);
INSERT INTO product(id,name,price,vat) VALUES (29,'Stump grinding',114,90);
INSERT INTO product(id,name,price,vat) VALUES (30,'Pruning',2022,75);
INSERT INTO product(id,name,price,vat) VALUES (31,'Pruning',1666,6);
INSERT INTO product(id,name,price,vat) VALUES (32,'Removal',295,30);
INSERT INTO product(id,name,price,vat) VALUES (33,'Stump grinding',2416,17);
INSERT INTO product(id,name,price,vat) VALUES (34,'Stump grinding',1925,15);
INSERT INTO product(id,name,price,vat) VALUES (35,'Pruning',2731,46);
INSERT INTO product(id,name,price,vat) VALUES (36,'Pruning',1031,61);
INSERT INTO product(id,name,price,vat) VALUES (37,'Removal',451,44);
INSERT INTO product(id,name,price,vat) VALUES (38,'Stump grinding',2067,55);
INSERT INTO product(id,name,price,vat) VALUES (39,'Stump grinding',146,85);
INSERT INTO product(id,name,price,vat) VALUES (40,'Pruning',1540,76);
INSERT INTO product(id,name,price,vat) VALUES (41,'Pruning',1962,23);
INSERT INTO product(id,name,price,vat) VALUES (42,'Removal',525,70);
INSERT INTO product(id,name,price,vat) VALUES (43,'Pruning',2482,61);
INSERT INTO product(id,name,price,vat) VALUES (44,'Stump grinding',2930,87);
INSERT INTO product(id,name,price,vat) VALUES (45,'Stump grinding',2968,56);
INSERT INTO product(id,name,price,vat) VALUES (46,'Pruning',2062,75);
INSERT INTO product(id,name,price,vat) VALUES (47,'Pruning',1743,79);
INSERT INTO product(id,name,price,vat) VALUES (48,'Pruning',1021,49);
INSERT INTO product(id,name,price,vat) VALUES (49,'Removal',2267,70);
INSERT INTO product(id,name,price,vat) VALUES (50,'Stump grinding',242,93);
INSERT INTO product(id,name,price,vat) VALUES (51,'Removal',2168,42);
INSERT INTO product(id,name,price,vat) VALUES (52,'Stump grinding',1824,100);
INSERT INTO product(id,name,price,vat) VALUES (53,'Removal',1089,52);
INSERT INTO product(id,name,price,vat) VALUES (54,'Removal',249,67);
INSERT INTO product(id,name,price,vat) VALUES (55,'Removal',489,89);
INSERT INTO product(id,name,price,vat) VALUES (56,'Stump grinding',1166,51);
INSERT INTO product(id,name,price,vat) VALUES (57,'Pruning',1206,77);
INSERT INTO product(id,name,price,vat) VALUES (58,'Stump grinding',413,87);
INSERT INTO product(id,name,price,vat) VALUES (59,'Pruning',1171,63);
INSERT INTO product(id,name,price,vat) VALUES (60,'Removal',2405,15);
INSERT INTO product(id,name,price,vat) VALUES (61,'Removal',1255,65);
INSERT INTO product(id,name,price,vat) VALUES (62,'Stump grinding',507,29);
INSERT INTO product(id,name,price,vat) VALUES (63,'Removal',772,86);
INSERT INTO product(id,name,price,vat) VALUES (64,'Stump grinding',1930,22);
INSERT INTO product(id,name,price,vat) VALUES (65,'Pruning',1947,12);
INSERT INTO product(id,name,price,vat) VALUES (66,'Pruning',548,44);
INSERT INTO product(id,name,price,vat) VALUES (67,'Stump grinding',548,87);
INSERT INTO product(id,name,price,vat) VALUES (68,'Pruning',2105,9);
INSERT INTO product(id,name,price,vat) VALUES (69,'Pruning',2722,20);
INSERT INTO product(id,name,price,vat) VALUES (70,'Stump grinding',2477,81);
INSERT INTO product(id,name,price,vat) VALUES (71,'Stump grinding',1317,34);
INSERT INTO product(id,name,price,vat) VALUES (72,'Removal',1912,75);
INSERT INTO product(id,name,price,vat) VALUES (73,'Removal',1067,34);
INSERT INTO product(id,name,price,vat) VALUES (74,'Pruning',1669,70);
INSERT INTO product(id,name,price,vat) VALUES (75,'Removal',822,72);
INSERT INTO product(id,name,price,vat) VALUES (76,'Pruning',1121,52);
INSERT INTO product(id,name,price,vat) VALUES (77,'Pruning',256,85);
INSERT INTO product(id,name,price,vat) VALUES (78,'Stump grinding',1315,33);
INSERT INTO product(id,name,price,vat) VALUES (79,'Stump grinding',2112,73);
INSERT INTO product(id,name,price,vat) VALUES (80,'Removal',1569,40);
INSERT INTO product(id,name,price,vat) VALUES (81,'Pruning',1180,80);
INSERT INTO product(id,name,price,vat) VALUES (82,'Pruning',373,49);
INSERT INTO product(id,name,price,vat) VALUES (83,'Removal',815,84);
INSERT INTO product(id,name,price,vat) VALUES (84,'Removal',494,24);
INSERT INTO product(id,name,price,vat) VALUES (85,'Removal',1050,47);
INSERT INTO product(id,name,price,vat) VALUES (86,'Removal',1660,54);
INSERT INTO product(id,name,price,vat) VALUES (87,'Stump grinding',262,88);
INSERT INTO product(id,name,price,vat) VALUES (88,'Pruning',1192,8);
INSERT INTO product(id,name,price,vat) VALUES (89,'Pruning',1727,74);
INSERT INTO product(id,name,price,vat) VALUES (90,'Pruning',1585,30);
INSERT INTO product(id,name,price,vat) VALUES (91,'Stump grinding',152,10);
INSERT INTO product(id,name,price,vat) VALUES (92,'Stump grinding',1405,17);
INSERT INTO product(id,name,price,vat) VALUES (93,'Removal',1520,10);
INSERT INTO product(id,name,price,vat) VALUES (94,'Removal',2880,61);
INSERT INTO product(id,name,price,vat) VALUES (95,'Pruning',2599,39);
INSERT INTO product(id,name,price,vat) VALUES (96,'Removal',2734,34);
INSERT INTO product(id,name,price,vat) VALUES (97,'Pruning',1829,72);
INSERT INTO product(id,name,price,vat) VALUES (98,'Removal',2580,92);
INSERT INTO product(id,name,price,vat) VALUES (99,'Pruning',2521,78);
INSERT INTO product(id,name,price,vat) VALUES (100,'Pruning',2046,97);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `item` int NOT NULL,
                        `productId` int NOT NULL,
                        `invoiceId` int NOT NULL,
                        `quantity` int NOT NULL,
                        `cost` double DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `item_id_uindex` (`id`),
                        KEY `item_invoice_id_fk` (`invoiceId`),
                        KEY `item_product_id_fk` (`productId`),
                        CONSTRAINT `item_invoice_id_fk` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
                        CONSTRAINT `item_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
);

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;

insert into item (id, item, productid, invoiceid, quantity, cost) values (1, 31, '45', '19', 5, 1831);
insert into item (id, item, productid, invoiceid, quantity, cost) values (2, 97, '43', '109', 2, 3807);
insert into item (id, item, productid, invoiceid, quantity, cost) values (3, 11, '99', '35', 9, 8660);
insert into item (id, item, productid, invoiceid, quantity, cost) values (4, 96, '4', '140', 2, 6076);
insert into item (id, item, productid, invoiceid, quantity, cost) values (5, 74, '23', '58', 5, 7986);
insert into item (id, item, productid, invoiceid, quantity, cost) values (6, 74, '39', '36', 3, 7604);
insert into item (id, item, productid, invoiceid, quantity, cost) values (7, 8, '75', '14', 5, 5430);
insert into item (id, item, productid, invoiceid, quantity, cost) values (8, 92, '42', '46', 2, 2251);
insert into item (id, item, productid, invoiceid, quantity, cost) values (9, 76, '40', '108', 6, 9360);
insert into item (id, item, productid, invoiceid, quantity, cost) values (10, 24, '32', '67', 9, 4076);
insert into item (id, item, productid, invoiceid, quantity, cost) values (11, 48, '52', '28', 7, 667);
insert into item (id, item, productid, invoiceid, quantity, cost) values (12, 74, '49', '51', 10, 4382);
insert into item (id, item, productid, invoiceid, quantity, cost) values (13, 86, '21', '70', 2, 5822);
insert into item (id, item, productid, invoiceid, quantity, cost) values (14, 55, '68', '141', 5, 5013);
insert into item (id, item, productid, invoiceid, quantity, cost) values (15, 48, '33', '12', 6, 256);
insert into item (id, item, productid, invoiceid, quantity, cost) values (16, 42, '64', '71', 1, 1320);
insert into item (id, item, productid, invoiceid, quantity, cost) values (17, 51, '84', '134', 6, 8794);
insert into item (id, item, productid, invoiceid, quantity, cost) values (18, 43, '100', '133', 8, 8285);
insert into item (id, item, productid, invoiceid, quantity, cost) values (19, 31, '96', '91', 2, 8000);
insert into item (id, item, productid, invoiceid, quantity, cost) values (20, 52, '60', '34', 9, 6134);
insert into item (id, item, productid, invoiceid, quantity, cost) values (21, 55, '51', '1', 6, 542);
insert into item (id, item, productid, invoiceid, quantity, cost) values (22, 81, '50', '45', 4, 8623);
insert into item (id, item, productid, invoiceid, quantity, cost) values (23, 92, '93', '102', 2, 8495);
insert into item (id, item, productid, invoiceid, quantity, cost) values (24, 17, '58', '116', 9, 3232);
insert into item (id, item, productid, invoiceid, quantity, cost) values (25, 18, '14', '103', 3, 8406);
insert into item (id, item, productid, invoiceid, quantity, cost) values (26, 69, '48', '3', 8, 9347);
insert into item (id, item, productid, invoiceid, quantity, cost) values (27, 40, '18', '92', 8, 2560);
insert into item (id, item, productid, invoiceid, quantity, cost) values (28, 32, '70', '22', 8, 495);
insert into item (id, item, productid, invoiceid, quantity, cost) values (29, 93, '61', '131', 5, 7253);
insert into item (id, item, productid, invoiceid, quantity, cost) values (30, 42, '79', '150', 4, 3969);
insert into item (id, item, productid, invoiceid, quantity, cost) values (31, 39, '55', '38', 3, 2976);
insert into item (id, item, productid, invoiceid, quantity, cost) values (32, 42, '74', '81', 9, 4418);
insert into item (id, item, productid, invoiceid, quantity, cost) values (33, 27, '9', '97', 6, 4822);
insert into item (id, item, productid, invoiceid, quantity, cost) values (34, 87, '88', '89', 2, 5735);
insert into item (id, item, productid, invoiceid, quantity, cost) values (35, 81, '83', '107', 5, 6264);
insert into item (id, item, productid, invoiceid, quantity, cost) values (36, 8, '85', '69', 8, 764);
insert into item (id, item, productid, invoiceid, quantity, cost) values (37, 46, '54', '76', 4, 6746);
insert into item (id, item, productid, invoiceid, quantity, cost) values (38, 50, '62', '49', 3, 1085);
insert into item (id, item, productid, invoiceid, quantity, cost) values (39, 16, '3', '39', 4, 2431);
insert into item (id, item, productid, invoiceid, quantity, cost) values (40, 10, '35', '52', 8, 6230);
insert into item (id, item, productid, invoiceid, quantity, cost) values (41, 28, '86', '65', 5, 473);
insert into item (id, item, productid, invoiceid, quantity, cost) values (42, 86, '10', '79', 8, 5214);
insert into item (id, item, productid, invoiceid, quantity, cost) values (43, 19, '47', '101', 10, 1275);
insert into item (id, item, productid, invoiceid, quantity, cost) values (44, 49, '12', '149', 2, 4595);
insert into item (id, item, productid, invoiceid, quantity, cost) values (45, 88, '63', '4', 7, 2518);
insert into item (id, item, productid, invoiceid, quantity, cost) values (46, 94, '36', '111', 7, 6156);
insert into item (id, item, productid, invoiceid, quantity, cost) values (47, 74, '59', '142', 3, 7396);
insert into item (id, item, productid, invoiceid, quantity, cost) values (48, 68, '44', '119', 8, 4195);
insert into item (id, item, productid, invoiceid, quantity, cost) values (49, 40, '73', '55', 1, 9856);
insert into item (id, item, productid, invoiceid, quantity, cost) values (50, 48, '82', '62', 2, 8371);
insert into item (id, item, productid, invoiceid, quantity, cost) values (51, 11, '91', '25', 6, 1299);
insert into item (id, item, productid, invoiceid, quantity, cost) values (52, 68, '71', '115', 8, 3573);
insert into item (id, item, productid, invoiceid, quantity, cost) values (53, 86, '94', '95', 7, 3471);
insert into item (id, item, productid, invoiceid, quantity, cost) values (54, 26, '98', '135', 5, 8071);
insert into item (id, item, productid, invoiceid, quantity, cost) values (55, 16, '13', '68', 3, 9801);
insert into item (id, item, productid, invoiceid, quantity, cost) values (56, 32, '17', '59', 7, 6120);
insert into item (id, item, productid, invoiceid, quantity, cost) values (57, 21, '20', '90', 6, 413);
insert into item (id, item, productid, invoiceid, quantity, cost) values (58, 56, '77', '80', 10, 1171);
insert into item (id, item, productid, invoiceid, quantity, cost) values (59, 65, '5', '26', 4, 9871);
insert into item (id, item, productid, invoiceid, quantity, cost) values (60, 80, '22', '83', 10, 4186);
insert into item (id, item, productid, invoiceid, quantity, cost) values (61, 82, '2', '85', 8, 3148);
insert into item (id, item, productid, invoiceid, quantity, cost) values (62, 68, '78', '10', 1, 8770);
insert into item (id, item, productid, invoiceid, quantity, cost) values (63, 83, '90', '17', 8, 8853);
insert into item (id, item, productid, invoiceid, quantity, cost) values (64, 25, '19', '56', 4, 9508);
insert into item (id, item, productid, invoiceid, quantity, cost) values (65, 24, '38', '137', 2, 4926);
insert into item (id, item, productid, invoiceid, quantity, cost) values (66, 55, '31', '94', 6, 625);
insert into item (id, item, productid, invoiceid, quantity, cost) values (67, 84, '24', '129', 10, 2603);
insert into item (id, item, productid, invoiceid, quantity, cost) values (68, 13, '53', '54', 2, 6649);
insert into item (id, item, productid, invoiceid, quantity, cost) values (69, 23, '41', '148', 6, 8069);
insert into item (id, item, productid, invoiceid, quantity, cost) values (70, 73, '16', '31', 4, 5412);
insert into item (id, item, productid, invoiceid, quantity, cost) values (71, 46, '66', '13', 3, 5495);
insert into item (id, item, productid, invoiceid, quantity, cost) values (72, 85, '25', '86', 8, 9403);
insert into item (id, item, productid, invoiceid, quantity, cost) values (73, 56, '92', '20', 9, 7469);
insert into item (id, item, productid, invoiceid, quantity, cost) values (74, 3, '7', '50', 10, 5345);
insert into item (id, item, productid, invoiceid, quantity, cost) values (75, 26, '56', '120', 9, 2402);
insert into item (id, item, productid, invoiceid, quantity, cost) values (76, 10, '69', '33', 5, 8953);
insert into item (id, item, productid, invoiceid, quantity, cost) values (77, 36, '76', '143', 10, 4947);
insert into item (id, item, productid, invoiceid, quantity, cost) values (78, 21, '89', '87', 3, 6296);
insert into item (id, item, productid, invoiceid, quantity, cost) values (79, 85, '15', '113', 3, 1294);
insert into item (id, item, productid, invoiceid, quantity, cost) values (80, 47, '27', '6', 5, 6071);
insert into item (id, item, productid, invoiceid, quantity, cost) values (81, 71, '11', '128', 2, 9516);
insert into item (id, item, productid, invoiceid, quantity, cost) values (82, 43, '80', '117', 8, 6811);
insert into item (id, item, productid, invoiceid, quantity, cost) values (83, 27, '97', '125', 1, 9410);
insert into item (id, item, productid, invoiceid, quantity, cost) values (84, 72, '37', '30', 3, 4307);
insert into item (id, item, productid, invoiceid, quantity, cost) values (85, 42, '26', '2', 9, 7831);
insert into item (id, item, productid, invoiceid, quantity, cost) values (86, 87, '28', '99', 9, 3905);
insert into item (id, item, productid, invoiceid, quantity, cost) values (87, 18, '57', '75', 4, 121);
insert into item (id, item, productid, invoiceid, quantity, cost) values (88, 67, '34', '15', 5, 9450);
insert into item (id, item, productid, invoiceid, quantity, cost) values (89, 92, '67', '104', 6, 3405);
insert into item (id, item, productid, invoiceid, quantity, cost) values (90, 24, '6', '139', 2, 2297);
insert into item (id, item, productid, invoiceid, quantity, cost) values (91, 2, '65', '47', 3, 3840);
insert into item (id, item, productid, invoiceid, quantity, cost) values (92, 15, '30', '61', 10, 2419);
insert into item (id, item, productid, invoiceid, quantity, cost) values (93, 63, '81', '147', 10, 5545);
insert into item (id, item, productid, invoiceid, quantity, cost) values (94, 98, '46', '72', 5, 358);
insert into item (id, item, productid, invoiceid, quantity, cost) values (95, 48, '72', '124', 2, 4049);
insert into item (id, item, productid, invoiceid, quantity, cost) values (96, 88, '8', '60', 2, 5546);
insert into item (id, item, productid, invoiceid, quantity, cost) values (97, 18, '1', '9', 3, 1012);
insert into item (id, item, productid, invoiceid, quantity, cost) values (98, 34, '95', '121', 2, 7321);
insert into item (id, item, productid, invoiceid, quantity, cost) values (99, 29, '29', '40', 9, 8808);
insert into item (id, item, productid, invoiceid, quantity, cost) values (100, 51, '60', '7', 9, 8507);
insert into item (id, item, productid, invoiceid, quantity, cost) values (101, 66, '82', '112', 9, 7051);
insert into item (id, item, productid, invoiceid, quantity, cost) values (102, 57, '50', '44', 6, 2053);
insert into item (id, item, productid, invoiceid, quantity, cost) values (103, 3, '9', '84', 6, 4949);
insert into item (id, item, productid, invoiceid, quantity, cost) values (104, 16, '72', '130', 4, 7973);
insert into item (id, item, productid, invoiceid, quantity, cost) values (105, 94, '96', '132', 4, 8598);
insert into item (id, item, productid, invoiceid, quantity, cost) values (106, 85, '21', '29', 6, 7005);
insert into item (id, item, productid, invoiceid, quantity, cost) values (107, 62, '8', '48', 7, 5440);
insert into item (id, item, productid, invoiceid, quantity, cost) values (108, 27, '53', '5', 1, 8171);
insert into item (id, item, productid, invoiceid, quantity, cost) values (109, 69, '70', '123', 5, 536);
insert into item (id, item, productid, invoiceid, quantity, cost) values (110, 96, '7', '32', 5, 4067);
insert into item (id, item, productid, invoiceid, quantity, cost) values (111, 38, '6', '127', 6, 6345);
insert into item (id, item, productid, invoiceid, quantity, cost) values (112, 90, '23', '126', 3, 6469);
insert into item (id, item, productid, invoiceid, quantity, cost) values (113, 25, '25', '18', 5, 2409);
insert into item (id, item, productid, invoiceid, quantity, cost) values (114, 98, '18', '74', 9, 4850);
insert into item (id, item, productid, invoiceid, quantity, cost) values (115, 6, '95', '27', 6, 379);
insert into item (id, item, productid, invoiceid, quantity, cost) values (116, 71, '2', '8', 9, 6802);
insert into item (id, item, productid, invoiceid, quantity, cost) values (117, 46, '89', '53', 4, 7910);
insert into item (id, item, productid, invoiceid, quantity, cost) values (118, 3, '13', '77', 8, 3189);
insert into item (id, item, productid, invoiceid, quantity, cost) values (119, 42, '88', '42', 7, 7457);
insert into item (id, item, productid, invoiceid, quantity, cost) values (120, 75, '4', '105', 8, 518);
insert into item (id, item, productid, invoiceid, quantity, cost) values (121, 69, '83', '23', 9, 1751);
insert into item (id, item, productid, invoiceid, quantity, cost) values (122, 55, '85', '63', 9, 2690);
insert into item (id, item, productid, invoiceid, quantity, cost) values (123, 84, '54', '110', 10, 8874);
insert into item (id, item, productid, invoiceid, quantity, cost) values (124, 29, '30', '24', 1, 9108);
insert into item (id, item, productid, invoiceid, quantity, cost) values (125, 46, '43', '138', 7, 1400);
insert into item (id, item, productid, invoiceid, quantity, cost) values (126, 18, '100', '144', 4, 2548);
insert into item (id, item, productid, invoiceid, quantity, cost) values (127, 80, '79', '57', 9, 6810);
insert into item (id, item, productid, invoiceid, quantity, cost) values (128, 73, '80', '122', 8, 9874);
insert into item (id, item, productid, invoiceid, quantity, cost) values (129, 19, '37', '37', 9, 3825);
insert into item (id, item, productid, invoiceid, quantity, cost) values (130, 8, '86', '114', 2, 8422);
insert into item (id, item, productid, invoiceid, quantity, cost) values (131, 21, '34', '82', 1, 1796);
insert into item (id, item, productid, invoiceid, quantity, cost) values (132, 40, '12', '136', 10, 6155);
insert into item (id, item, productid, invoiceid, quantity, cost) values (133, 15, '40', '78', 3, 7851);
insert into item (id, item, productid, invoiceid, quantity, cost) values (134, 30, '31', '64', 10, 3798);
insert into item (id, item, productid, invoiceid, quantity, cost) values (135, 65, '68', '118', 4, 9848);
insert into item (id, item, productid, invoiceid, quantity, cost) values (136, 55, '61', '145', 5, 195);
insert into item (id, item, productid, invoiceid, quantity, cost) values (137, 32, '76', '106', 10, 7719);
insert into item (id, item, productid, invoiceid, quantity, cost) values (138, 97, '48', '96', 3, 1090);
insert into item (id, item, productid, invoiceid, quantity, cost) values (139, 94, '55', '100', 1, 8038);
insert into item (id, item, productid, invoiceid, quantity, cost) values (140, 59, '73', '43', 7, 7421);
insert into item (id, item, productid, invoiceid, quantity, cost) values (141, 42, '29', '88', 10, 5871);
insert into item (id, item, productid, invoiceid, quantity, cost) values (142, 64, '67', '73', 5, 9572);
insert into item (id, item, productid, invoiceid, quantity, cost) values (143, 57, '59', '16', 6, 9473);
insert into item (id, item, productid, invoiceid, quantity, cost) values (144, 55, '33', '25', 2, 2545);
insert into item (id, item, productid, invoiceid, quantity, cost) values (145, 52, '57', '108', 3, 2282);
insert into item (id, item, productid, invoiceid, quantity, cost) values (146, 89, '17', '4', 6, 7553);
insert into item (id, item, productid, invoiceid, quantity, cost) values (147, 78, '42', '89', 6, 1664);
insert into item (id, item, productid, invoiceid, quantity, cost) values (148, 54, '65', '83', 2, 7123);
insert into item (id, item, productid, invoiceid, quantity, cost) values (149, 56, '3', '53', 3, 2296);
insert into item (id, item, productid, invoiceid, quantity, cost) values (150, 13, '32', '119', 1, 7619);


/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
--


--

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `userName` varchar(32) NOT NULL,
                        `password` varchar(32) NOT NULL,
                        `firstName` varchar(32) NOT NULL,
                        `lastName` varchar(32) NOT NULL,
                        `companyId` int NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `user_userName_uindex` (`userName`),
                        KEY `user_company_id_fk` (`companyId`),
                        CONSTRAINT `user_company_id_fk` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE
);

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (1,'pvernall0','etVQ8zU','Powell','Vernall',33);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (2,'mpaynton1','6a0hH4DZOtEk','Mohammed','Paynton',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (3,'htrow2','okD4Ft9GoCGv','Haroun','Trow',72);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (4,'aharlick3','zr1npsUHLFiI','Amery','Harlick',29);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (5,'srains4','WWm9R8yA','Seumas','Rains',17);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (6,'nribey5','DI1t341QSbm','Nobe','Ribey',72);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (7,'cbrigdale6','JZ8koCUBW','Colver','Brigdale',76);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (8,'spollins7','nhWDTtsAkxbO','Stacy','Pollins',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (9,'wnarraway8','VwLMNe','Worthington','Narraway',29);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (10,'psea9','5XqeaxjfaU','Pincas','Sea',29);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (11,'olindenmana','DQUqZ3qHE','Owen','Lindenman',69);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (12,'kbeardonb','3iqS4xE5I','Kinnie','Beardon',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (13,'asieurc','Ioc9tOq','Artie','Sieur',17);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (14,'fopdenortd','qk4eNFt0hFcZ','Fields','Opdenort',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (15,'dstillye','CschuSGm','Duffie','Stilly',98);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (16,'mlinckf','9yvsJtWiOD8','Massimiliano','Linck',17);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (17,'bmellodeyg','XptxE0h','Barnebas','Mellodey',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (18,'smerkelh','sZzQAEKBQm','Siegfried','Merkel',69);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (19,'bbucknilli','zDwXzhtdfozs','Burnaby','Bucknill',33);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (20,'mmcreathj','NYKD9clnYT','Morton','McReath',72);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (21,'mcastagnarok','ZdZQB7jo','Moore','Castagnaro',88);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (22,'wwetheraldl','LcxHfC','Wilt','Wetherald',76);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (23,'amccreem','QoKcewsCJej','Art','McCree',33);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (24,'csweetmoren','4Bzfa6y0PLgB','Cad','Sweetmore',2);
INSERT INTO user(id,username,password,firstName,lastName,companyId) VALUES (25,'mhoulridgeo','AhPnCiV3g8','Marlow','Houlridge',17);


/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `userName` varchar(32) NOT NULL,
                             `role_name` varchar(32) NOT NULL,
                             `userId` int NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `user_role_user_id_fk` (`userId`),
                             CONSTRAINT `user_role_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
);

--
-- Dumping data for table `user_role`
--


insert into user_role (id, username, role_name, userid) values (1, 'pvernall0', 'basic', '1');
insert into user_role (id, username, role_name, userid) values (2, 'mpaynton1', 'admin', '2');
insert into user_role (id, username, role_name, userid) values (3, 'htrow2', 'basic', '3');
insert into user_role (id, username, role_name, userid) values (4, 'aharlick3', 'basic', '4');
insert into user_role (id, username, role_name, userid) values (5, 'srains4', 'admin', '5');
insert into user_role (id, username, role_name, userid) values (6, 'nribey5', 'basic', '6');
insert into user_role (id, username, role_name, userid) values (7, 'cbrigdale6', 'basic', '7');
insert into user_role (id, username, role_name, userid) values (8, 'spollins7', 'admin', '8');
insert into user_role (id, username, role_name, userid) values (9, 'wnarraway8', 'basic', '9');
insert into user_role (id, username, role_name, userid) values (10, 'psea9', 'basic', '10');
insert into user_role (id, username, role_name, userid) values (11, 'olindenmana', 'basic', '11');
insert into user_role (id, username, role_name, userid) values (12, 'kbeardonb', 'basic', '12');
insert into user_role (id, username, role_name, userid) values (13, 'asieurc', 'basic', '13');
insert into user_role (id, username, role_name, userid) values (14, 'fopdenortd', 'basic', '14');
insert into user_role (id, username, role_name, userid) values (15, 'dstillye', 'basic', '15');
insert into user_role (id, username, role_name, userid) values (16, 'mlinckf', 'admin', '16');
insert into user_role (id, username, role_name, userid) values (17, 'bmellodeyg', 'basic', '17');
insert into user_role (id, username, role_name, userid) values (18, 'smerkelh', 'admin', '18');
insert into user_role (id, username, role_name, userid) values (19, 'bbucknilli', 'admin', '19');
insert into user_role (id, username, role_name, userid) values (20, 'mmcreathj', 'admin', '20');
insert into user_role (id, username, role_name, userid) values (21, 'mcastagnarok', 'basic', '21');
insert into user_role (id, username, role_name, userid) values (22, 'wwetheraldl', 'basic', '22');
insert into user_role (id, username, role_name, userid) values (23, 'amccreem', 'admin', '23');
insert into user_role (id, username, role_name, userid) values (24, 'csweetmoren', 'admin', '24');
insert into user_role (id, username, role_name, userid) values (25, 'mhoulridgeo', 'admin', '25');


/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2020-04-26 20:45:02

