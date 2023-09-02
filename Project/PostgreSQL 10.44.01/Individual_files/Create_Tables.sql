
CREATE TABLE Client (
    Id SERIAL PRIMARY KEY,
    ContactName VARCHAR(30),
	Login TEXT NOT NULL, 
	Password TEXT NOT NULL,
    Tlf VARCHAR(20) UNIQUE,											
    CityAddress VARCHAR(30),
	Street VARCHAR(50),
	HouseNr VARCHAR(20),
    FeeMultiplier FLOAT											
);

CREATE TABLE Category (
    Id SERIAL PRIMARY KEY,
    CategoryName VARCHAR(11) NOT NULL,
    OralFee FLOAT,
    WrittenFee FLOAT,
    PhoneFee FLOAT,
    TransportCostFee FLOAT,
    TransportTimeFee FLOAT
);


CREATE TABLE Translator (
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Age INT DEFAULT 18 CHECK (Age >= 18 AND Age <= 70),CityAddress VARCHAR(30),
	Street VARCHAR(50),
	HouseNr VARCHAR(20),
    Email VARCHAR(50) UNIQUE,
    Tlf VARCHAR(20) UNIQUE,
    Education TEXT NOT NULL
);


CREATE TABLE Language (
    Id SERIAL PRIMARY KEY,
    NameOfLang VARCHAR(20) NOT NULL
);

CREATE TABLE Translator_Competence (
    Id SERIAL PRIMARY KEY,
    TranslatorId INT REFERENCES Translator(Id),
    LanguageId INT REFERENCES Language(Id),
    CategoryId INT REFERENCES Category(Id)
);

CREATE TABLE Task (
    Id SERIAL PRIMARY KEY,
	TaskType VARCHAR(30) NOT NULL,
    DateOfTask DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Urgent INT,													
    Difficult INT,
	CityAddress VARCHAR(30) NULL,
	Street VARCHAR(50) NULL,
	HouseNr VARCHAR(20) NULL,
    TranslatorCompetenceID INT REFERENCES Translator_Competence(Id),	-- references concrete translator and her language used 
    ClientId INT REFERENCES Client(Id) ON DELETE CASCADE,		-- 'has a'-relationship between task and client
	TranslatorId INT REFERENCES Translator(Id) ON DELETE NO ACTION,
	LanguageID INT REFERENCES Language(Id) ON DELETE NO ACTION
);

CREATE TABLE Task_Review (
    Id SERIAL PRIMARY KEY,
    DateOfReview DATE NOT NULL,
    Body TEXT,
    Stars INT DEFAULT 0 CHECK (Stars >= 1 AND Stars <= 5),
    TaskId INT REFERENCES Task(Id) ON DELETE CASCADE,
	ClientId INT REFERENCES Client(Id) ON DELETE NO ACTION,
	TranslatorId INT REFERENCES Translator(Id) ON DELETE NO ACTION,
	LanguageID INT REFERENCES Language(Id) ON DELETE NO ACTION
);


CREATE TABLE Translator_Employment (
    Id SERIAL PRIMARY KEY,
    EmploymentDate DATE NOT NULL,   -- min employmentDate indtil i dag (fra 1.ansættelse til i dag)
    DismissalDate DATE,		        -- max dissmissalDate		(if NOT NULL then the translator must be employed and not be dissmissed)						
    Position TEXT NOT NULL,
    CompanyName TEXT NOT NULL,
    TranslatorID INT REFERENCES Translator(Id) ON DELETE CASCADE       -- group by Translator_ID
);



/* Statement for at hive experience ud af TRanslatorEmployment table:
1) aggregate function: AVG SUm MIN MAX group by Translator_ID and group by Translator_ID
2) DATEDIFF (dismissalD - employmentDate, then find the sum of differences (fordi ingen overlappende perioder, men i real life er det mere kompliceret fordi man kan arbejde flere steder på samme tid)

Constraint: translators kan kun arbejde i et firma ad gangen, men in real life kan hun være ansat flere steder samtidigt


drop TranslatorReviews og make statements that calculate the average score af alle reviewed tasks for en translator
TranslatorScore == average of all Translator's tasks.


join 4 tabeller for at vise en translators average review */ 




