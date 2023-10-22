## **Introduction**
Welcome to the UpFest Backend project, the robust backend component of the UpFest event management system.

**Project Overview**
The UpFest system is designed to revolutionize event management, particularly in the context of music festivals. This project's primary objective is to build the backend module of UpFest for a proof of concept. The system comprises several key features:

**Features**

**Event Management
**Create and manage event details.
Maintain information about stages, artists, locations, and schedules.

**Ticket Sales**
Facilitate ticket purchasing.
Validate entry to the event.
Simulate ticket payment through Multibanco references.

**Cashless Payments**
Enable cashless payments within the festival.
Manage registered vendors and their products.
Handle participant balance loading through Multibanco references.
Track participant transactions for food and beverages.

**Project Structure**
The project is organized into the following main directories:

a**pp.js:** The primary application file.
**routes/:** Route definitions for various modules.
**controllers/: **Controller functions for processing requests.
**models/: **Data models for events, tickets, and cashless transactions.
**config/:** Configuration files.
**utils/:** Utility functions.
**db/:** Database schema and connection.

**Getting Started**
Clone this repository.
Ensure you have Node.js and npm installed.
Install project dependencies with npm install.
Import the provided SQL database into your MySQL server.
Update the database connection settings in config/db.js.
Start the server with npm start.

**API Endpoints**
POST /events: Create a new event.
GET /events: Retrieve a list of upcoming events.
GET /events/:id: Get details of a specific event.
POST /tickets: Purchase a ticket for an event.
GET /tickets/:id: Get details of a specific ticket.
POST /cashless: Perform a cashless transaction (for future development).
GET /cashless/transactions/:id: Retrieve cashless transaction details (for future development).

**Database Schema**
The project includes a MySQL database schema that can be imported to create the necessary database structure.

**Configuration**
Configure the database connection in the config/db.js file.
Use environment variables for secure database connection and other sensitive information.

**Evaluation**
The project will be assessed based on various criteria, including code organization, the use of promises, parameter handling, response clarity, utilization of environment variables, and overall code quality. Individual group members will be evaluated based on their contributions and understanding of their specific module.

**Acknowledgments**
This project was developed as part of the UpFest event management system for educational purposes, showcasing the functionalities of a comprehensive event management system.
