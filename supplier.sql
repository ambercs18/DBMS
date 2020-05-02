create table supplier(
sid int,
sname varchar(30),
city varchar(30),
primary key(sid)
);

create table parts(
pid int,
pname varchar(30),
color varchar(30),
primary key(pid)
);

create table catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid) references supplier(sid),
foreign key(pid) references parts(pid)
);

insert into supplier values(10001,'acme widget','bangalore'),(10002,'johns','kolkata'),(10003,'vimal','mumbai'),
(10004,'reliance','delhi');

insert into parts values(20001,'book','red'),(20002,'pen','red'),(20003,'pencil','green'),(20004,'mobile','green'),
(20005,'charger','black');

insert into catalog values(10001,20001,10),(10001,20002,10),(10001,20003,30),(10001,20004,10),(10001,20005,10),
(10002,20001,10),(10002,20002,20),(10003,20003,30),(10004,20003,40);

select distinct supplier.sid 
from supplier,parts,catalog
where parts.pid=catalog.pid and supplier.sid=catalog.sid and parts.color in ('red','green');

select distinct supplier.sid
from supplier,parts,catalog
where parts.pid=catalog.pid and supplier.sid=catalog.sid and parts.color='red' or supplier.city='bangalore';

select distinct c1.sid as fir,c2.sid as sec
from catalog c1,catalog c2
where   c1.cost>c2.cost and c1.sid!=c2.sid and c1.pid=c2.pid
