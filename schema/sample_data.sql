-- sample_data.sql
-- Sample data for Naiin Bookstore Database System
-- Note: Data generated with AI assistance for demonstration purposes
START TRANSACTION;
-- ============================================
-- BRANCH (5 branches)
-- ============================================
INSERT INTO BRANCH (BRANCH_NAME, BRANCH_PHONE, BRANCH_EMAIL, BRANCH_STATE, BRANCH_COUNTRY, BRANCH_CITY, BRANCH_POSTCODE) VALUES
('Central Plaza Branch', '02-111-1111', 'central@bookstore.com', 'Bangkok', 'Thailand', 'Ladprao', '10230'),
('Siam Square Branch', '02-222-2222', 'siam@bookstore.com', 'Bangkok', 'Thailand', 'Pathumwan', '10330'),
('Mega Bangna Branch', '02-333-3333', 'bangna@bookstore.com', 'Samut Prakan', 'Thailand', 'Bang Phli', '10540'),
('Chiang Mai Branch', '053-444-444', 'chiangmai@bookstore.com', 'Chiang Mai', 'Thailand', 'Mueang', '50200'),
('Phuket Branch', '076-555-555', 'phuket@bookstore.com', 'Phuket', 'Thailand', 'Mueang', '83000');

-- ============================================
-- EMPLOYEE (15 employees)
-- ============================================
INSERT INTO EMPLOYEE (BRANCH_ID, EMP_FNAME, EMP_LNAME, EMP_BDATE, EMP_SEX, EMP_SALARY, EMP_TEL, EMP_EMAIL, EMP_WORKHOUR, EMP_SKILL) VALUES
(1, 'Somchai', 'Jaidee', '1985-03-15', 'Male', 55000.00, '081-111-1111', 'somchai@bookstore.com', 40, 'Management'),
(1, 'Suda', 'Rakdee', '1990-07-22', 'Female', 35000.00, '081-111-2222', 'suda@bookstore.com', 40, 'Sales'),
(1, 'Prasit', 'Boonmee', '1992-11-08', 'Male', 32000.00, '081-111-3333', 'prasit@bookstore.com', 40, 'Customer Service'),
(2, 'Wanida', 'Srisuk', '1988-05-30', 'Female', 52000.00, '082-222-1111', 'wanida@bookstore.com', 40, 'Management'),
(2, 'Anong', 'Thongdee', '1995-01-12', 'Female', 33000.00, '082-222-2222', 'anong@bookstore.com', 40, 'Sales'),
(2, 'Pichit', 'Wongsri', '1993-09-25', 'Male', 31000.00, '082-222-3333', 'pichit@bookstore.com', 35, 'Inventory'),
(3, 'Narong', 'Suksan', '1987-12-03', 'Male', 53000.00, '083-333-1111', 'narong@bookstore.com', 40, 'Management'),
(3, 'Rattana', 'Pongpan', '1991-04-18', 'Female', 34000.00, '083-333-2222', 'rattana@bookstore.com', 40, 'Sales'),
(3, 'Kittisak', 'Saengdee', '1994-08-07', 'Male', 30000.00, '083-333-3333', 'kittisak@bookstore.com', 35, 'Sales'),
(4, 'Malee', 'Chaiyaphum', '1986-06-21', 'Female', 50000.00, '084-444-1111', 'malee@bookstore.com', 40, 'Management'),
(4, 'Somsak', 'Intara', '1996-02-14', 'Male', 32000.00, '084-444-2222', 'somsak@bookstore.com', 40, 'Sales'),
(4, 'Nittaya', 'Kaewkam', '1993-10-29', 'Female', 31000.00, '084-444-3333', 'nittaya@bookstore.com', 35, 'Customer Service'),
(5, 'Prawit', 'Laosri', '1984-01-05', 'Male', 54000.00, '085-555-1111', 'prawit@bookstore.com', 40, 'Management'),
(5, 'Supaporn', 'Jindarat', '1997-07-16', 'Female', 33000.00, '085-555-2222', 'supaporn@bookstore.com', 40, 'Sales'),
(5, 'Thanakorn', 'Maneerat', '1995-03-11', 'Male', 30000.00, '085-555-3333', 'thanakorn@bookstore.com', 35, 'Inventory');

-- ============================================
-- MANAGER (5 managers - one per branch)
-- ============================================
INSERT INTO MANAGER (EMPLOYEE_ID, BRANCH_BUDGET) VALUES
(1, 500000.00),
(4, 450000.00),
(7, 480000.00),
(10, 350000.00),
(13, 400000.00);

-- ============================================
-- SELLER (10 sellers)
-- ============================================
INSERT INTO SELLER (EMPLOYEE_ID, TIPS) VALUES
(2, 1500.00),
(3, 800.00),
(5, 2200.00),
(6, 600.00),
(8, 1800.00),
(9, 950.00),
(11, 1100.00),
(12, 750.00),
(14, 1650.00),
(15, 500.00);

-- ============================================
-- CUSTOMER (20 customers)
-- ============================================
INSERT INTO CUSTOMER (CUS_FNAME, CUS_LNAME, CUS_TEL, CUS_SEX, CUS_EMAIL, CUS_DISTRICT, CUS_PROVINCE, CUS_COUNTRY, CUS_POSTCODE, CUS_BDATE) VALUES
('John', 'Smith', '091-001-0001', 'Male', 'john.smith@email.com', 'Sukhumvit', 'Bangkok', 'Thailand', '10110', '1990-05-15'),
('Emily', 'Johnson', '091-001-0002', 'Female', 'emily.j@email.com', 'Silom', 'Bangkok', 'Thailand', '10500', '1988-11-22'),
('Michael', 'Williams', '091-001-0003', 'Male', 'michael.w@email.com', 'Sathorn', 'Bangkok', 'Thailand', '10120', '1995-03-08'),
('Sarah', 'Brown', '091-001-0004', 'Female', 'sarah.b@email.com', 'Thonglor', 'Bangkok', 'Thailand', '10110', '1992-07-30'),
('David', 'Jones', '091-001-0005', 'Male', 'david.j@email.com', 'Ari', 'Bangkok', 'Thailand', '10400', '1985-12-01'),
('Jessica', 'Garcia', '091-001-0006', 'Female', 'jessica.g@email.com', 'Ekkamai', 'Bangkok', 'Thailand', '10110', '1998-09-17'),
('Daniel', 'Martinez', '091-001-0007', 'Male', 'daniel.m@email.com', 'Ratchada', 'Bangkok', 'Thailand', '10310', '1991-04-25'),
('Ashley', 'Anderson', '091-001-0008', 'Female', 'ashley.a@email.com', 'Bangkapi', 'Bangkok', 'Thailand', '10240', '1993-06-12'),
('James', 'Taylor', '091-001-0009', 'Male', 'james.t@email.com', 'Nimman', 'Chiang Mai', 'Thailand', '50200', '1987-02-28'),
('Amanda', 'Thomas', '091-001-0010', 'Female', 'amanda.t@email.com', 'Old City', 'Chiang Mai', 'Thailand', '50200', '1996-10-05'),
('Robert', 'Lee', '091-001-0011', 'Male', 'robert.l@email.com', 'Patong', 'Phuket', 'Thailand', '83150', '1989-08-19'),
('Jennifer', 'White', '091-001-0012', 'Female', 'jennifer.w@email.com', 'Kata', 'Phuket', 'Thailand', '83100', '1994-01-14'),
('William', 'Harris', '091-001-0013', 'Male', 'william.h@email.com', 'Bang Phli', 'Samut Prakan', 'Thailand', '10540', '1986-11-07'),
('Elizabeth', 'Clark', '091-001-0014', 'Female', 'elizabeth.c@email.com', 'Pak Kret', 'Nonthaburi', 'Thailand', '11120', '1997-05-23'),
('Christopher', 'Lewis', '091-001-0015', 'Male', 'chris.l@email.com', 'Muang', 'Nonthaburi', 'Thailand', '11000', '1990-03-16'),
('Sophia', 'Walker', '091-001-0016', 'Female', 'sophia.w@email.com', 'Ladprao', 'Bangkok', 'Thailand', '10230', '1999-12-30'),
('Matthew', 'Hall', '091-001-0017', 'Male', 'matthew.h@email.com', 'Chatuchak', 'Bangkok', 'Thailand', '10900', '1988-07-08'),
('Olivia', 'Allen', '091-001-0018', 'Female', 'olivia.a@email.com', 'Phaya Thai', 'Bangkok', 'Thailand', '10400', '1995-09-21'),
('Andrew', 'Young', '091-001-0019', 'Male', 'andrew.y@email.com', 'Din Daeng', 'Bangkok', 'Thailand', '10400', '1992-04-02'),
('Emma', 'King', '091-001-0020', 'Female', 'emma.k@email.com', 'Huai Khwang', 'Bangkok', 'Thailand', '10310', '1993-11-11');

-- ============================================
-- GENRE (12 genres)
-- ============================================
INSERT INTO GENRE (NAME, PRODUCTTYPE) VALUES
('Fiction', 'Book'),
('Non-Fiction', 'Book'),
('Science Fiction', 'Book'),
('Fantasy', 'Book'),
('Mystery', 'Book'),
('Romance', 'Book'),
('Thriller', 'Book'),
('Biography', 'Book'),
('Self-Help', 'Book'),
('History', 'Book'),
('Children', 'Book'),
('Comics', 'Book');

-- ============================================
-- PAYMENT (5 payment methods)
-- ============================================
INSERT INTO PAYMENT (PAY_METHOD, PAY_STATUS) VALUES
('Cash', 'Completed'),
('Credit Card', 'Completed'),
('Debit Card', 'Completed'),
('Mobile Banking', 'Completed'),
('QR Code', 'Completed');

-- ============================================
-- AUTHOR (15 authors)
-- ============================================
INSERT INTO AUTHOR (AUTHOR_FNAME, AUTHOR_LNAME, AUTHOR_PENNAME, AUTHOR_CONTACT) VALUES
('George', 'Orwell', 'George Orwell', 'orwell@literature.com'),
('Jane', 'Austen', 'Jane Austen', 'austen@literature.com'),
('Stephen', 'King', 'Stephen King', 'king@horror.com'),
('Agatha', 'Christie', 'Agatha Christie', 'christie@mystery.com'),
('J.K.', 'Rowling', 'J.K. Rowling', 'rowling@wizards.com'),
('Ernest', 'Hemingway', 'Ernest Hemingway', 'hemingway@literature.com'),
('Mark', 'Twain', 'Mark Twain', 'twain@classics.com'),
('Isaac', 'Asimov', 'Isaac Asimov', 'asimov@scifi.com'),
('Arthur', 'Conan Doyle', 'Arthur Conan Doyle', 'doyle@detective.com'),
('J.R.R.', 'Tolkien', 'J.R.R. Tolkien', 'tolkien@fantasy.com'),
('Dan', 'Brown', 'Dan Brown', 'brown@thriller.com'),
('Paulo', 'Coelho', 'Paulo Coelho', 'coelho@wisdom.com'),
('Haruki', 'Murakami', 'Haruki Murakami', 'murakami@japan.com'),
('Neil', 'Gaiman', 'Neil Gaiman', 'gaiman@fantasy.com'),
('Brandon', 'Sanderson', 'Brandon Sanderson', 'sanderson@fantasy.com');

-- ============================================
-- PUBLISHER (8 publishers)
-- ============================================
INSERT INTO PUBLISHER (PBS_NAME, PBS_DISTRICT, PBS_PROVINCE, PBS_COUNTRY, PBS_POSTCODE, PBS_EMAIL, PBS_PHONE) VALUES
('Penguin Random House', 'Manhattan', 'New York', 'USA', '10019', 'contact@penguin.com', '+1-212-366-2000'),
('HarperCollins', 'Manhattan', 'New York', 'USA', '10007', 'contact@harpercollins.com', '+1-212-207-7000'),
('Simon & Schuster', 'Manhattan', 'New York', 'USA', '10020', 'contact@simonschuster.com', '+1-212-698-7000'),
('Macmillan Publishers', 'Flatiron', 'New York', 'USA', '10010', 'contact@macmillan.com', '+1-212-226-7521'),
('Hachette Book Group', 'Manhattan', 'New York', 'USA', '10104', 'contact@hachette.com', '+1-212-364-1100'),
('Scholastic', 'Manhattan', 'New York', 'USA', '10012', 'contact@scholastic.com', '+1-212-343-6100'),
('Bloomsbury', 'Westminster', 'London', 'UK', 'WC1B', 'contact@bloomsbury.com', '+44-20-7631-5600'),
('Vintage Books', 'Manhattan', 'New York', 'USA', '10019', 'contact@vintage.com', '+1-212-572-2882');

-- ============================================
-- BOOK (25 books)
-- ============================================
INSERT INTO BOOK (PBS_ID, BOOK_TITLE, BOOK_ISBN, BOOK_PRICE, BOOK_IMAGE, BOOK_PAGE) VALUES
(1, '1984', '978-0451524935', 450.00, '1984.jpg', 328),
(1, 'Animal Farm', '978-0451526342', 350.00, 'animal_farm.jpg', 112),
(2, 'Pride and Prejudice', '978-0141439518', 380.00, 'pride_prejudice.jpg', 432),
(3, 'The Shining', '978-0307743657', 520.00, 'shining.jpg', 688),
(3, 'It', '978-1501142970', 650.00, 'it.jpg', 1138),
(4, 'Murder on the Orient Express', '978-0062693662', 420.00, 'orient_express.jpg', 256),
(4, 'And Then There Were None', '978-0062073488', 400.00, 'none.jpg', 272),
(7, 'Harry Potter and the Sorcerers Stone', '978-0590353427', 550.00, 'hp1.jpg', 309),
(7, 'Harry Potter and the Chamber of Secrets', '978-0439064873', 550.00, 'hp2.jpg', 341),
(7, 'Harry Potter and the Prisoner of Azkaban', '978-0439136365', 580.00, 'hp3.jpg', 435),
(2, 'The Old Man and the Sea', '978-0684801223', 320.00, 'oldman_sea.jpg', 127),
(1, 'The Adventures of Tom Sawyer', '978-0486400778', 280.00, 'tom_sawyer.jpg', 224),
(1, 'Foundation', '978-0553293357', 480.00, 'foundation.jpg', 244),
(1, 'I, Robot', '978-0553294385', 420.00, 'i_robot.jpg', 224),
(4, 'The Adventures of Sherlock Holmes', '978-0486474915', 350.00, 'sherlock.jpg', 176),
(5, 'The Hobbit', '978-0547928227', 520.00, 'hobbit.jpg', 300),
(5, 'The Lord of the Rings', '978-0544003415', 890.00, 'lotr.jpg', 1178),
(1, 'The Da Vinci Code', '978-0307474278', 480.00, 'davinci.jpg', 489),
(2, 'Angels and Demons', '978-1416524793', 460.00, 'angels.jpg', 736),
(2, 'The Alchemist', '978-0062315007', 390.00, 'alchemist.jpg', 208),
(8, 'Norwegian Wood', '978-0375704024', 450.00, 'norwegian.jpg', 296),
(8, 'Kafka on the Shore', '978-1400079278', 520.00, 'kafka.jpg', 467),
(2, 'American Gods', '978-0063081918', 550.00, 'american_gods.jpg', 541),
(2, 'Coraline', '978-0380807345', 320.00, 'coraline.jpg', 162),
(4, 'Mistborn: The Final Empire', '978-0765350381', 580.00, 'mistborn.jpg', 541);

-- ============================================
-- BOOK_AUTHOR (linking books to authors)
-- ============================================
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES
(1, 1),   -- 1984 - George Orwell
(2, 1),   -- Animal Farm - George Orwell
(3, 2),   -- Pride and Prejudice - Jane Austen
(4, 3),   -- The Shining - Stephen King
(5, 3),   -- It - Stephen King
(6, 4),   -- Murder on the Orient Express - Agatha Christie
(7, 4),   -- And Then There Were None - Agatha Christie
(8, 5),   -- Harry Potter 1 - J.K. Rowling
(9, 5),   -- Harry Potter 2 - J.K. Rowling
(10, 5),  -- Harry Potter 3 - J.K. Rowling
(11, 6),  -- The Old Man and the Sea - Ernest Hemingway
(12, 7),  -- Tom Sawyer - Mark Twain
(13, 8),  -- Foundation - Isaac Asimov
(14, 8),  -- I, Robot - Isaac Asimov
(15, 9),  -- Sherlock Holmes - Arthur Conan Doyle
(16, 10), -- The Hobbit - J.R.R. Tolkien
(17, 10), -- Lord of the Rings - J.R.R. Tolkien
(18, 11), -- The Da Vinci Code - Dan Brown
(19, 11), -- Angels and Demons - Dan Brown
(20, 12), -- The Alchemist - Paulo Coelho
(21, 13), -- Norwegian Wood - Haruki Murakami
(22, 13), -- Kafka on the Shore - Haruki Murakami
(23, 14), -- American Gods - Neil Gaiman
(24, 14), -- Coraline - Neil Gaiman
(25, 15); -- Mistborn - Brandon Sanderson

-- ============================================
-- BOOK_GENRE (linking books to genres, some books have multiple genres)
-- ============================================
INSERT INTO BOOK_GENRE (BOOK_ID, GENRE_ID) VALUES
(1, 1),   -- 1984 - Fiction
(1, 3),   -- 1984 - Science Fiction
(2, 1),   -- Animal Farm - Fiction
(3, 1),   -- Pride and Prejudice - Fiction
(3, 6),   -- Pride and Prejudice - Romance
(4, 7),   -- The Shining - Thriller
(5, 7),   -- It - Thriller
(6, 5),   -- Murder on the Orient Express - Mystery
(7, 5),   -- And Then There Were None - Mystery
(7, 7),   -- And Then There Were None - Thriller
(8, 4),   -- Harry Potter 1 - Fantasy
(9, 4),   -- Harry Potter 2 - Fantasy
(10, 4),  -- Harry Potter 3 - Fantasy
(11, 1),  -- The Old Man and the Sea - Fiction
(12, 1),  -- Tom Sawyer - Fiction
(12, 11), -- Tom Sawyer - Children
(13, 3),  -- Foundation - Science Fiction
(14, 3),  -- I, Robot - Science Fiction
(15, 5),  -- Sherlock Holmes - Mystery
(16, 4),  -- The Hobbit - Fantasy
(17, 4),  -- Lord of the Rings - Fantasy
(18, 7),  -- The Da Vinci Code - Thriller
(18, 5),  -- The Da Vinci Code - Mystery
(19, 7),  -- Angels and Demons - Thriller
(20, 1),  -- The Alchemist - Fiction
(20, 9),  -- The Alchemist - Self-Help
(21, 1),  -- Norwegian Wood - Fiction
(21, 6),  -- Norwegian Wood - Romance
(22, 1),  -- Kafka on the Shore - Fiction
(22, 4),  -- Kafka on the Shore - Fantasy
(23, 4),  -- American Gods - Fantasy
(24, 4),  -- Coraline - Fantasy
(24, 11), -- Coraline - Children
(25, 4);  -- Mistborn - Fantasy

-- ============================================
-- MEMBERSHIP_CARD (12 members)
-- ============================================
INSERT INTO MEMBERSHIP_CARD (CUS_ID, MEMBER_APPLY_DATE, MEMBER_EXP_DATE, MEMBER_POINTBALANCE, MEMBER_TOTALDAY) VALUES
(1, '2023-01-15', '2025-01-15', 2500.00, 730),
(2, '2023-03-20', '2025-03-20', 1800.00, 730),
(3, '2023-06-10', '2025-06-10', 3200.00, 730),
(5, '2023-02-28', '2025-02-28', 950.00, 730),
(7, '2023-08-05', '2025-08-05', 4100.00, 730),
(9, '2023-04-12', '2025-04-12', 1500.00, 730),
(11, '2023-09-18', '2025-09-18', 2200.00, 730),
(13, '2023-07-22', '2025-07-22', 800.00, 730),
(15, '2024-01-05', '2026-01-05', 3600.00, 730),
(17, '2024-02-14', '2026-02-14', 1100.00, 730),
(19, '2024-03-30', '2026-03-30', 500.00, 730),
(20, '2024-05-01', '2026-05-01', 2900.00, 730);

-- ============================================
-- PROMOTION (8 promotions)
-- ============================================
INSERT INTO PROMOTION (BRANCH_ID, PRO_START_DATE, PRO_END_DATE, PRO_NAME, PRO_DISCOUNTRATE) VALUES
(1, '2024-12-01', '2024-12-31', 'December Delight', 15.00),
(1, '2025-01-01', '2025-01-15', 'New Year Sale', 20.00),
(2, '2024-11-15', '2024-11-30', 'Black Friday', 25.00),
(2, '2024-12-20', '2024-12-25', 'Christmas Special', 30.00),
(3, '2024-10-01', '2024-10-31', 'Halloween Reads', 10.00),
(4, '2024-12-01', '2025-01-31', 'Winter Wonderland', 15.00),
(5, '2024-11-01', '2024-12-31', 'Beach Reads', 12.00),
(NULL, '2024-12-26', '2025-01-10', 'Year End Clearance', 35.00);

-- ============================================
-- POINT (20 point records)
-- ============================================
INSERT INTO POINT (MEMBER_ID, EARN_DATE, EXPIRY_DATE) VALUES
(1, '2024-01-20', '2025-01-20'),
(1, '2024-03-15', '2025-03-15'),
(1, '2024-06-10', '2025-06-10'),
(2, '2024-02-14', '2025-02-14'),
(2, '2024-05-20', '2025-05-20'),
(3, '2024-01-05', '2025-01-05'),
(3, '2024-04-18', '2025-04-18'),
(3, '2024-07-22', '2025-07-22'),
(3, '2024-10-30', '2025-10-30'),
(5, '2024-03-08', '2025-03-08'),
(5, '2024-08-12', '2025-08-12'),
(7, '2024-02-28', '2025-02-28'),
(7, '2024-05-15', '2025-05-15'),
(7, '2024-09-20', '2025-09-20'),
(9, '2024-04-01', '2025-04-01'),
(9, '2024-11-11', '2025-11-11'),
(11, '2024-06-25', '2025-06-25'),
(12, '2024-07-04', '2025-07-04'),
(12, '2024-10-15', '2025-10-15'),
(12, '2024-12-01', '2025-12-01');

-- ============================================
-- ORDERS (30 orders)
-- ============================================
INSERT INTO ORDERS (CUS_ID, BRANCH_ID, ORDER_GRANDTOTAL, ORDER_DATE) VALUES
(1, 1, 800.00, '2024-01-20'),
(1, 1, 1100.00, '2024-03-15'),
(2, 2, 550.00, '2024-02-14'),
(3, 1, 1470.00, '2024-01-05'),
(3, 3, 890.00, '2024-04-18'),
(4, 2, 420.00, '2024-03-22'),
(5, 1, 650.00, '2024-03-08'),
(6, 2, 1080.00, '2024-04-10'),
(7, 3, 520.00, '2024-02-28'),
(7, 1, 1890.00, '2024-05-15'),
(8, 2, 350.00, '2024-05-20'),
(9, 4, 980.00, '2024-04-01'),
(10, 4, 550.00, '2024-06-12'),
(11, 5, 1100.00, '2024-06-25'),
(12, 5, 480.00, '2024-07-04'),
(13, 3, 750.00, '2024-07-18'),
(14, 1, 1650.00, '2024-08-05'),
(15, 2, 890.00, '2024-08-22'),
(16, 1, 420.00, '2024-09-10'),
(17, 3, 1100.00, '2024-09-28'),
(18, 2, 580.00, '2024-10-15'),
(19, 4, 1470.00, '2024-10-30'),
(20, 5, 650.00, '2024-11-11'),
(1, 2, 890.00, '2024-11-25'),
(3, 1, 1580.00, '2024-12-01'),
(5, 3, 420.00, '2024-12-10'),
(7, 2, 1100.00, '2024-12-15'),
(9, 4, 780.00, '2024-12-18'),
(11, 5, 550.00, '2024-12-20'),
(15, 1, 1890.00, '2024-12-22');

-- ============================================
-- ORDER_ITEM (items for each order)
-- ============================================
INSERT INTO ORDER_ITEM (ORDER_ID, BOOK_ID, QUANTITY, PRICE) VALUES
-- Order 1
(1, 1, 1, 450.00),
(1, 2, 1, 350.00),
-- Order 2
(2, 8, 2, 550.00),
-- Order 3
(3, 8, 1, 550.00),
-- Order 4
(4, 16, 1, 520.00),
(4, 17, 1, 890.00),
-- Order 5
(5, 17, 1, 890.00),
-- Order 6
(6, 6, 1, 420.00),
-- Order 7
(7, 5, 1, 650.00),
-- Order 8
(8, 4, 1, 520.00),
(8, 7, 1, 400.00),
-- Order 9
(9, 16, 1, 520.00),
-- Order 10
(10, 17, 1, 890.00),
(10, 25, 1, 580.00),
-- Order 11
(11, 2, 1, 350.00),
-- Order 12
(12, 13, 1, 480.00),
(12, 14, 1, 420.00),
-- Order 13
(13, 8, 1, 550.00),
-- Order 14
(14, 21, 1, 450.00),
(14, 22, 1, 520.00),
-- Order 15
(15, 18, 1, 480.00),
-- Order 16
(16, 3, 1, 380.00),
(16, 11, 1, 320.00),
-- Order 17
(17, 8, 1, 550.00),
(17, 9, 1, 550.00),
(17, 10, 1, 580.00),
-- Order 18
(18, 20, 1, 390.00),
(18, 12, 1, 280.00),
-- Order 19
(19, 6, 1, 420.00),
-- Order 20
(20, 8, 2, 550.00),
-- Order 21
(21, 25, 1, 580.00),
-- Order 22
(22, 16, 1, 520.00),
(22, 25, 1, 580.00),
-- Order 23
(23, 5, 1, 650.00),
-- Order 24
(24, 17, 1, 890.00),
-- Order 25
(25, 4, 1, 520.00),
(25, 5, 1, 650.00),
-- Order 26
(26, 7, 1, 400.00),
-- Order 27
(27, 8, 1, 550.00),
(27, 9, 1, 550.00),
-- Order 28
(28, 21, 1, 450.00),
(28, 20, 1, 390.00),
-- Order 29
(29, 8, 1, 550.00),
-- Order 30
(30, 17, 1, 890.00),
(30, 16, 1, 520.00),
(30, 25, 1, 580.00);

-- ============================================
-- RENEWAL (8 renewals)
-- ============================================
INSERT INTO RENEWAL (MEMBER_ID, RENEWAL_DATE, RENEWAL_FEE) VALUES
(1, '2024-01-10', 200.00),
(2, '2024-03-15', 200.00),
(3, '2024-06-05', 200.00),
(5, '2024-02-20', 200.00),
(7, '2024-08-01', 200.00),
(9, '2024-04-08', 200.00),
(11, '2024-09-12', 200.00),
(12, '2024-07-18', 200.00);

-- ============================================
-- RECEIPT (30 receipts - one per order)
-- ============================================
INSERT INTO RECEIPT (BRANCH_ID, ORDER_ID, RC_CO_TAXID, RC_DATE, RC_TAX_AMOUNT, RC_VAT_AMOUNT, RC_GRANDTOTAL) VALUES
(1, 1, '1234567890123', '2024-01-20', 52.34, 56.00, 800.00),
(1, 2, '1234567890123', '2024-03-15', 71.96, 77.00, 1100.00),
(2, 3, '1234567890124', '2024-02-14', 35.98, 38.50, 550.00),
(1, 4, '1234567890123', '2024-01-05', 96.17, 102.90, 1470.00),
(3, 5, '1234567890125', '2024-04-18', 58.22, 62.30, 890.00),
(2, 6, '1234567890124', '2024-03-22', 27.48, 29.40, 420.00),
(1, 7, '1234567890123', '2024-03-08', 42.52, 45.50, 650.00),
(2, 8, '1234567890124', '2024-04-10', 70.65, 75.60, 1080.00),
(3, 9, '1234567890125', '2024-02-28', 34.02, 36.40, 520.00),
(1, 10, '1234567890123', '2024-05-15', 123.64, 132.30, 1890.00),
(2, 11, '1234567890124', '2024-05-20', 22.90, 24.50, 350.00),
(4, 12, '1234567890126', '2024-04-01', 64.11, 68.60, 980.00),
(4, 13, '1234567890126', '2024-06-12', 35.98, 38.50, 550.00),
(5, 14, '1234567890127', '2024-06-25', 71.96, 77.00, 1100.00),
(5, 15, '1234567890127', '2024-07-04', 31.40, 33.60, 480.00),
(3, 16, '1234567890125', '2024-07-18', 49.07, 52.50, 750.00),
(1, 17, '1234567890123', '2024-08-05', 107.94, 115.50, 1650.00),
(2, 18, '1234567890124', '2024-08-22', 58.22, 62.30, 890.00),
(1, 19, '1234567890123', '2024-09-10', 27.48, 29.40, 420.00),
(3, 20, '1234567890125', '2024-09-28', 71.96, 77.00, 1100.00),
(2, 21, '1234567890124', '2024-10-15', 37.93, 40.60, 580.00),
(4, 22, '1234567890126', '2024-10-30', 96.17, 102.90, 1470.00),
(5, 23, '1234567890127', '2024-11-11', 42.52, 45.50, 650.00),
(2, 24, '1234567890124', '2024-11-25', 58.22, 62.30, 890.00),
(1, 25, '1234567890123', '2024-12-01', 103.36, 110.60, 1580.00),
(3, 26, '1234567890125', '2024-12-10', 27.48, 29.40, 420.00),
(2, 27, '1234567890124', '2024-12-15', 71.96, 77.00, 1100.00),
(4, 28, '1234567890126', '2024-12-18', 51.03, 54.60, 780.00),
(5, 29, '1234567890127', '2024-12-20', 35.98, 38.50, 550.00),
(1, 30, '1234567890123', '2024-12-22', 123.64, 132.30, 1890.00);

COMMIT;