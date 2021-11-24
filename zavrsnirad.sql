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
    naziv varchar(50) not null,
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

create table korisnik_usluga(
    korisnik int not null,
    usluga int not null
);

alter table usluga add foreign key(djelatnik) references djelatnik(sifra);

alter table korisnik_usluga add foreign key(usluga) references usluga(sifra);
alter table korisnik_usluga add foreign key(korisnik) references korisnik(sifra);

alter table posjeta_usluga add foreign key(posjeta) references posjeta(sifra);
alter table posjeta_usluga add foreign key(usluga) references usluga(sifra);

insert into korisnik(sifra,ime,prezime,oib,datumrodenja) values
(null,'Zoran','Horvat','83666361444',"1984-10-24"),
(null,'Ivan','Stankić','95891366101',null),
(null,'Andrija','Jugovac','77894844566',"1990-03-05"),
(null,'Ante','Đurić',null,null),
(null,'Marija','Kovačić','22289340362',"1975-12-24"),
(null,'Bojana','Lončar','26551968464',"1986-11-23"),
(null,'Krunoslav','Kovačević',null,"1979-10-22"),
(null,'Tena','Horvat','65133628998',null);

insert into djelatnik(sifra,ime,prezime,uloga,email,placa) values
(null,'Bernard','Pavlović','Šef recepcije','bernardpavlovic@gmail.com',8000.00),
(null,'Roman','Janković','Zamjenik šefa recepcije',null,6800.00),
(null,'Tonka','Petrović','Recepcionarka',null,null),
(null,'Ante','Vukoja','Recepcionar',null,null),
(null,'Gordana','Radić','Recepcionarka',null,5750.00),
(null,'Jolanda','Lončar','Pomoćna recepecionarka','jolandaloncar@gmail.com',5000.00),
(null,'Antonio','Kolarić','Recepcioinar','antoniokolaric@gmail.com',5800.00),
(null,'Dubravko','Horvat','Noćni recepcionar',null,null);