
---------------------------------------   Mini Project ----------------------------------------------------

create database miniproject;
use miniproject;

create table Categories ( Category_Id int primary key, Category_Name varchar(255) unique not null );
    insert into Categories values(237,'Java'),(238,'.net'),(239,'Python');
    select * from Categories order by Category_Id;
    
create table Publishers (Publisher_Id varchar(255) primary key, Publisher_Name varchar(255) not null);
    insert into Publishers values ('Room','bhagat'),('chitra','R B Tagore'),('Revolution','chetan');
    select * from Publishers order by Publisher_Id ;
    
create table Books (
Book_Id int primary key ,
Title varchar(255) not null , 
ISBN varchar(30) unique not null , 
Publication_Year int not null, 
Publisher_Id varchar(255),
Category_Id  int ,
Author_Name varchar(255),
          foreign key (Publisher_Id) references Publishers(Publisher_Id) on delete cascade ,
          foreign key (Category_Id) references Categories(Category_Id) on delete cascade ,
          check (Author_Name is not null)
);
insert into Books values( 101 , 'abcd' ,9876, 1970 ,'Room',237,'hemanth');
insert into Books values( 102 , 'abcde' ,98765, 1971,'chitra',238,'kumar');
insert into Books values( 103 , 'abcdef' ,987654, 1972 ,'Revolution',239,'katakam');
select * from Books;


create table Users (
    User_Id int primary key ,
    Username varchar(255) not null,
    Email varchar(255) unique not null,
    Phone_Number varchar(255) unique not null
);
insert into Users values ( 26045 ,'user1', 'user1@gmail.com',987654321);
insert into Users values ( 26046 ,'user2', 'user2@gmail.com',98765432);
insert into Users values ( 26047 ,'user3', 'user3@gmail.com',9876543);
select * from Users;



create table Borrowings (
    Borrow_Id int primary key ,
    User_Id int,
    Book_Id int,
    Borrow_Date date not null,
    Return_Date date not null,
    foreign key(User_Id) references Users(User_Id) on delete cascade ,
    foreign key (Book_Id) references Books(Book_Id) on delete cascade
);
insert into Borrowings values (1001, 26045, 101, '2024-02-04', '2024-02-15');
insert into Borrowings values (1002, 26045, 101, '2024-02-04', '2024-02-15');
insert into Borrowings values (1003, 26046, 102, '2024-03-04', '2024-03-10');
insert into Borrowings values (1004, 26047, 103, '2024-05-04', '2024-06-10');
select * from Borrowings;


