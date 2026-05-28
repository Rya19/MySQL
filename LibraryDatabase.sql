-- Database Initialization
CREATE DATABASE IF NOT EXISTS My_Library; -- [cite: 10, 11]
USE My_Library; 

-- 1. Create Librarian Table
CREATE TABLE librarian ( -- [cite: 30]
    librarian_id INT NOT NULL, -- [cite: 30]
    name CHAR(40) NOT NULL, -- [cite: 30]
    phone_number CHAR(20), -- [cite: 30]
    super_visor INTEGER, -- [cite: 30]
    PRIMARY KEY (librarian_id) -- [cite: 30]
); -- [cite: 31]
ALTER TABLE librarian ADD UNIQUE (librarian_id); -- [cite: 40]

-- 2. Create Borrower Table
CREATE TABLE borrower ( -- [cite: 51]
    librarycard INTEGER auto_increment primary key, -- [cite: 51]
    name CHAR(40) NOT NULL, -- [cite: 51]
    address CHAR(40), -- [cite: 51]
    postalcode CHAR(20), -- [cite: 51]
    phone_number CHAR(20), -- [cite: 51]
    membershipdate DATE -- [cite: 51]
); -- [cite: 52]

-- 3. Create Book Table
CREATE TABLE book ( -- [cite: 62]
    title VARCHAR(60) NOT NULL, -- [cite: 62]
    author VARCHAR(40), -- [cite: 62]
    cost DECIMAL(10,2), -- [cite: 62]
    isbn_number INTEGER NOT NULL -- [cite: 62]
); -- [cite: 63]
ALTER TABLE book ADD UNIQUE (isbn_number); -- [cite: 64]
ALTER TABLE book ADD PRIMARY KEY (isbn_number); -- [cite: 65]

-- 4. Create Book Copy Table
CREATE TABLE bookcopy ( -- [cite: 73]
    sequence INTEGER NOT NULL, -- [cite: 73]
    isbn_number INTEGER NOT NULL, -- [cite: 73]
    publicationdate DATE -- [cite: 73]
); -- [cite: 74]
ALTER TABLE bookcopy ADD PRIMARY KEY (isbn_number, sequence); -- [cite: 75]
ALTER TABLE bookcopy ADD CONSTRAINT bookcopy_uniq UNIQUE (isbn_number, sequence); -- [cite: 76]
ALTER TABLE bookcopy ADD CONSTRAINT book_fkey FOREIGN KEY (isbn_number) REFERENCES book (isbn_number) ON DELETE CASCADE; -- [cite: 77]

-- 5. Create Book Lended (Transactions) Table
CREATE TABLE booklended ( -- [cite: 82]
    librarycard INTEGER NOT NULL, -- [cite: 82]
    checkoutdate DATE NOT NULL, -- [cite: 82]
    returndate DATE, -- [cite: 82]
    isbn_number INTEGER NOT NULL, -- [cite: 82]
    sequence INTEGER NOT NULL, -- [cite: 82]
    librarian_id INTEGER NOT NULL -- [cite: 82]
); -- [cite: 83]
ALTER TABLE booklended ADD PRIMARY KEY (isbn_number, sequence, librarycard, checkoutdate); -- [cite: 84]
ALTER TABLE booklended ADD CONSTRAINT booklended_uniq UNIQUE (isbn_number, sequence, librarycard, checkoutdate); -- [cite: 85]
ALTER TABLE booklended ADD CONSTRAINT borrower_fkey FOREIGN KEY (librarycard) REFERENCES borrower (librarycard) ON DELETE CASCADE; -- [cite: 86]
ALTER TABLE booklended ADD CONSTRAINT librarian_fkey FOREIGN KEY (librarian_id) REFERENCES librarian (librarian_id) ON DELETE CASCADE; -- [cite: 87]
ALTER TABLE booklended ADD CONSTRAINT bookcopy_fkey FOREIGN KEY (isbn_number, sequence) REFERENCES bookcopy (isbn_number, sequence); -- [cite: 88]