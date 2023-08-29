use Translation_Agency;

create table ClientMultiplierClass
(
    Id int primary key IDENTITY,
    NameClient NVARCHAR(30),
    FeeMultiplier float  
);

create table Client 
(
    Id int primary key IDENTITY,
    ContactName NVARCHAR(30),
    ClientMultiplier int references ClientMultiplierClass(Id),
    Tlf VARCHAR(20) UNIQUE,
    Address VARCHAR(max) UNIQUE
); 

create table Categories
(
    Id int primary key identity,
    CategoryName nvarchar(11) not null,
    OralFee float,
    WrittenFee float,
    PhoneFee float,
    TransportCostFee float,
    TransportTimeFee float
);

create table Translators
(
    Id int primary key identity,
    FirstName nvarchar(20) not null,
    LastName nvarchar(20) not null,
    DateOfEmployment date not null,
    Age int default 18 check(Age >= 18 and Age <= 70),
    CityAddress nvarchar(max) not null,
    StreetNrAddress nvarchar(max) not null,
    Email varchar(30) unique,
    Tlf varchar(20) unique,
    Education nvarchar(40) not null,
    Experience float not null               -- TODO total sum
);

create table Languages
(
    Id int primary key identity,
    NameOfLang nvarchar(20) not null
);

create table TranslatorLanguagesJunction
(  
    Id int primary key identity,                -- field of no use, but necessary for constructing tables
    TranslatorId int references Translators(Id),
    LanguagesId int references Languages(Id),
    CategoryId int references Categories(Id)
);


create table Reviews
(  
    Id int primary key identity,
    TaskId int references Tasks(Id) not null,
    DateOfReview date not null,
    ReviewBody nvarchar(max),
    Stars int default 0 check(Stars >= 0 and Stars <= 5)
);

create table Tasks
(
    Id int primary key IDENTITY,
    DateOfTask date not null,
    StartTime time not null,
    EndTime time not null,
    Urgent bit,                                                    -- both implemented in C#
    Difficult bit,
    TranslationID int references TranslatorLanguagesJunction(Id),  -- references concrete translator and her language used
    ClientId int references Client (Id) on delete cascade,        -- 'has a'-relationship between task and clint
    ReviewId int references Reviews(Id) on delete cascade
);

create table Experince
(  
    id int primary key identity,
    EmploymentDate date not null,
    DismissalDate time not null,
    TotalTimeAtCompany float,           -- TODO difference 
    Position nvarchar (100) not null,
    CompanyName nvarchar(100) not null,
    TranslatorID int references Translators(Id) on delete cascade
);


