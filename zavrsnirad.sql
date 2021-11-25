drop database if exists recepcija;
create database recepcija character set utf8;
use recepcija;

create table posjeta(
    sifra int not null primary key auto_increment,
    datumprijave date not null,
    datumodjave date not null,
    brojsoba int not null,
    brojodraslih int not null,
    brojdjece int not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    uloga varchar(50),
    email varchar(50),
    placa decimal(18,2)
);

create table usluga(
    sifra int not null primary key auto_increment,
    djelatnik int not null,
    naziv varchar(100) not null,
    cijena varchar(50)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    datumrodenja date
);

create table posjeta_usluga(
    posjeta int not null,
    usluga int not null
);


alter table usluga add foreign key(djelatnik) references djelatnik(sifra);

alter table posjeta_usluga add foreign key(posjeta) references posjeta(sifra);
alter table posjeta_usluga add foreign key(usluga) references usluga(sifra);

