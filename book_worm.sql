create database book_worm;
use book_worm;

create table authors (
    id int auto_increment primary key,
    full_name varchar(255) not null,
    birth_year year,
    nationality varchar(100)
);

create table books (
    id int auto_increment primary key,
    book_name varchar(255) not null,
    category varchar(100),
    author_id int,
    price decimal(10, 2) not null default 0,
    publish_year year,
    constraint fk_book_author foreign key (author_id) references authors(id) on delete set null,
    constraint chk_price_min check (price >= 0)
);

create table customers (
    id int auto_increment primary key,
    full_name varchar(255) not null,
    email varchar(150) unique not null,
    phone varchar(20) unique not null,
    registration_date date default (current_date)
);

insert into authors (full_name, birth_year, nationality) 
values ('nguyễn nhật ánh', 1955, 'việt nam');

insert into books (book_name, category, author_id, publish_year) 
values ('mắt biếc', 'truyện dài', 1, 1990);

insert into customers (full_name, email, phone) 
values ('lê hải nguyên', 'nguyen.le@example.com', '0912345678');