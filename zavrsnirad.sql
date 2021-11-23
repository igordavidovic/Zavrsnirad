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
    email varchar(50)
);

create table djelatnik_usluga(
    djelatnik int not null,
    usluga int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijenaponocenju varchar(50) not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null,
    datumrodenja date
);

create table korisnik_usluga(
    korisnik int not null,
    usluga int not null,
    datumpocetka datetime not null,
    datumkraja datetime,
    ukupnacijena decimal(18,2)
);


alter table djelatnik_usluga add foreign key(djelatnik) references djelatnik(sifra);
alter table djelatnik_usluga add foreign key(usluga) references usluga(sifra);

alter table korisnik_usluga add foreign key(korisnik) references korisnik(sifra);
alter table korisnik_usluga add foreign key(usluga) references usluga(sifra);

