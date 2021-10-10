load data inpath '${INPUTPATH}' overwrite into table ${TBLNAME};

insert overwrite table ${EXTTBLNAME}
select a.custid,a.firstname,a.lastname,a.city,a.age,a.createdt,a.transactamt,a.upddt from ${TBLNAME} a
union
select b.custid,b.firstname,b.lastname,b.city,b.age,b.createdt,b.transactamt,b.upddt from ${EXTTBLNAME} b where b.custid not in (select a.custid from ${TBLNAME} a);
