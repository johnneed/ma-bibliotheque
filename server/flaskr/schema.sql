-- Initialize the database.
-- Drop any existing data and create empty tables.

drop table if exists user;
drop table if exists post;
drop table if exists authors;
drop table if exists tags;
drop table if exists books;
drop table if exists tags_2_authors;
drop table if exists tags_2_books;
drop table if exists books_2_authors;
drop table if exists publishers;
drop table if exists books_2_publishers;

create table user (
  id integer primary key autoincrement,
  username text unique not null,
  password text not null
);

create table post (
  id integer primary key autoincrement,
  author_id integer not null,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

create table "authors" (
 "id" integer primary key autoincrement,
 "firstName" text,
 "lastName" text,
 "middleName" text,
 "portraitSRC" text,
 "bio" text );

create table "books" (
 "id" integer primary key autoincrement,
  "title" text,
  "subtitle" text,
  "language" text default 'en',
  "bookSRC" text,
  "yearPublished" integer,
  "adbc" text default 'AD',
  "coverSRC" real,
  "description" text,
  "ISBN" text unique,
  "AMAZON" text unique,
  "GOOGLE" text unique,
  "MOBI_ASIN" text
  );

create table "books_2_authors" (
 "id" integer primary key autoincrement,
 "book_id" integer  not null,
 "author_id" integer  not null,
 foreign key (author_id) references authors (id),
 foreign key (book_id)  references books (id)
 );

create table "books_2_publishers" (
 "id" integer primary key autoincrement,
 "book_id" integer not null,
 "publisher_id" integer not null,
 foreign key (book_id) references books (id),
 foreign key (publisher_id)  references publishers (id)
 );

create table "publishers" (
"id" integer primary key autoincrement, "Name" text );

create table "tags" (
"id" integer primary key autoincrement, "tag" text, "applies2Authors" integer, "applies2Books" integer, "tagGroup" text, "color" text );

create table "tags_2_authors" (
"id" integer primary key autoincrement, "tag_id" integer, "author_id" integer, foreign key (tag_id), foreign key (author_id)  references authors (id)  );

create table "tags_2_books" (
"id" integer primary key autoincrement, "tag_id" integer, "book_id" integer , foreign key (tag_id), foreign key (book_id) references books (id) );
