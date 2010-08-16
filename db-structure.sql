SET FOREIGN_KEY_CHECKS=0;
SET storage_engine=INNODB;

create table address (
	id int unsigned not null auto_increment
	, street varchar(50) not null
	, house_number int unsigned not null
	, addition varchar(20) null
	, postal_code varchar(6) not null
	, city varchar(30) not null
	, primary key( id )
);

create table category (
	id int unsigned not null auto_increment
	, name varchar(30) not null
	, description text null
	, primary key( id )
);

create table location (
	id int unsigned not null auto_increment
	, datahamster_id int unsigned not null
	, name varchar(50) not null
	, foreign key( datahamster_id ) references datahamster( id )
	, primary key( id )
);

create table datahamster ( 
	id int unsigned not null auto_increment
	, address_id int unsigned not null
	, category_id int unsigned not null
	, parent_id int unsigned null
	, name varchar(50) not null
	, department varchar(50) null
	, web varchar(100) null
	, email varchar(50) null
	, primary key( id )
	, foreign key( address_id ) references address( id )
	, foreign key( category_id ) references category( id )
	, foreign key( parent_id ) references datahamster( id )
);

create table datahamster_extra (
    id int unsigned not null auto_increment
    , datahamster_id int unsigned not null
    , `key` varchar(50) not null
    , `value` text not null
    , primary key( id )
    , foreign key( datahamster_id ) references datahamster( id )
);

create table user (
    id int unsigned not null auto_increment
    , name varchar(10) not null
    , realname varchar(40)
    , password varchar(50) not null
    , primary key( id )
    , unique key( name )
);

SET FOREIGN_KEY_CHECKS=1;