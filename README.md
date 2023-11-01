# Crowdfunding ETL Project

This project involves extracting data related to crowdfunding campaigns, transforming this data for better clarity and structure, and loading the cleaned data into a PostgreSQL database for further use and analysis.

## Overview

1. **Extract**: Data was extracted from two sources:
    - `crowdfunding.xlsx`: Contains details of various crowdfunding campaigns including their goals, pledges, backers count, and more.
    - `contacts.xlsx`: Contains contact information for various individuals associated with the campaigns.

2. **Transform**: The transformation steps included:
    - Creating separate DataFrames for categories and subcategories.
    - Renaming and reformatting certain columns for clarity.
    - Extracting first and last names from full names.
    - Converting certain columns to appropriate data types (e.g., float, datetime).
    - Merging relevant data from multiple sources.

3. **Load**: The transformed data was then loaded into a PostgreSQL database.
   - Created an ERD diagram from https://app.quickdatabasediagrams.com/ `ERD_quickDBD-export.sql`.
   - Create SQL table `Postgres.sql` and import the csv files into the database.

## Dependencies

- `pandas`
- `numpy`
- `openpyxl` (For reading `.xlsx` files with `pandas`)
- `psycopg2`
- `sqlalchemy`

## Setup & Execution

1. **Preparation**:
    - Ensure you have all dependencies installed.
    - Set up your PostgreSQL database and replace the database credentials in the connection setup.

2. **Execution**:
    - Run the notebook or script containing the ETL process. This will handle the extraction, transformation, and loading steps automatically.
    - Check your PostgreSQL database to confirm that the data has been loaded successfully.

## Data Model

1. **Contacts Table**:
    - `contact_id`: Unique identifier for the contact.
    - `first_name`: First name of the contact.
    - `last_name`: Last name of the contact.
    - `email`: Email address of the contact.

2. **Campaigns Table**:
    - `cf_id`: Unique identifier for the crowdfunding campaign.
    - `contact_id`: Identifier linking to the contacts table.
    - `company_name`: Name of the company or individual running the campaign.
    - (Other campaign-specific details...)

3. **Categories & Subcategories Tables**:
    - Separate tables for campaign categories and subcategories, each with its own unique identifier.

## Potential Uses

This cleaned and structured data can be used for various purposes such as:

- **Analysis**: Understand patterns in crowdfunding such as which categories are more popular, average pledges, etc.
- **Reporting**: Create reports to showcase the performance of various campaigns.
- **Integration**: Use this cleaned data as a source for other systems or platforms that need crowdfunding data.

## Future Improvements

- Implement more advanced data cleaning techniques.
- Integrate more data sources to provide a comprehensive dataset on crowdfunding.
- Automate the ETL process for real-time or periodic data updates.

