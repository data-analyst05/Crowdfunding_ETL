-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- For the category.csv file:
CREATE TABLE "Category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);
-- For the subcategory.csv file
CREATE TABLE "SubCategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_SubCategory" PRIMARY KEY (
        "subcategory_id"
     )
);
-- For the contacts.csv file:
CREATE TABLE "Contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "email" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     ),
    CONSTRAINT "uc_Contacts_email" UNIQUE (
        "email"
    )
);
-- For the campaign.csv file:
CREATE TABLE "Campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(255)   NOT NULL,
    "description" TEXT   NOT NULL,
    "goal" NUMERIC(10,2)   NOT NULL,
    "pledged" NUMERIC(10,2)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(50)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "SubCategory" ("subcategory_id");


/* ERD query

Category
---
category_id PK VARCHAR(10)
category_name VARCHAR(255)

SubCategory
---
subcategory_id PK VARCHAR(10)
subcategory_name VARCHAR(255)

Contacts
---
contact_id PK INT 
first_name VARCHAR(255)
last_name VARCHAR(255)
email VARCHAR(255) UNIQUE 

Campaign
---
cf_id PK INT
contact_id INT  FK >- Contacts.contact_id
company_name VARCHAR(255) 
description TEXT 
goal NUMERIC(10,2) 
pledged NUMERIC(10,2)
backers_count INT 
country VARCHAR(50)
currency VARCHAR(10)
launch_date DATE 
end_date DATE 
category_id VARCHAR(10) FK >- Category.category_id
subcategory_id VARCHAR(10) FK >- SubCategory.subcategory_id

*/
