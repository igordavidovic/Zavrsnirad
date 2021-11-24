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

insert into posjeta(sifra,datumprijave,datumodjave,brojsoba,brojodraslih,brojdjece) values
(null,"2021-11-24","2021-11-29",1,2,0),
(null,"2021-11-28","2021-12-03",1,2,0),
(null,"2021-11-29","2021-12-04",1,2,1),
(null,"2021-11-29","2021-12-03",1,2,0),
(null,"2021-11-30","2021-12-04",2,2,2),
(null,"2021-11-30","2021-12-04",1,2,0),
(null,"2021-11-30","2021-12-07",1,2,0),
(null,"2021-12-01","2021-12-06",2,4,0),
(null,"2021-12-01","2021-12-05",1,2,0),
(null,"2021-12-02","2021-12-05",1,2,0);

insert into usluga(sifra,djelatnik,naziv,cijena) values
(null,3,'Pet noćenja sa doručkom u jednokrevetnoj sobi',2500.00),
(null,4,'Pet noćenja sa polupansionom u dvokrevetnoj sobi',2200.00),
(null,3,'Pet noćenja sa punim pansionom u dvokrevetnoj sobi',2300.00),
(null,4,'Četiri noćenja sa doručkom u dvokrevetnoj sobi',1800.00),
(null,5,'Četiri noćenja sa polupansionom u jednokrevetnoj sobi',1950.00),
(null,5,'Četiri noćenja sa polupansionom u dvokrevetnoj sobi',1750.00),
(null,5,'Četiri noćenja sa punim pansionom u jednokrevetnoj sobi',1900.00),
(null,7,'Sedam noćenja sa polupansionom u jednokrevetnoj sobi',3200.00),
(null,7,'Pet noćenja sa doručkom u jednokrevetnoj sobi',2400.00),
(null,7,'Pet noćenja sa doručkom u jednokrevetnoj sobi',2500.00),
(null,6,'Pet noćenja sa polupansionom u dvokrevetnoj sobi',2300.00),
(null,8,'Četiri noćenja sa punim pansionom u jednokrevetnoj sobi',1950.00);

insert into posjeta_usluga(posjeta,usluga) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(5,6),
(6,7),
(7,8),
(8,9),
(8,10),
(9,11),
(10,12);