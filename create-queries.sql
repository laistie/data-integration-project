-- creating tables

CREATE TABLE SOuser (
    userId INT,
    age INT,
    country VARCHAR(255),
    edlevel VARCHAR(255),
    yearscode INT,
    CONSTRAINT pk_SOuser PRIMARY KEY(userId)
);

CREATE TABLE learn (
    resourceType VARCHAR(255),
    SOuserId INT,
    CONSTRAINT pk_learn PRIMARY KEY (resourceType, SOuserId),
    CONSTRAINT fk_SOuserId FOREIGN KEY (SOuserId) REFERENCES SOuser(userId)
);