drop database if exists recepcija;
create database recepcija character set utf8;
use recepcija;

create table šef(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    plaća decimal(18,2),
    email varchar(50)
);

create table recepcija(
    sifra int not null primary key auto_increment,
    šef int not null,
    radnovrijeme time not null,
    brojtelefona varchar(50) not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    posao int not null,
    recepcija int not null
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    placa decimal(18,2) not null
);


