drop database if exists recepcija;
create database recepcija character set utf8;
use recepcija;

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


insert into sef(sifra,ime,prezime,placa,email) values
(null,'Zoran','Tomčić',8000.00,'zorantomcic@gmail.com');

insert into posao(sifra,naziv,placa) values
(null,'Recepcionar',6000.00),
(null,'Portir',5200.00),
(null,'Noćni recepcionar',5700.00),
(null,'Pomoćni recepcionar',4800.00);

insert into recepcija(sifra,sef,radnovrijeme,brojtelefona) values
(null,1,'0-24','032420108');

insert into djelatnik(sifra,ime,prezime,email,posao,recepcija) values
(null,'Bernard','Pavlović','bernardpavlovic@gmail.com',1,1),
(null,'Roman','Janković',null,1,1),
(null,'Tonka','Petrović',null,1,1),
(null,'Ante','Vukoja',null,1,1),
(null,'Gordana','Radić',null,2,1),
(null,'Jolanda','Lončar','jolandaloncar@gmail.com',2,1),
(null,'Antonio','Kolarić','antoniokolaric@gmail.com',3,1),
(null,'Dubravko','Horvat',null,4,1);

insert into usluga(sifra,naziv,cijenaponocenju) values
(null,'Noćenje s doručkom u jednokrevetnoj sobi',350.00),
(null,'Noćenje s doručkom u dvokrevetnoj sobi',320.00),
(null,'Noćenje s doručkom u apartmanu',500.00),
(null,'Noćenje s polupansionom u jednokrevetnoj sobi',400.00),
(null,'Noćenje s polupansionom u dvokrevetnoj sobi',380.00),
(null,'Noćenje s polupansionom u apartmanu',575.00),
(null,'Noćenje s pansionom u jednokrevetnoj sobi',430.00),
(null,'Noćenje s pansionom u dvokrevetnoj sobi',410.00),
(null,'Noćenje s pansionom u apartmanu',620.00),
(null,'Čuvanje prtljage',25.00);

insert into korisnik(sifra,ime,prezime,oib,datumrodenja) values
(null,'Zoran','Horvat','83666361444',"1984-10-24"),
(null,'Ivan','Stankić','95891366101',"1993-04-13"),
(null,'Andrija','Jugovac','77894844566',"1990-03-05"),
(null,'Ante','Đurić','46189991598',"1988-05-14"),
(null,'Marija','Kovačić','22289340362',"1975-12-24"),
(null,'Bojana','Lončar','26551968464',"1986-11-23"),
(null,'Krunoslav','Kovačević','19305540968',"1979-10-22"),
(null,'Tena','Horvat','65133628998',"1995-09-21");

insert into djelatnik_usluga(djelatnik,usluga) values
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9);

insert into korisnik_usluga(korisnik,usluga,datumpocetka,datumkraja,ukupnacijena) values
(1,2,"2021-11-20 15:45:00","2021-11-25 12:00:00",1750.00),
(2,3,"2021-11-20 16:10:00","2021-11-23 12:00:00",1500.00),
(3,4,"2021-11-20 17:05:00","2021-11-26 12:00:00",2400.00),
(4,5,"2021-11-20 17:30:00","2021-11-24 12:00:00",1520.00),
(5,6,"2021-11-20 18:25:00","2021-12-01 12:00:00",5175.00),
(6,7,"2021-11-20 19:30:00","2021-11-26 12:00:00",2580.00),
(7,8,"2021-11-20 19:45:00","2021-11-23 12:00:00",1230.00),
(8,9,"2021-11-20 20:15:00","2021-11-25 12:00:00",3100.00);