create table notice (
n_num int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16384) not null,
n_regdate datetime not null
);