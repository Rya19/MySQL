## Design Documentation

Before implementing the SQL schema, I completed a design phase to plan the database structure. This included identifying entities, mapping relationships, assigning primary and foreign keys, and checking how the tables connect.

<img width="499" height="628" alt="Screenshot 2026-05-31 at 12 54 35 PM" src="https://github.com/user-attachments/assets/40fc8af7-07df-4e20-85f3-3ab7cf83da44" />
<img width="1106" height="623" alt="Screenshot 2026-05-31 at 12 54 07 PM" src="https://github.com/user-attachments/assets/d9a09f27-431a-43fe-a784-d7d8f32a4386" />


# Library Database Management System

This project is a MySQL database design for a library management system. It models the core structure needed to manage librarians, borrowers, books, physical book copies, and lending transactions.

## Project Overview

The goal of this project was to design a relational database system by moving through the main stages of database development: identifying entities, defining attributes, determining relationships, and converting the design into SQL tables.

The final implementation uses primary keys, foreign keys, composite keys, and cascading delete rules to connect related tables and maintain data integrity.

## Design Process

This project began with a conceptual database design process before writing SQL code.

The main steps included:

1. Identifying the major entities in the system
2. Listing the important attributes for each entity
3. Determining how the entities relate to each other
4. Defining primary keys and foreign keys
5. Translating the design into relational tables
6. Implementing the physical database schema in MySQL

## Technologies Used

- MySQL
- SQL
- Relational Database Design
- Entity-Relationship Modeling

## Database Schema

The database is named:

```sql
My_Library
```

### Tables

#### librarian

Stores information about library employees who process lending transactions.

Key fields:

- `librarian_id`
- `name`
- `phone_number`
- `super_visor`

#### borrower

Stores information about library members.

Key fields:

- `librarycard`
- `name`
- `address`
- `postalcode`
- `phone_number`
- `membershipdate`

#### book

Stores general book information.

Key fields:

- `isbn_number`
- `title`
- `author`
- `cost`

#### bookcopy

Represents individual physical copies of books. This allows one book title to have multiple copies.

Key fields:

- `isbn_number`
- `sequence`
- `publicationdate`

#### booklended

Tracks lending transactions between borrowers, librarians, and book copies.

Key fields:

- `librarycard`
- `checkoutdate`
- `returndate`
- `isbn_number`
- `sequence`
- `librarian_id`

## Relationships

The database uses foreign keys to connect related tables:

- A book can have multiple physical copies.
- A borrower can have multiple lending records.
- A librarian can process multiple lending records.
- A lending record is connected to one borrower, one librarian, and one book copy.
- `bookcopy` connects to `book` through `isbn_number`.
- `booklended` connects to `borrower`, `librarian`, and `bookcopy`.

## Database Design Concepts Demonstrated

- Entity identification
- Attribute selection
- Primary key design
- Foreign key relationships
- Composite primary keys
- One-to-many relationships
- Referential integrity
- Cascading deletes
- Physical database implementation in SQL

## How to Run

Open MySQL Workbench or another MySQL client and run:

```sql
SOURCE LibraryDatabase.sql;
```

You can also copy and paste the contents of `LibraryDatabase.sql` directly into your SQL editor and execute it.

The script creates the database and all required tables.

## File Structure

```text
LibraryDatabase.sql   # SQL script for creating the library database schema
```

## Future Improvements

- Add sample data with `INSERT` statements
- Add queries for common library operations
- Add views for active checkouts and returned books
- Add stored procedures for checkout and return workflows
- Add indexes for faster searching by borrower, title, or ISBN
- Add an ER diagram image to show the database relationships visually

## Author

Created as a database systems project focused on relational modeling, entity relationships, and MySQL schema implementation.
