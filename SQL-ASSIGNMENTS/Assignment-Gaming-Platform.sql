CREATE DATABASE GAMING_PLATFORM
USE GAMING_PLATFORM

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    registration_date DATE DEFAULT CAST(GETDATE() AS DATE),
    level INT DEFAULT 1 CHECK (level >= 1),
    coins INT DEFAULT 0 CHECK (coins >= 0),
    status VARCHAR(20) 
        CHECK (status IN ('Active','Banned','Inactive')))

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL UNIQUE,
    genre VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL,
    developer VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 1.0 AND 5.0),
    price DECIMAL(8,2) DEFAULT 0.00 CHECK (price >= 0),
    downloads INT DEFAULT 0 CHECK (downloads >= 0))

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    match_date DATETIME DEFAULT GETDATE(),
    score INT NOT NULL CHECK (score >= 0),
    duration_min INT NOT NULL CHECK (duration_min > 0),
    result VARCHAR(10) CHECK (result IN ('Win','Loss','Draw')),
    mode VARCHAR(20) CHECK (mode IN ('Solo','Duo','Squad','Team')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id))

CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL,
    game_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    prize_pool DECIMAL(10,2) NOT NULL CHECK (prize_pool > 0),
    winner_id INT NULL,
    status VARCHAR(20) 
        CHECK (status IN ('Upcoming','Ongoing','Completed')),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (winner_id) REFERENCES players(player_id))

CREATE TABLE achievements (
    achievement_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    achievement_name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    earned_date DATE DEFAULT CAST(GETDATE() AS DATE),
    rarity VARCHAR(20) 
        CHECK (rarity IN ('Common','Rare','Epic','Legendary')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id))

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    item_name VARCHAR(100) NOT NULL,
    amount DECIMAL(8,2) NOT NULL CHECK (amount > 0),
    purchase_date DATETIME DEFAULT GETDATE(),
    payment_method VARCHAR(20) 
        CHECK (payment_method IN ('Card','UPI','Wallet','PayPal')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id))


    
INSERT INTO players (player_id, username, email, full_name, country, registration_date, level, coins, status) VALUES
(1,  'ProGamer123',    'progamer123@gmail.com',      'Aarav Sharma',      'India',    '2021-03-15', 45,  12500, 'Active'),
(2,  'NinjaKiller',    'ninjakiller@yahoo.com',      'Rohan Verma',       'India',    '2021-06-20', 38,  9800,  'Active'),
(3,  'LegendSlayer',   'legendslayer@gmail.com',     'Priya Mehta',       'India',    '2021-09-10', 52,  18400, 'Active'),
(4,  'DragonMaster',   'dragonmaster@hotmail.com',   'Vikram Singh',      'India',    '2022-01-05', 41,  11200, 'Active'),
(5,  'ShadowHunter',   'shadowhunter@gmail.com',     'Ananya Iyer',       'India',    '2022-03-18', 29,  6500,  'Active'),
(6,  'BlazeKing',      'blazeking@outlook.com',      'Karan Kapoor',      'India',    '2022-05-22', 35,  8900,  'Active'),
(7,  'StormRider',     'stormrider@gmail.com',       'Divya Nair',        'India',    '2022-08-14', 48,  15300, 'Active'),
(8,  'PhantomStrike',  'phantomstrike@yahoo.com',    'Rahul Desai',       'India',    '2022-10-03', 33,  7400,  'Active'),
(9,  'ThunderBolt',    'thunderbolt@gmail.com',      'Sneha Patel',       'India',    '2022-12-11', 27,  5200,  'Active'),
(10, 'IronFist',       'ironfist@gmail.com',         'Arjun Reddy',       'India',    '2023-02-08', 50,  17600, 'Active'),
(11, 'WolfPack',       'wolfpack@gmail.com',         'James Carter',      'USA',      '2023-04-15', 44,  13100, 'Active'),
(12, 'VenomStrike',    'venomstrike@yahoo.com',      'Emily Watson',      'USA',      '2023-06-20', 39,  10500, 'Active'),
(13, 'TitanSlayer',    'titanslayer@gmail.com',      'Ahmed Al-Rashid',   'UAE',      '2023-08-05', 31,  7100,  'Active'),
(14, 'GhostRider',     'ghostrider@outlook.com',     'Sarah Johnson',     'UK',       '2023-09-12', 36,  9200,  'Active'),
(15, 'FireFox',        'firefox@gmail.com',          'Siddharth Joshi',   'India',    '2023-10-18', 42,  12800, 'Active'),
(16, 'NoobPlayer',     'noobplayer@gmail.com',       'Nisha Agarwal',     'India',    '2020-05-10',  3,  150,   'Inactive'),
(17, 'CyberNinja',     'cyberninja@yahoo.com',       'Riya Malhotra',     'India',    '2023-11-25', 26,  4800,  'Active'),
(18, 'VortexKing',     'vortexking@gmail.com',       'Suresh Babu',       'India',    '2024-01-08', 22,  3500,  'Active'),
(19, 'ApexPredator',   'apexpredator@hotmail.com',   'Kavitha Menon',     'India',    '2024-02-14', 19,  2400,  'Active'),
(20, 'SilverBullet',   'silverbullet@gmail.com',     'Pooja Gupta',       'India',    '2024-03-05', 15,  1800,  'Active'),
(21, 'HackerPro',      'hackerpro@gmail.com',        'John Smith',        'USA',      '2022-07-20', 40,  11000, 'Banned'),
(22, 'EliteSniper',    'elitesniper@yahoo.com',      'Michael Brown',     'USA',      '2023-05-10', 37,  9500,  'Active'),
(23, 'MysticWarrior',  'mysticwarrior@gmail.com',    'Lakshmi Rao',       'India',    '2023-12-02', 24,  4200,  'Active'),
(24, 'AlphaWolf',      'alphawolf@outlook.com',      'David Lee',         'Australia','2024-01-20', 18,  2200,  'Active'),
(25, 'InactiveUser',   'inactiveuser@gmail.com',     'Amit Trivedi',      'India',    '2020-02-15',  2,  50,    'Inactive');



INSERT INTO games (game_id, game_name, genre, release_date, developer, rating, price, downloads) VALUES
(1,  'Battleground Elite',     'Action',     '2020-05-15', 'Epic Studios',      4.5, 0.00,    5000000),
(2,  'Legends Arena',           'MOBA',       '2019-08-20', 'Riot Games',        4.7, 0.00,    8000000),
(3,  'War Strategy Pro',        'Strategy',   '2021-03-10', 'Paradox Interactive', 4.3, 799.00,  1200000),
(4,  'Fantasy Quest',           'RPG',        '2020-11-25', 'CD Projekt',        4.8, 1499.00, 3500000),
(5,  'Speed Racer X',           'Racing',     '2021-06-18', 'Electronic Arts',   4.2, 599.00,  2000000),
(6,  'Zombie Survival',         'Horror',     '2019-10-31', 'Capcom',            4.4, 899.00,  2800000),
(7,  'Cricket Champion',        'Sports',     '2022-04-01', 'Big Ant Studios',   4.0, 399.00,  1500000),
(8,  'Chess Grandmaster',       'Board Game', '2018-07-14', 'Chess.com',         4.6, 0.00,    4500000),
(9,  'Space Invaders HD',       'Arcade',     '2020-09-05', 'Atari',             3.9, 199.00,  800000),
(10, 'City Builder Deluxe',     'Simulation', '2021-01-20', 'Colossal Order',    4.5, 999.00,  1800000),
(11, 'Puzzle Master 2023',      'Puzzle',     '2023-02-14', 'King Games',        4.3, 0.00,    6000000),
(12, 'Ninja Warrior',           'Action',     '2022-08-10', 'Ubisoft',           4.4, 1299.00, 2200000),
(13, 'Galactic Wars',           'Sci-Fi',     '2020-12-01', 'Bungie',            4.6, 1999.00, 3000000),
(14, 'Farm Tycoon',             'Simulation', '2021-05-30', 'Zynga',             3.8, 0.00,    3200000),
(15, 'Hero Legends',            'RPG',        '2023-07-22', 'Square Enix',       4.7, 1799.00, 2500000);



INSERT INTO matches (match_id, player_id, game_id, match_date, score, duration_min, result, mode) VALUES
(1,  1,  1,  '2024-01-05 14:30:00', 2450, 35, 'Win',  'Squad'),
(2,  1,  2,  '2024-01-08 18:00:00', 1820, 42, 'Win',  'Team'),
(3,  2,  1,  '2024-01-10 20:15:00', 1950, 38, 'Loss', 'Squad'),
(4,  3,  4,  '2024-01-12 19:00:00', 3800, 120,'Win',  'Solo'),
(5,  3,  2,  '2024-01-15 21:30:00', 2100, 45, 'Win',  'Team'),
(6,  4,  3,  '2024-01-18 16:00:00', 1500, 90, 'Draw', 'Solo'),
(7,  5,  6,  '2024-01-20 22:00:00', 980,  55, 'Loss', 'Duo'),
(8,  6,  1,  '2024-01-22 15:45:00', 2200, 40, 'Win',  'Squad'),
(9,  7,  4,  '2024-01-25 17:30:00', 4200, 110,'Win',  'Solo'),
(10, 8,  5,  '2024-01-28 19:00:00', 1650, 25, 'Loss', 'Solo'),
(11, 9,  2,  '2024-02-01 20:00:00', 1400, 38, 'Loss', 'Team'),
(12, 10, 1,  '2024-02-03 14:00:00', 2800, 42, 'Win',  'Squad'),
(13, 10, 4,  '2024-02-05 18:30:00', 3950, 115,'Win',  'Solo'),
(14, 11, 13, '2024-02-08 21:00:00', 3200, 75, 'Win',  'Solo'),
(15, 12, 2,  '2024-02-10 19:30:00', 2300, 48, 'Win',  'Team'),
(16, 13, 1,  '2024-02-12 16:00:00', 2050, 36, 'Win',  'Squad'),
(17, 14, 6,  '2024-02-15 22:30:00', 1100, 60, 'Loss', 'Duo'),
(18, 15, 3,  '2024-02-18 17:00:00', 1700, 85, 'Draw', 'Solo'),
(19, 1,  12, '2024-02-20 20:00:00', 2900, 50, 'Win',  'Solo'),
(20, 2,  4,  '2024-02-22 19:00:00', 3600, 105,'Win',  'Solo'),
(21, 3,  1,  '2024-02-25 15:30:00', 2650, 44, 'Win',  'Squad'),
(22, 5,  8,  '2024-02-28 18:00:00', 850,  30, 'Draw', 'Solo'),
(23, 7,  2,  '2024-03-01 21:00:00', 2400, 50, 'Win',  'Team'),
(24, 10, 13, '2024-03-03 20:00:00', 3500, 70, 'Win',  'Solo'),
(25, 11, 1,  '2024-03-05 16:30:00', 2150, 39, 'Win',  'Squad'),
(26, 12, 4,  '2024-03-08 19:30:00', 3750, 108,'Win',  'Solo'),
(27, 15, 6,  '2024-03-10 22:00:00', 1250, 58, 'Loss', 'Duo'),
(28, 17, 2,  '2024-03-12 20:30:00', 1600, 40, 'Loss', 'Team'),
(29, 18, 1,  '2024-03-15 17:00:00', 1850, 35, 'Loss', 'Squad'),
(30, 19, 5,  '2024-03-18 19:00:00', 1450, 22, 'Loss', 'Solo'),
(31, 20, 11, '2024-03-20 18:00:00', 650,  20, 'Loss', 'Solo'),
(32, 22, 1,  '2024-03-22 15:00:00', 2550, 41, 'Win',  'Squad'),
(33, 23, 2,  '2024-03-24 20:00:00', 1750, 43, 'Loss', 'Team'),
(34, 1,  13, '2024-03-26 21:00:00', 3400, 72, 'Win',  'Solo'),
(35, 3,  12, '2024-03-28 19:00:00', 3100, 55, 'Win',  'Solo'),
(36, 6,  4,  '2024-03-30 18:00:00', 3850, 112,'Win',  'Solo'),
(37, 7,  1,  '2024-04-01 16:00:00', 2750, 43, 'Win',  'Squad'),
(38, 10, 2,  '2024-04-03 20:30:00', 2500, 47, 'Win',  'Team'),
(39, 11, 4,  '2024-04-05 19:30:00', 4000, 118,'Win',  'Solo'),
(40, 15, 1,  '2024-04-08 17:30:00', 2350, 38, 'Win',  'Squad');


INSERT INTO tournaments (tournament_id, tournament_name, game_id, start_date, end_date, prize_pool, winner_id, status) VALUES
(1,  'Battleground World Cup 2023',    1,  '2023-12-01', '2023-12-15', 500000.00, 10, 'Completed'),
(2,  'Legends Arena Championship',     2,  '2024-01-10', '2024-01-25', 750000.00,  3, 'Completed'),
(3,  'Fantasy Quest Masters',          4,  '2024-02-05', '2024-02-20', 1000000.00, 7, 'Completed'),
(4,  'Galactic Wars Invitational',     13, '2024-03-01', '2024-03-15', 800000.00, 11, 'Completed'),
(5,  'Speed Racer X Grand Prix',       5,  '2024-03-20', '2024-03-28', 300000.00,  1, 'Completed'),
(6,  'War Strategy Elite League',      3,  '2024-04-01', '2024-04-30', 400000.00, NULL, 'Ongoing'),
(7,  'Ninja Warrior Pro Series',       12, '2024-04-10', '2024-04-25', 600000.00, NULL, 'Ongoing'),
(8,  'Cricket Champion IPL',           7,  '2024-05-01', '2024-05-31', 350000.00, NULL, 'Upcoming'),
(9,  'Hero Legends World Finals',      15, '2024-06-01', '2024-06-15', 1200000.00, NULL, 'Upcoming'),
(10, 'Battleground Asia Cup',          1,  '2024-07-01', '2024-07-20', 450000.00, NULL, 'Upcoming');



INSERT INTO achievements (achievement_id, player_id, game_id, achievement_name, description, earned_date, rarity) VALUES
(1,  1,  1,  'First Blood',           'Get your first kill',                    '2024-01-05', 'Common'),
(2,  1,  1,  'Victory Royale',        'Win your first match',                   '2024-01-05', 'Rare'),
(3,  1,  2,  'Pentakill Master',      'Eliminate 5 enemies in one match',      '2024-01-08', 'Epic'),
(4,  3,  4,  'Dragon Slayer',         'Defeat the ancient dragon',             '2024-01-12', 'Legendary'),
(5,  3,  2,  'Team Player',           'Win 10 team matches',                    '2024-01-15', 'Rare'),
(6,  7,  4,  'Legendary Hero',        'Complete the main storyline',           '2024-01-25', 'Legendary'),
(7,  10, 1,  'Sharpshooter',          'Achieve 90% accuracy',                   '2024-02-03', 'Epic'),
(8,  10, 4,  'Treasure Hunter',       'Find all hidden treasures',             '2024-02-05', 'Rare'),
(9,  10, 13, 'Galactic Commander',    'Win 5 space battles',                    '2024-02-08', 'Epic'),
(10, 11, 13, 'Space Ace',             'Complete all missions',                  '2024-02-08', 'Legendary'),
(11, 12, 2,  'Support Hero',          'Assist teammates 100 times',            '2024-02-10', 'Rare'),
(12, 1,  12, 'Stealth Master',        'Complete 10 missions undetected',       '2024-02-20', 'Epic'),
(13, 2,  4,  'Quest Completionist',   'Finish all side quests',                '2024-02-22', 'Legendary'),
(14, 3,  1,  'Survival Expert',       'Survive for 30 minutes',                '2024-02-25', 'Rare'),
(15, 6,  4,  'Master of Magic',       'Learn all spells',                      '2024-03-30', 'Epic'),
(16, 7,  1,  'Squad Leader',          'Lead your team to 20 victories',        '2024-04-01', 'Epic'),
(17, 11, 1,  'Demolition Expert',     'Destroy 50 vehicles',                   '2024-03-05', 'Rare'),
(18, 11, 4,  'Champion of the Realm', 'Defeat all bosses',                     '2024-04-05', 'Legendary'),
(19, 15, 6,  'Zombie Killer',         'Eliminate 1000 zombies',                '2024-03-10', 'Epic'),
(20, 1,  13, 'Star Pilot',            'Win 10 galactic races',                 '2024-03-26', 'Rare'),
(21, 3,  12, 'Shadow Assassin',       'Complete all assassination contracts',  '2024-03-28', 'Legendary'),
(22, 5,  8,  'Chess Grandmaster',     'Win 50 chess matches',                  '2024-02-28', 'Rare'),
(23, 7,  2,  'MVP Champion',          'Win MVP award 5 times',                 '2024-03-01', 'Epic'),
(24, 10, 2,  'Tactician',             'Execute perfect strategies 20 times',   '2024-04-03', 'Epic'),
(25, 12, 4,  'Artifact Collector',    'Collect all legendary artifacts',       '2024-03-08', 'Legendary'),
(26, 15, 1,  'Survivor',              'Win with last man standing',            '2024-04-08', 'Rare'),
(27, 6,  1,  'Winning Streak',        'Win 5 matches consecutively',           '2024-01-22', 'Epic'),
(28, 8,  5,  'Speed Demon',           'Complete race under 2 minutes',         '2024-01-28', 'Rare'),
(29, 13, 1,  'Grenade Master',        'Eliminate 10 enemies with grenades',   '2024-02-12', 'Rare'),
(30, 22, 1,  'Headshot King',         'Achieve 100 headshots',                 '2024-03-22', 'Epic');



INSERT INTO purchases (purchase_id, player_id, game_id, item_name, amount, purchase_date, payment_method) VALUES
(1,  1,  1,  'Battle Pass Season 5',       499.00,  '2024-01-10 10:00:00', 'UPI'),
(2,  1,  4,  'Legendary Sword Pack',       1299.00, '2024-01-15 14:30:00', 'Card'),
(3,  3,  2,  'Champion Skin Bundle',       799.00,  '2024-01-20 18:00:00', 'UPI'),
(4,  3,  4,  'Dragon Mount DLC',           1999.00, '2024-02-01 11:00:00', 'Card'),
(5,  7,  4,  'Ultimate Weapon Pack',       2499.00, '2024-02-08 16:00:00', 'Card'),
(6,  10, 1,  'Elite Sniper Skin',          599.00,  '2024-02-15 19:00:00', 'UPI'),
(7,  10, 13, 'Spaceship Upgrade',          1499.00, '2024-02-20 20:30:00', 'Wallet'),
(8,  11, 1,  'Tactical Gear Set',          899.00,  '2024-02-25 15:00:00', 'Card'),
(9,  11, 13, 'Galactic Expansion Pack',    1799.00, '2024-03-01 17:00:00', 'Card'),
(10, 12, 2,  'Hero Collection',            999.00,  '2024-03-05 12:00:00', 'UPI'),
(11, 12, 4,  'Magic Spell Book',           1199.00, '2024-03-10 14:00:00', 'PayPal'),
(12, 15, 1,  'Legendary Outfit',           699.00,  '2024-03-12 18:30:00', 'UPI'),
(13, 15, 6,  'Survival Kit Pro',           499.00,  '2024-03-15 20:00:00', 'Card'),
(14, 1,  12, 'Ninja Costume Pack',         899.00,  '2024-03-18 16:00:00', 'UPI'),
(15, 2,  4,  'Artifact Bundle',            1599.00, '2024-03-20 19:00:00', 'Card'),
(16, 6,  4,  'Enchanted Armor Set',        1899.00, '2024-03-22 11:00:00', 'Card'),
(17, 7,  1,  'Elite Battle Pass',          799.00,  '2024-03-25 17:30:00', 'UPI'),
(18, 3,  12, 'Shadow Assassin Bundle',     1399.00, '2024-03-28 15:00:00', 'Wallet'),
(19, 10, 4,  'Legendary Mount Pack',       2199.00, '2024-04-01 13:00:00', 'Card'),
(20, 11, 4,  'Ultimate Power Boost',       999.00,  '2024-04-05 18:00:00', 'UPI'),
(21, 13, 1,  'Weapon Skin Collection',     599.00,  '2024-02-18 16:00:00', 'UPI'),
(22, 17, 2,  'Champion Emote Pack',        299.00,  '2024-03-14 19:00:00', 'Wallet'),
(23, 22, 1,  'Pro Player Bundle',          1499.00, '2024-03-26 14:00:00', 'Card'),
(24, 5,  6,  'Zombie Apocalypse DLC',      799.00,  '2024-02-05 21:00:00', 'UPI'),
(25, 14, 6,  'Horror Survival Pack',       699.00,  '2024-02-20 22:30:00', 'PayPal');


Select * from players
Select * from games
Select * from matches
Select * from tournaments
Select * from achievements
Select * from purchases

--PART B: DML (Data Manipulation Language) — 10 Questions

--Q15. Update the level of player_id = 5 to 25 and increase their coins by 500.

Update players set coins = coins + 500 where player_id = 5

--Q16. Update the status of all players who registered before '2023-01-01' and have level less than 5 to 'Inactive'.

Update players set status = 'Inactive' where registration_date < '2023-01-01' and level < 5;

--Q17. Increase the price of all games in the 'RPG' genre by 10%.

Update games set price = price * 10 where genre = 'RPG'

--Q18. Update the winner_id of tournament_id = 3 to player_id = 10 and change its status to 'Completed'.
update tournaments
set winner_id=10, status='Completed'
where tournament_id = 3

--Q19. Delete all matches where result = 'Loss' and score < 100 (cleanup of very poor performance records).
delete from matches 
where result='Loss' and score<100

--Q20. Delete all achievements earned more than 2 years ago (use DATEDIFF or similar functions based on current date).
delete from achievements
where DATEDIFF(year, earned_date, GETDATE())>2


--PART C: Basic SELECT, WHERE, DISTINCT, LIKE, IN, BETWEEN — 15 Questions

--Q21. Select all columns from the players table.
select * from players

--Q22. Retrieve only the username, email, and country of all players.
select username, email, country from players

--Q23. Find all players whose country is 'India'.
select * from players where country='India'

--Q24. List all games with a rating greater than or equal to 4.0.
select * from games 
where rating >=4.0

--Q25. Display all matches where the result was 'Win'.
select * from matches
where result='Win'

--Q26. Find all players whose level is between 10 and 50 (inclusive).
select * from players 
where level between 10 and 50

--Q27. Retrieve all games where the price is greater than 500.
select * from games
where price>500

--Q28. List all tournaments with status 'Completed'.
select * from tournaments 
where status='Completed'

--Q29. Find all players whose username starts with 'Pro'.
select * from players 
where username like 'Pro%'

--Q30. Display all games where the genre is either 'Action' or 'Strategy'.
select * from games
where genre in ('Action','Strategy')

--Q31. Retrieve all purchases made using the payment method 'UPI' or 'Card'.
select * from purchases 
where payment_method in ('UPI','Card')

--Q32. Find all achievements with rarity 'Legendary'.
select * from achievements
where rarity='Legendary'

--Q33. List all players whose email ends with '@gmail.com'.
select * from players
where email like '%@gmail.com'

--Q34. Display DISTINCT countries from the players table.
select distinct country from players

--Q35. Find all matches where the mode is NOT 'Solo'. Use the NOT operator.
select * from matches
where mode <> 'Solo'

--PART D: ORDER BY — 5 Questions

--Q36. List all players ordered by their level in descending order.
select * from players
order by level desc

--Q37. Display all games ordered by rating in descending order, and then by price in ascending order.
select * from games 
order by rating desc, price asc

--Q38. Retrieve all matches ordered by score in descending order. Show only the top 10 records using LIMIT.
select top(10) * from matches
order by score

--Q39. List all tournaments ordered by prize_pool in descending order.
select * from tournaments
order by prize_pool desc

--Q40. Display all purchases ordered by purchase_date in descending order (most recent first).
select * from purchases 
order by purchase_date

--PART E: JOINS (INNER, LEFT, RIGHT, SELF, FULL, CROSS) — 20 Questions

--Section E-1: INNER JOIN
--Q41. List all matches along with the player username and game name. Display username, game_name, score, result, and match_date.
select p.username, g.game_name, m.score, m.result, m.match_date from matches m
join players p
on p.player_id=m.player_id
join games g
on g.game_id=m.game_id

--Q42. Display all achievements with the player username and game name. Show username, game_name, achievement_name, rarity, and earned_date.
select p.username, g.game_name, a.achievement_name, a.rarity, a.earned_date from achievements a
join players p
on p.player_id=a.player_id
join games g
on g.game_id=a.game_id

--Q43. List all purchases with player username, game name, item name, and amount. Show username, game_name, item_name, amount, and purchase_date.
select p2.username, g.game_name, p1.item_name, p1.amount, p1.purchase_date from purchases p1
join players p2
on p1.player_id=p2.player_id
join games g
on g.game_id=p1.game_id

--Q44. Show all tournaments along with the game name and winner username. Display tournament_name, game_name, winner username, prize_pool, and status.
select t.tournament_name, g.game_name, p.username, t.prize_pool, t.status from tournaments t
join players p
on p.player_id=t.winner_id
join games g
on g.game_id=t.game_id

--Q45. Find all matches where players achieved a score greater than 1000. Join matches, players, and games. Display username, game_name, score, and match_date.
select p.username, g.game_name, m.score, m.match_date from matches m
join players p
on p.player_id=m.player_id
join games g
on g.game_id=m.game_id
where m.score>1000


--Section E-2: LEFT JOIN / RIGHT JOIN
--Q46. Find all players who have NEVER played any match. Use LEFT JOIN between players and matches. Display username and email.
select p.username, p.email from players p
left join matches m
on m.player_id=p.player_id
where m.player_id is null

--Q47. List all games along with the count of matches played for each game, including games with zero matches. Use LEFT JOIN and GROUP BY.
select g.game_name, count(m.match_id) as total_matches from games g
left join matches m
on m.game_id=g.game_id
group by g.game_name

--Q48. Find all players who have NOT earned any achievement. Use LEFT JOIN between players and achievements. Display username and country.
select p.username, p.country from players p
left join achievements a
on a.player_id=p.player_id
where a.achievement_id is null

--Q49. Display all games along with the total purchase revenue for each game, including games with no purchases (show 0 for revenue). Use LEFT JOIN.
select g.game_name, coalesce(sum(p.amount),0) as total_revenue from games g
left join purchases p
on p.game_id=g.game_id
group by g.game_name

--Q50. List all tournaments along with the winner username. Include tournaments that do not have a winner yet (show NULL). Use LEFT JOIN.
select t.tournament_name, p.username from tournaments t
left join players p
on p.player_id=t.winner_id

--Section E-3: Multi-Table JOIN
--Q51. Write a query joining players, matches, and games to display: player username, game name, score, result, duration_min, and match_date.
select p.username, g.game_name, m.score, m.result, m.duration_min, m.match_date from matches m
join players p
on p.player_id=m.player_id
join games g
on g.game_id=m.game_id

--Q52. Generate a complete tournament report: tournament name, game name, winner username, winner country, prize pool, start date, and end date. Join tournaments, games, and players.
select t.tournament_name, g.game_name, p.username, p.country, t.prize_pool, t.start_date, t.end_date from tournaments t
join players p
on p.player_id=t.winner_id
join games g
on g.game_id=t.game_id

--Q53. Show a comprehensive purchase report: player username, player country, game name, item name, amount, payment method, and purchase date. Join all 3 tables.
select p2.username, g.game_id, p1.item_name, p1.amount, p1.payment_method, p1.purchase_date from purchases p1
join players p2
on p2.player_id=p1.player_id
join games g
on g.game_id=p1.game_id

--Q54. Find all players from 'India' who have won matches in 'Action' games. Display username, game name, score, and match date. Join players, matches, and games.
select p.username, g.game_name, m.score, m.match_date from matches m
join players p
on p.player_id=m.player_id
join games g
on g.game_id=m.game_id
where p.country='India' and g.genre='Action' and m.result='Win'

--Q55. List all achievements earned in games with a rating above 4.0. Display player username, game name, achievement name, rarity, and rating. Join players, achievements, and games.
select p.username, g.game_name, a.achievement_name, a.rarity, g.rating from achievements a
join players p
on p.player_id=a.player_id
join games g
on g.game_id=a.game_id
where g.rating>4.0


--Section E-4: SELF JOIN
--Q56. Find pairs of players who are from the same country. Use SELF JOIN on the players table. Display player1_username, player2_username, and country.
select p1.username as player1_username, p2.username as player2_username,p1.country from players p1
join players p2
on p1.country=p2.country
and p1.player_id<p2.player_id

--Q57. Find pairs of games that were released in the same year. Use SELF JOIN on the games table. Display game1_name, game2_name, and release year.
select g1.game_name, g2.game_name, year(g1.release_date) as release_year from games g1
join games g2
on year(g1.release_date)=year(g2.release_date)
and g1.game_id<g2.game_id


--Section E-5: FULL OUTER JOIN & CROSS JOIN
--Q58. Write a FULL OUTER JOIN between players and matches to show all players (matched or not) and all matches (matched or not).
select * from players p
full outer join matches m
on p.player_id=m.player_id

--Q59. Write a CROSS JOIN between games and match modes (use a derived table with values: Solo, Duo, Squad, Team) to generate all possible game-mode combinations.
select g.game_name, m.mode from games g
cross join 
(select 'Solo' as mode
union all 
select 'Duo'
union all 
select 'Squad'
union all
select 'Team') m


--select g.game_name, m.mode from games g, matches m

--Q60. Perform a CROSS JOIN between players and games to list all possible player-game combinations (useful for recommendation systems). Limit the result to 20 rows.
select top(20) p.username, g.game_name from players p
cross join games g

select top(20) p.username, g.game_name from players p, games g


--PART F: Aggregation Functions (COUNT, SUM, AVG, MAX, MIN) — 5 Questions
--Q61. Find the total number of registered players on the platform. Use COUNT.
select count(player_id) as total_player from players

--Q62. Calculate the highest score, lowest score, and average score across all matches. Use MAX, MIN, and AVG in a single query with meaningful aliases.
select max(score) as highest_score, min(score) as lowest_score, avg(score) as average_score from matches

--Q63. Find the total revenue generated from all purchases. Use SUM on the amount column.
select sum(amount) as total_revenue from purchases

--Q64. Calculate the average prize pool across all completed tournaments. Use AVG with a WHERE clause.
select avg(prize_pool) as avg_prize from tournaments
where status='Completed'

--Q65. Count the total number of achievements earned per rarity level. Use COUNT with GROUP BY on the rarity column.
select rarity, count(achievement_id) as total_achievements from achievements
group by rarity


--PART G: GROUP BY & HAVING — 5 Questions
--Q66. Count the total number of matches played by each player. Display username and match_count. Order by match_count descending. Join players and matches.
select p.username, count(match_id) as total_matches from players p
join matches m
on m.player_id=p.player_id
group by p.player_id ,p.username
order by total_matches desc

--Q67. Find the total revenue generated from purchases for each game. Display game_name and total_revenue. Order by total_revenue descending. Join games and purchases.
select game_name, sum(p.amount) as total_revenue from games g
join purchases p
on p.game_id=g.game_id
group by g.game_id, g.game_name
order by total_revenue desc

--Q68. Group all matches by result (Win/Loss/Draw) and count how many matches ended with each result. Display result and match_count.
select result, count(match_id) as total_matches from matches
group by result

--Q69. Find players who have earned more than 3 achievements. Use GROUP BY and HAVING. Display username and achievement_count. Join players and achievements.
select p.username, count(a.achievement_id) as total_achievements from achievements a
join players p
on p.player_id=a.player_id
group by p.player_id, p.username
having count(achievement_id)>3

--Q70. List games that have been played in more than 10 matches. Use GROUP BY and HAVING. Display game_name and total_matches. Order by total_matches descending.
select g.game_name, count(m.match_id) as total_matches from games g
join matches m
on m.game_id=g.game_id
group by g.game_id, g.game_name
having count(m.match_id)>10
order by total_matches desc