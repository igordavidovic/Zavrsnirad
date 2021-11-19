drop database if exists recepcija;
create database recepcija character set utf8;
use recepcija;

create table sef(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    plaća decimal(18,2),
    email varchar(50)
);

create table recepcija(
    sifra int not null primary key auto_increment,
    sef int not null,
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

create table djelatnik_usluga(
    djelatnik int not null,
    usluga int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena varchar(50) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null,
    datumrodenja date,
    usluga int not null
);


alter table recepcija add foreign key(sef) references sef(sifra);

alter table djelatnik add foreign key(recepcija) references recepcija(sifra);

alter table djelatnik add foreign key(posao) references posao(sifra);

alter table djelatnik_usluga add foreign key(djelatnik) references djelatnik(sifra);
alter table djelatnik_usluga add foreign key(usluga) references usluga(sifra);

alter table korisnik add foreign key(usluga) references usluga(sifra);