
create table tblHome (
	seq	number	NOT NULL,
	pid	varchar2(15)	NOT NULL,
	tseq	number	NOT NULL,
	rseq	number	NOT NULL,
	name	varchar2(60)	NOT NULL,
	location	varchar2(150)	NOT NULL,
	enterhome	varchar2(100)	NOT NULL,
	outerhome	varchar2(100)	NOT NULL
);

CREATE TABLE tblUser (
	id	varchar2(15)	NOT NULL,
	gseq	number	NOT NULL,
	pw	varchar2(20)	NOT NULL,
	name	varchar2(15)	NOT NULL,
	tel	varchar2(11)	NOT NULL,
	birth	date	NOT NULL,
	gender	varchar2(3)	NOT NULL,
	email	varchar2(50)	NOT NULL
);

CREATE TABLE tblBoard (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	cseq	number	NOT NULL,
	subject	varchar2(120)	NOT NULL,
	content	varchar2(1000)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblCar (
	seq	number	NOT NULL,
	fseq	number	NOT NULL,
	hseq	number	NOT NULL,
	ctseq	number	NOT NULL,
	pid	varchar2(15)	NOT NULL,
	rseq	number	NOT NULL,
	location	varchar2(150)	NOT NULL,
	mileage	number	NOT NULL,
	geartype	varchar2(1)	NOT NULL,
	price	number	NOT NULL,
	rentstart	varchar2(100)	NOT NULL,
	rentend	varchar2(100)	NOT NULL
);

CREATE TABLE tblUserCoupon (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	cseq	number	NOT NULL
);


CREATE TABLE tblActivity (
	seq	number	primary key,
	pid	varchar2(15)	NOT NULL,
	rseq	number	NOT NULL,
    name varchar2(100) not null,
	location	varchar2(150)	NOT NULL,
	period	date	NOT NULL,
	price	number	NOT NULL,
	path	varchar2(1000)	NOT NULL,
	fpath	varchar2(1000)	NOT NULL
);

CREATE TABLE tblPayment (
	seq	number	NOT NULL,
	blseq	number	NOT NULL,
	payment	varchar2(1)	NOT NULL
);

CREATE TABLE tblQuestion (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	cseq	number	NOT NULL,
	title	varchar2(120)	NOT NULL,
	content	varchar2(1000)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblAnswer (
	seq	number	NOT NULL,
	qseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblHomeBook (
	seq	number	NOT NULL,
	rseq	number	NOT NULL,
	pseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	bseq	number	NOT NULL,
	bsseq	number	NOT NULL,
	startdate	date	NOT NULL,
	enddate	date	NOT NULL
);

CREATE TABLE tblRoom (
	seq	number	NOT NULL,
	hseq	number	NOT NULL,
	name	varchar2(50)	NOT NULL,
	price	number	NOT NULL,
	path	varchar2(1000)	NOT NULL,
	fpath	varchar2(1000)	NOT NULL
);

CREATE TABLE tblComment (
	seq	number	NOT NULL,
	bseq	number	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblActivityBook (
	seq	number	NOT NULL,
	pseq	number	NOT NULL,
	aseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	blseq	number	NOT NULL,
	bsseq	number	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblCarBook (
	seq	number	NOT NULL,
	sseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	cseq	number	NOT NULL,
	bseq	number	NOT NULL,
	bsseq	number	NOT NULL,
	startdate	date	NOT NULL,
	enddate	date	NOT NULL
);

CREATE TABLE tblPayState (
	seq	number	NOT NULL,
	value	varchar2(10)	NOT NULL
);

CREATE TABLE tblFuel (
	seq	number	NOT NULL,
	value	varchar2(9)	NOT NULL
);

CREATE TABLE tblHeadcount (
	seq	number	NOT NULL,
	value	number	NOT NULL
);

CREATE TABLE tblCarType (
	seq	number	NOT NULL,
	value	varchar2(90)	NOT NULL
);

CREATE TABLE tblGrade (
	seq	number	NOT NULL,
	value	varchar2(15)	NOT NULL
);

CREATE TABLE tblCoupon (
	seq	number	NOT NULL,
	name	varchar2(100)	NOT NULL,
	enddate	date	NOT NULL
);

CREATE TABLE tblBookList (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL
);

CREATE TABLE tblCategory (
	seq	number	NOT NULL,
	value	varchar2(20)	NOT NULL
);

CREATE TABLE tblCarReview (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	rseq	number	NOT NULL,
	rating	number	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblHomeReview (
	seq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	hseq	number	NOT NULL,
	star	number	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblBookState (
	seq	number	NOT NULL,
	value	varchar2(15)	NOT NULL
);

CREATE TABLE tblHomeReply (
	seq	number	NOT NULL,
	rseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblActivityReview (
	seq	number	NOT NULL,
	rseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	startdate	number	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblCarReply (
	seq	number	NOT NULL,
	replyseq	number	NOT NULL,
	partnerid	varchar2(15)	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblOptionList (
   seq   number   NOT NULL,
   rseq   number   NOT NULL,
   bseq   number   NOT NULL,
   bath   varchar2(1)   default 'n' NOT NULL ,
   pet   varchar2(1)   DEFAULT 'n' NOT NULL   ,
   maxpeople   number DEFAULT 2   NOT NULL   ,
   smoke   varchar2(1) DEFAULT 'n'   NOT NULL   ,
   pool   varchar2(1)   DEFAULT 'n' NOT NULL   ,
   parking   varchar2(1)   DEFAULT 'n' NOT NULL   ,
   cook   varchar2(1)   DEFAULT 'n' NOT NULL   ,
   wifi   varchar2(1)   DEFAULT 'n' NOT NULL   
);



CREATE TABLE tblHomeType (
	seq	number	NOT NULL,
	value	varchar2(10)	NOT NULL
);

CREATE TABLE tblBedOption (
	seq	number	NOT NULL,
	value	varchar2(10)	NOT NULL
);

CREATE TABLE tblActivityReply (
	seq	number	NOT NULL,
	rseq	number	NOT NULL,
	id	varchar2(15)	NOT NULL,
	content	varchar2(300)	NOT NULL,
	regdate	date	NOT NULL
);

CREATE TABLE tblCity (
	seq	number	NOT NULL,
	value	varchar2(100)	NOT NULL
);

CREATE TABLE tblDistrict (
	seq	number	NOT NULL,
	cseq	number	NOT NULL,
	value	varchar2(100)	NOT NULL
);

CREATE TABLE tblSlang (
	seq	number	NOT NULL,
	value	varchar2(100)	NOT NULL
);

CREATE TABLE tblCarName (
	seq	number	NOT NULL,
	tseq	number	NOT NULL,
	path	varchar2(1000)	NOT NULL
);

CREATE TABLE tblRegState (
	seq	number	NOT NULL,
	value	varchar2(15)	NOT NULL
);

CREATE TABLE tblQuestionCategory (
	seq	number	NOT NULL,
	value	varchar2(30)	NOT NULL
);

ALTER TABLE tblHome ADD CONSTRAINT PK_TBLHOME PRIMARY KEY (
	seq
);

ALTER TABLE tblUser ADD CONSTRAINT PK_TBLUSER PRIMARY KEY (
	id
);

ALTER TABLE tblBoard ADD CONSTRAINT PK_TBLBOARD PRIMARY KEY (
	seq
);

ALTER TABLE tblCar ADD CONSTRAINT PK_TBLCAR PRIMARY KEY (
	seq
);

ALTER TABLE tblUserCoupon ADD CONSTRAINT PK_TBLUSERCOUPON PRIMARY KEY (
	seq
);

ALTER TABLE tblActivity ADD CONSTRAINT PK_TBLACTIVITY PRIMARY KEY (
	seq
);

ALTER TABLE tblPayment ADD CONSTRAINT PK_TBLPAYMENT PRIMARY KEY (
	seq
);

ALTER TABLE tblQuestion ADD CONSTRAINT PK_TBLQUESTION PRIMARY KEY (
	seq
);

ALTER TABLE tblAnswer ADD CONSTRAINT PK_TBLANSWER PRIMARY KEY (
	seq
);

ALTER TABLE tblHomeBook ADD CONSTRAINT PK_TBLHOMEBOOK PRIMARY KEY (
	seq
);

ALTER TABLE tblRoom ADD CONSTRAINT PK_TBLROOM PRIMARY KEY (
	seq
);

ALTER TABLE tblComment ADD CONSTRAINT PK_TBLCOMMENT PRIMARY KEY (
	seq
);

ALTER TABLE tblActivityBook ADD CONSTRAINT PK_TBLACTIVITYBOOK PRIMARY KEY (
	seq
);

ALTER TABLE tblCarBook ADD CONSTRAINT PK_TBLCARBOOK PRIMARY KEY (
	seq
);

ALTER TABLE tblPayState ADD CONSTRAINT PK_TBLPAYSTATE PRIMARY KEY (
	seq
);

ALTER TABLE tblFuel ADD CONSTRAINT PK_TBLFUEL PRIMARY KEY (
	seq
);

ALTER TABLE tblHeadcount ADD CONSTRAINT PK_TBLHEADCOUNT PRIMARY KEY (
	seq
);

ALTER TABLE tblCarType ADD CONSTRAINT PK_TBLCARTYPE PRIMARY KEY (
	seq
);

ALTER TABLE tblGrade ADD CONSTRAINT PK_TBLGRADE PRIMARY KEY (
	seq
);

ALTER TABLE tblCoupon ADD CONSTRAINT PK_TBLCOUPON PRIMARY KEY (
	seq
);

ALTER TABLE tblBookList ADD CONSTRAINT PK_TBLBOOKLIST PRIMARY KEY (
	seq
);

ALTER TABLE tblCategory ADD CONSTRAINT PK_TBLCATEGORY PRIMARY KEY (
	seq
);

ALTER TABLE tblCarReview ADD CONSTRAINT PK_TBLCARREVIEW PRIMARY KEY (
	seq
);

ALTER TABLE tblHomeReview ADD CONSTRAINT PK_TBLHOMEREVIEW PRIMARY KEY (
	seq
);

ALTER TABLE tblBookState ADD CONSTRAINT PK_TBLBOOKSTATE PRIMARY KEY (
	seq
);

ALTER TABLE tblHomeReply ADD CONSTRAINT PK_TBLHOMEREPLY PRIMARY KEY (
	seq
);

ALTER TABLE tblActivityReview ADD CONSTRAINT PK_TBLACTIVITYREVIEW PRIMARY KEY (
	seq
);

ALTER TABLE tblCarReply ADD CONSTRAINT PK_TBLCARREPLY PRIMARY KEY (
	seq
);

ALTER TABLE tblOptionList ADD CONSTRAINT PK_TBLOPTIONLIST PRIMARY KEY (
	seq
);

ALTER TABLE tblHomeType ADD CONSTRAINT PK_TBLHOMETYPE PRIMARY KEY (
	seq
);

ALTER TABLE tblBedOption ADD CONSTRAINT PK_TBLBEDOPTION PRIMARY KEY (
	seq
);

ALTER TABLE tblActivityReply ADD CONSTRAINT PK_TBLACTIVITYREPLY PRIMARY KEY (
	seq
);

ALTER TABLE tblCity ADD CONSTRAINT PK_TBLCITY PRIMARY KEY (
	seq
);

ALTER TABLE tblDistrict ADD CONSTRAINT PK_TBLDISTRICT PRIMARY KEY (
	seq
);

ALTER TABLE tblSlang ADD CONSTRAINT PK_TBLSLANG PRIMARY KEY (
	seq
);

ALTER TABLE tblCarName ADD CONSTRAINT PK_TBLCARNAME PRIMARY KEY (
	seq
);

ALTER TABLE tblRegState ADD CONSTRAINT PK_TBLREGSTATE PRIMARY KEY (
	seq
);

ALTER TABLE tblQuestionCategory ADD CONSTRAINT PK_TBLQUESTIONCATEGORY PRIMARY KEY (
	seq
);



ALTER TABLE `tblCarName` ADD CONSTRAINT `PK_TBLCARNAME` PRIMARY KEY (
	`seq`,
	`tseq`
);

ALTER TABLE `tblRegState` ADD CONSTRAINT `PK_TBLREGSTATE` PRIMARY KEY (
	`seq`
);

ALTER TABLE `tblQuestionCategory` ADD CONSTRAINT `PK_TBLQUESTIONCATEGORY` PRIMARY KEY (
	`seq`
);

