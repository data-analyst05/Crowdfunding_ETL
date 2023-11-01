-- SQL query

-- For the category.csv file:
CREATE TABLE Category (
    category_id VARCHAR(10) NOT NULL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- For the subcategory.csv file:
CREATE TABLE SubCategory (
    subcategory_id VARCHAR(10) NOT NULL PRIMARY KEY,
    subcategory_name VARCHAR(255) NOT NULL
);

-- For the contacts.csv file:
CREATE TABLE Contacts (
    contact_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- For the campaign.csv file:
CREATE TABLE Campaign (
    cf_id INT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    goal FLOAT NOT NULL,
    pledged FLOAT NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    launch_date INT NOT NULL,
    end_date INT NOT NULL,
    category_id VARCHAR(10) NOT NULL,
    subcategory_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES SubCategory(subcategory_id),
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);
