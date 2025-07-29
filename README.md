Research and Conference Management System

A university-level DBMS project to manage research projects, publications, conferences, and academic collaborations. Designed using relational modeling (3NF normalization) and implemented with SQL and NoSQL (MongoDB) approaches.

Project Overview
This system tracks faculty and student involvement in research projects, publications with authorship order, conference participation with roles, and project funding. The project includes:
- Entity Relationship Diagram (ERD)
- Normalization up to Third Normal Form (3NF)
- SQL schema with constraints and triggers
- Sample data and complex queries
- NoSQL data modeling and sample MongoDB queries
- Comprehensive PDF report documenting the design and implementation

Repository Structure

   📂 research-conference-dbms/
├── 📂 documentation/
│ └── Research_Conference_DBMS_Report.pdf # Detailed project report
│
├── 📂 sql/
│ ├── schema.sql # Table creation scripts with constraints
│ ├── insert_data.sql # Sample data insertion scripts
│ ├── queries.sql # Complex SQL queries
│ └── triggers.sql # Triggers enforcing business rules
│
└── README.md # Project overview (this file)

How to Use
1. Review the SQL scripts inside `/sql/` to create the database schema and insert sample data.
2. Run the provided SQL queries and triggers on your preferred RDBMS (Oracle recommended).
3. Explore NoSQL data model and queries inside `/nosql/` folder for MongoDB.
4. See full project explanation, ERD, normalization steps, and more in the PDF report.

Technologies Used
- Oracle SQL 
- MongoDB (NoSQL)
- Draw.io (ER Diagram)
- Microsoft Excel (Normalization)
- GitHub

License
This project is intended for academic and learning purposes only. Please do not copy or redistribute without permission.

Author
Abrar Shakeel Ghoury
NED University of Engineering & Technology

Report

For detailed documentation, design explanations, and outputs, please refer to the PDF report:

[Research_Conference_SQL_Project.pdf](./Documentation/Research_Conference_SQL_Project.pdf)

