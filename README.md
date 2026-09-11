# Pluto-Realty-DB-project
A database management project designed to simulate the process of gathering requirements and designing a database to match requirments from a client

I am tasked to design The Pluto Realty database, which is an application intended to 
support the operations of Pluto Realty, Inc. by allowing employees to manage rental properties, 
clients, owners, viewings, and lease contracts through a centralized system. The system will be 
accessed by employees through web-enabled computers. The requirements describe several 
core entities: employees, property owners, clients, rental properties, property viewings, and 
leases.  

Employees are divided into two roles: partners and associates, which affects their 
responsibilities in the system. Associates manage properties and conduct property viewings for 
clients, while partners oversee property owners and are responsible for creating lease 
agreements. Each property has attributes such as location, property type, size, rent, and 
management fee, and must be linked to exactly one owner and one associate. Owners and 
clients store similar personal information: name, address, phone numbers, and emails.  
However, owners are overseen by partners while clients include preferences and budget 
information. Additional constraints exist in the requirements, such as associates managing at 
most five properties, lease durations being between three and thirty-six months, and lease 
numbers being unique per property. 

From a database design perspective, the system will require identifying the main entities 
and their relationships and converting them into a relational schema. The entities such as 
Employee, Property, Owner, Client, Viewing, and Lease will be designed into tables, while 
relationships, such as owning a property will be implemented through foreign keys. Some 
attributes are multivalued, such as phone numbers and email addresses. At the end of the 
project, once the database has been created and populated, the project requires implementing 
a function to calculate management fees over the past three months and that automatically 
updates the property advertisement flag when a lease is created. 

Several files that create, populate and clear the database are needed. These files should 
be separate and be able to run specific queries. Lastly, a client application (Jupyter Notebook) 
designed to provide a user-friendly front end for interacting with the Pluto Realty database 
system is required. The application includes input cells that accept user queries or parameters, 
such as property identifiers, client details, or search criteria, and output cells that display query results or system feedback in a structured and readable format.

Included:

	1. createAll.sql - This creates the database as well as the tables, so the other files won't be able to 
	run the others without this 	
	2. loadAll.sql - loads the data into the tables. 
	3. dropAll.sql - drops all tables
	4. Pluto Database.ipynb
	5. QueryAll.sql
	7. transaction.sql

Requirements:

	1. MySQL server: The database must be: Installed locally (ex. localhost) or any reachable host 
	2. JupyterLab: or it can be ran directly in VS Code

Further Instructions on how to setup and run are in the Pluto Database notebook
