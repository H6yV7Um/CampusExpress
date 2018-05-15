--查询当前用户下所有表
select * from user_tables


--普通用户表
create table zusers(
    uuid int primary key,--用户编号
	upwd varchar2(40) not null,--密码
    uname varchar2(30) not null,--昵称
    urelname varchar2(30) not null,--真实姓名
    uphone varchar2(40) unique not null,--电话
    uemail varchar2(50) not null,--邮箱
    usex int check(usex in(1,0)) ,--性别  0男，1女
    upicture varchar2(200),-- 用户头像
	uaddr varchar2(100) not null, --用户地理位置 (学校)
	utype int default 0 check (utype in(0,1) ) ,--是否成为代递员  0否  1是
	ustatus int default 0 check (ustatus in(0,1,2) ), -- 用户的状态  0正常使用中  1禁言  2删除
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)


select 1 from zusers where uphone ='13237343452' and upwd='qqq'
update zusers set utype=0   where uuid=1
select * from zusers where uphone ='13237343452'
drop table zusers;
delete zusers
drop sequence seq_zusers;
create sequence seq_zusers start with 1000;
update zusers set upicture='image/3.jpg' where uuid=1002;
insert into zusers  values(seq_zusers.nextval,'a','xkj','肖坤跻','18188970547','382418631@qq.com',0,'3.jpg','皇家工学院',0,0,null,null);
insert into zusers  values(seq_zusers.nextval,'a','xkj_1','肖坤跻','13237343452','1767822853@qq.com',1,'3.jpg','皇家工学院',1,0,null,null);

update zusers set uname='莫甘娜' , upicture='3.jpg' ,uaddr='日俄大学',uemail='19145888314@qq.com',usex='男' where uphone='18188970546'

select * from(
select ad.*,rownum rn from
(select * from ZUSERS) ad
where  4> rownum
)where rn >1

--管理员表
create table  zadmin(
	adid int primary key,--管理员编号
	adpwd varchar2(40) not null,--管理员密码
	adname varchar2(30) not null,--管理员姓名
	adsex int check(adsex in(0,1)),--性别  0男，1女
	adphone varchar2(50) not null,--管理员电话
	adrank int default 0  check (adrank in(0,1) ) ,--管理员等级（0普通管理员，1超级管理员）
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
create sequence seq_adminId start with 1000
select * from zadmin
insert into zadmin values(seq_adminId.nextval,'a','xkj',0,'13237343452',0,null,null);




--代递员表
create table dusers(
    did int primary key,--代递员编号201
	uuid int unique references zusers(uuid) on delete cascade,--普通用户编号1001
    dsid varchar2(30) not null,--认证学号
    dspic varchar2(300) not null,--学生证图片
	dscore  varchar2(30) not null, --信誉度评分累计
	dnum  varchar2(30) default 0  not null,--接单次数
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
update dusers set dnum=10+1 where did=220;
delete dusers;

select * from dusers  where did=201;

drop table dusers;
drop sequence seq_dusers;

create sequence seq_dusers start with 200;
insert into dusers values(seq_dusers.nextval,1001,'1420140315','/zxdImg/4.jpg','0','0',null,null)

--收货地址表
create table zaddr(
	zid int primary key,--地址编号
    uuid int references zusers(uuid) on delete cascade,--引用用户编号
	zaddr varchar2(200) not null,--地址
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
drop table zaddr;
drop sequence seq_zid
create sequence seq_zid start with 100001;

insert into zaddr values(seq_zid.nextval,1001,'RZ-17 312寝室',null,null);


select * from zaddr where zid='100030';



--投单表（寄件记录）
create table zorders(
	oid int primary key,   --投单编号，一般可以考虑引用物流单号，10011
    uuid int references zusers(uuid) on delete cascade,--投单人用户编号1002
    otime date default sysdate not null,--投单时间
	ocode varchar2(30) not null,--取货码
    odesc varchar2(100) not null,--投单描述（期望送达时间）
	zid int references zaddr(zid) on delete cascade,--投单人地址编号
    oprice varchar2(30) not null,--代递金额
	otype varchar2(30) not null,--快递类型
	zostatus varchar2(50),--接单状态
	zonum varchar2(50), --接单数目
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)

create sequence seq_zorders start with 10000;

select zo.*,zaddr oaddr from zorders zo,zaddr za where oid in(select oid from zaccept where did=(select did from dusers where uuid=1000) ) and zo.zid=za.zid and zo.uremain1='已接单';
select * from zorders
select distinct otype,count(otype) num from zorders group by otype order by count(otype) desc;

update zorders set uremain1='未接单',uremain2='0'

select zo.*,za.zaddr oaddr from zorders zo left join zaddr za on
zo.zid=za.zid
where zo.uuid=1004;

select distinct otype,count(otype) num from zorders group by otype order by count(otype) desc;

drop table zorders;
drop sequence seq_zorders;

insert into zorders values (seq_zorders.nextval,1001,sysdate,'6789','wusuowuo午',100001,'5','圆通快递',null,null);



update zorders set uremain1='未接单';

delete from zorders;

select * from
(select zd.* ,rownum rn from
(select oid,uname,upicture,otime,orelname,ocode,osize,odesc,zaddr,oprice,otype
from ZORDERS o,ZUSERS u,ZADDR a where o.uuid=u.uuid and o.zid=a.zid and o.otype='圆通快递')zd where rownum>=1)where rn<5;


--接单表（由系统分配）
create table zaccept(
	aid int primary key,--接单编号20001
	oid int references zorders(oid) on delete cascade,--投单编号10011
	did int references dusers(did) on delete cascade,--接单人编号201--》即1001
	adesc varchar2(30) not null,--接单描述（预计到达时间）
	ztime date not null,  -- 接单时间
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
create sequence seq_zaccept start with 20000;
insert into zaccept values(seq_zaccept.nextval,202,'保证晚上5点之前送达',sysdate,null,null);
select * from zaccept;


update zaccept set uremain2='1' where aid=30003;
drop table zaccept;

--订单表()
create table orders(
	ooid int primary key,--订单编号
	aid int references zaccept(aid) on delete cascade,--接单编号20001
	oscore varchar2(20) , --评分
	ostatus int default 0 check (ostatus in(-1,0,1,2)),  --订单状态  -1订单取消，0等待收货，1订单完成，2等待评价
	uremain1 varchar2(50),
	uremain2 varchar2(50)
)
update orders set ostatus='等待收货' where ooid in(100000,100001,100002);
drop table orders;
drop sequence seq_orders;

create sequence seq_orders start with 100000;
insert into orders values(seq_orders.nextval,20001,10000,'0',1,null,null);
select * from orders;

select otime,otype,odesc,zaddr from orders o,zaccept za,zorders zo,zaddr zr where o.ooid=100020 and o.aid=za.aid and za.oid=zo.oid and zo.zid=zr.zid;

select distinct os.ooid，zo.otime,zo.osize,zo.odesc,ad.zaddr,zo.oprice,zo.otype,os.ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and
za.oid=zo.oid and  zo.zid=ad.zid and zo.uuid=1002

--创建投单和地址的视图
create OR REPLACE  view zorders_addr
as
select
zorders.oid,zorders.uuid,zorders.otime,zorders.ocode,zorders.odesc,zorders.oprice,zorders.otype,zaddr.zaddr,zusers.urelname
from zorders
join zaddr
on zorders.zid=zaddr.zid
join zusers
on zorders.uuid=zusers.uuid;


select * from zorders_addr

select z.uuid 投单人编号
from zusers z,dusers d where z.uuid=d.uuid and d.did=(select distinct du.did from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and
za.oid=zo.oid and  zo.zid=ad.zid and zo.uuid=1002);

select za.aid,za.did,du.uuid,du.dscore,zu.upicture,za.adesc,za.ztime from zaccept za
right join dusers du on za.did=du.did
right join zusers zu on du.uuid=zu.uuid
where za.oid=10040;

select distinct du.did,os.ooid,otime,osize,odesc,zaddr,oprice,otype,upicture,ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and
za.oid=zo.oid and za.did=du.did  and  zo.zid=ad.zid and zo.uuid=1002 ;

select d.uuid,uname from zusers z,dusers d where z.uuid=d.uuid and d.did=201;

select a.did,otime,ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus from
(select distinct du.did
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where os.aid=za.aid and
za.oid=zo.oid and za.did=du.did  and  zo.zid=ad.zid and zo.uuid=1002 )a right join
(select distinct du.did,otime,os.ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus
from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu  where za.aid=os.aid and
za.oid=zo.oid and za.did=du.did and zo.zid=ad.zid and zo.uuid=1002 and ostatus='订单取消' )b on a.did=b.did order by otime;
<<<<<<< HEAD


--订单id,投单人姓名,接单人昵称
select * from
		(select od.* ,rownum rn from
		(select
		a.did,otime,ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus from
		(select distinct du.did
		from zorders zo,zaccept za,orders os, dusers
		du,zaddr ad, zusers zu where
		os.aid=za.aid and
		za.oid=zo.oid and
		za.did=du.did and zo.zid=ad.zid and zo.uuid=1002 )a right join
		(select distinct
		du.did,otime,os.ooid,osize,odesc,zaddr,oprice,otype,upicture,ostatus
		from zorders zo,zaccept za,orders os, dusers du,zaddr ad, zusers zu
		where za.aid=os.aid and
		za.oid=zo.oid and za.did=du.did and
		zo.zid=ad.zid and zo.uuid=1002 and ostatus='等待评价')b on
		a.did=b.did
		order by otime)od
		where 5>=rownum)
		where rn>0;
=======
za.oid=zo.oid and za.did=du.did and zo.zid=ad.zid and zo.uuid=1002 and ostatus='等待评价' )b on a.did=b.did order by otime;
>>>>>>> branch 'master' of git@github.com:soIlove/zhaixiaodi.git




