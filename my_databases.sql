CREATE TABLE _Publish_Companye (
	Publish_Id int NOT NULL,
    Company_Name varchar(10) NOT NULL,
    Address varchar(10) NOT NULL,
    Email_company varchar(10) NOT NULL,
	PRIMARY KEY (Publish_Id)
     
);

CREATE TABLE _Authore (
	Author_Id int NOT NULL,
    Fname varchar(10) NOT NULL,
    Lname varchar(10) NOT NULL,
    Email_Author varchar(255) NOT NULL UNIQUE,
    Contact_Author varchar(10) NOT NULL UNIQUE,
    Publish_Id int NOT NULL,  
	PRIMARY KEY(Author_Id),
	FOREIGN KEY (Publish_Id) REFERENCES _Authore(Author_Id)
);

CREATE TABLE _Booke(
	
	Book_Id int NOT NULL,
	Book_Title varchar(10) NOT NULL UNIQUE,
	Book_Price Bigint NOT NULL,
	Book_Description varchar(15) NOT NULL,
	Publish_Date date NOT NULL,
	Publish_Year date NOT NULL,
	ISBN_Number bigint NOT NULL,
	Book_Copies bigint NOT NULL,
	Author_Id int NOT NULL,
	Book_Image bit NOT NULL,
	FOREIGN KEY (Author_Id) REFERENCES _Booke(Book_Id),
	PRIMARY KEY (Book_Id)
   
);

CREATE TABLE _Borrowing_Detailse(
	Borrower_Id int NOT NULL,
    Borrow_Date date NOT NULL,
    Return_Date date NOT NULL,
    Book_Id int NOT NULL,
    User_Id int NOT NULL,
    Librarian_Id int NOT NULL,
    Shift_Id int NOT NULL,
	Book_status varchar (5) NOT NULL,
    Borrow_times int null,
    PRIMARY KEY (Borrower_Id),
    FOREIGN KEY (Book_Id) REFERENCES _Borrowing_Detailse(Borrower_Id),
    FOREIGN KEY (Librarian_Id)REFERENCES _Borrowing_Detailse(Borrower_Id),
    FOREIGN KEY (Shift_Id) REFERENCES _Borrowing_Detailse(Borrower_Id),
    FOREIGN KEY (User_Id)REFERENCES _Borrowing_Detailse(Borrower_Id)
        
);

CREATE TABLE _Librariane(
	Librarian_Id int NOT NULL,
    Fname varchar(10) NOT NULL,
    Lname varchar(10) NOT NULL,
    email_address varchar(15) NOT NULL UNIQUE,
    Tel_Number varchar(15) NOT NULL UNIQUE,
    Password_ON varchar(10) NOT NULL,
    Shift_Id int NOT NULL,
    PRIMARY KEY (Librarian_Id),
    FOREIGN KEY (Shift_Id)REFERENCES _Librariane (Librarian_Id)  
        
);

CREATE TABLE _Library_Usere(
	User_Id int NOT NULL,
    Fname varchar(10)NOT NULL,
    Lname varchar(10)NOT NULL,
    Contact varchar(15) NOT NULL UNIQUE,
    Address varchar(10) NOT NULL,
    Email varchar(15) NOT NULL,
    Shift_Id int NOT NULL,
    Book_Id int NOT NULL,
    PRIMARY KEY (User_Id),
    FOREIGN KEY (Book_Id) REFERENCES _Library_Usere(User_Id),
    FOREIGN KEY (Shift_Id) REFERENCES _Library_Usere (User_Id)
        


);


CREATE TABLE _Shifte(
	shift_id  int NOT NULL,
    shift_name  varchar(10) NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL,
    PRIMARY KEY (shift_id)
       

);

INSERT INTO _Shifte(
	Shift_id,
	shift_name,
	start_time,
	end_time

)
VALUES(
	20,'morning',0500,2200

);

INSERT INTO _Authore (Author_Id ,
    Fname ,
    Lname ,
    Email_Author ,
    Contact_Author ,
    Publish_Id )
VALUES (1,'Shellah','Emmanuella','shellahemmanuella@gmail.com',+235-123-456,201);

INSERT INTO _Librariane(
	Librarian_Id,
    Fname,
    Lname,
    email_address,
    Tel_Number,
    Password_ON,
    Shift_id
)
VALUES(01,'Harriet','Twinkle','harrie03@gmail.com',02345678,76865,20);

INSERT INTO _Library_Usere(
	User_Id ,
    Fname ,
    Lname ,
    Contact ,
    Address ,
    Email ,
    Shift_Id ,
    Book_Id 
)
VALUES(10,'Melodie','Queens',302345213,'windsor street','melo23@yahoo.com',20,31);

INSERT INTO _Booke(
	Book_Id ,
	Book_Title ,
	Book_Price ,
	Book_Description ,
	Publish_Date ,
	Publish_Year ,
	ISBN_Number ,
	Book_Copies,
	Author_Id,
	Book_Image,
    Book_status
	


)

VALUES(001,'Jane Ayre',23000,'romatic drama',1000-01-01,1000,30000,1,'no');

INSERT INTO _Publish_Companye(
	Publish_Id ,
    Company_Name ,
    Address ,
    Email_company 
)
VALUES(
201,'Teach and Learn','Ntinda-Kampala','teachl@yahoo.com'

);

INSERT INTO _Borrowing_Detailse(
	Borrower_Id ,
    Borrow_Date ,
    Return_Date ,
    Book_Id ,
    User_Id ,
    Librarian_Id ,
    Shift_Id ,
	Book_status 
)

VALUES(
301,2019-12-12,2020-11-1,001,10,01,20,'no'
);


SELECT * FROM _Authore;

SELECT * FROM _Librariane
WHERE shift_Id=20;

SELECT User_Id FROM _Borrowing_Detailse
WHERE book_status='No' ;

SELECT Author_Id, Publish_Id 
FROM _Authore;

SELECT COUNT(Book_Id)
FROM _Booke
WHERE Book_Id=001 and Author_Id=1;

SELECT COUNT(Borrow_times)
FROM _Borrow_Detailse
WHERE User_Id=10;



