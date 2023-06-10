CREATE TABLE hello (
id integer not null unique auto_increment,
url varchar(255) not null,
comment varchar(255) NULL,
primary key (id)
);

insert into hello (url, comment) values (
"https://github.com/MaximStroev2004/mysql_hw.git",
"Homework №1"
);