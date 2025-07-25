# 🏕️ Scouting Database Management System

![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Database](https://img.shields.io/badge/Database-Design-blue?style=for-the-badge&logo=database&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## 📋 Project Description

The **Scouting Database Management System** is a comprehensive database solution designed to manage and organize scouting organizations, including scout members, staff, activities, and group management. This system provides a robust foundation for tracking scout information, managing activities, and maintaining organizational structure within scouting groups.

## 🎯 Project Objectives

- **Member Management**: Efficiently manage scout members with their personal information, specializations, and types
- **Staff Organization**: Track staff members, their roles, and assignments to scout groups
- **Activity Planning**: Organize and manage various scouting activities with location and contact details
- **Group Management**: Structure scout groups and their relationships with activities and staff
- **User System**: Provide a user authentication system for database access
- **Data Integrity**: Maintain referential integrity through proper foreign key relationships

## 🏗️ Database Components

### Core Tables and Their Functionality

#### 👥 **USERS Table**
**Purpose**: User authentication and account management
- `USERNAME` (Primary Key): Unique user identifier
- `PASSWORD`: User authentication credential
- `EMAIL`: Contact email address
- `BIRTHDATE`: User's date of birth
- `NATIONALITY`: User's nationality
- `CREATION_DATE`: Account creation timestamp

#### 🎯 **ACTIVITIES Management**

**TYPE_ACTIVITIES Table**
- `idTYPE_ACTIVITIES` (Primary Key): Activity type identifier
- `DESIGNATION`: Activity category name

**ACTIVITIES Table**
- `idACTIVITIES` (Primary Key): Unique activity identifier
- `NAME`: Activity name
- `START_DATE`: Scheduled start date
- `ADDRESS`, `CITY`, `COUNTRY`: Location information
- `EMAIL`, `PHONE`: Contact details
- `CREATION_DATE`: Record creation date
- `TYPE_ACTIVITIES_idTYPE_ACTIVITIES` (Foreign Key): Links to activity type

#### 🏕️ **SCOUT Management**

**SCOUT_SPECIALITYS Table**
- `idSCOUT_SPECIALITYS` (Primary Key): Specialization identifier
- `SCOUT_SPECIALITYS`: Specialization description

**SCOUT_TYPES Table**
- `idSCOUT_TYPES` (Primary Key): Scout type identifier
- `SCOUT_TYPES`: Type of scout (e.g., Cub Scout, Boy Scout, etc.)

**SCOUT Table**
- `idSCOUT` (Primary Key): Unique scout identifier
- `NAME`: Scout's full name
- `BIRTHDATE`: Date of birth
- `COUNTRY`: Scout's country
- `EMAIL`, `PHONE`: Contact information
- `USERNAME`: Associated user account
- `CREATION_DATE`: Registration date
- `SCOUT_SPECIALITYS_idSCOUT_SPECIALITYS` (Foreign Key): Scout's specialization
- `SCOUT_TYPES_idSCOUT_TYPES` (Foreign Key): Scout's type/level

#### 👥 **GROUP Management**

**SCOUTS_GROUPS Table**
- `idSCOUTS_GROUP` (Primary Key): Group identifier
- `NAME`: Group name
- `BIRTHDATE`: Group formation date
- `COUNTRY`: Group's location country
- `EMAIL`, `PHONE`: Group contact information
- `CREATION_DATE`: Record creation date
- `STAFF_idSTAFF`: Assigned staff member
- `SCOUT_idSCOUT` (Foreign Key): Group members

**GROUPS_ACTIVITIES Table** (Junction Table)
- Links scout groups with their activities
- Many-to-many relationship between groups and activities

#### 👨‍🏫 **STAFF Management**

**STAFF_TYPE Table**
- `idSTAFF_TYPE` (Primary Key): Staff position identifier
- `DESIGNATION`: Staff role description

**STAFF Table**
- `idSTAFF` (Primary Key): Staff member identifier
- `NAME`: Staff member's name
- `BIRTHDATE`: Date of birth
- `COUNTRY`: Staff member's country
- `EMAIL`, `PHONE`: Contact information
- `CREATION_DATE`: Employment date
- `STAFF_TYPE_idSTAFF_TYPE` (Foreign Key): Staff position type
- `SCOUTS_GROUPS_idSCOUTS_GROUP` (Foreign Key): Assigned scout group

#### 📦 **INVENTORY Table**
- Currently defined but not implemented in the schema
- Intended for managing scouting equipment and supplies

## 🛠️ Technologies and Frameworks

| Technology | Purpose | Description |
|------------|---------|-------------|
| ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=flat&logo=mysql&logoColor=white) **MySQL** | Database Engine | Primary relational database management system |
| ![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=flat&logo=mysql&logoColor=white) **MySQL Workbench** | Database Design | Visual database design and modeling tool |
| **SQL** | Query Language | Structured Query Language for database operations |
| **InnoDB Engine** | Storage Engine | MySQL storage engine with ACID compliance and foreign key support |

### Framework Details

- **MySQL 8.0+**: Provides robust relational database functionality with advanced features
- **InnoDB Storage Engine**: Ensures data integrity through foreign key constraints and transaction support
- **MySQL Workbench**: Visual modeling tool for database design, development, and administration

## 📁 Project Structure

```
ScoutingDatabaseSql/
├── README.md                          # This documentation file
├── SQL_Query_ScoutingDatabase.sql     # Complete database schema definition
├── ScoutingDatabase.mwb               # MySQL Workbench model file
├── ScoutingDatabase.mwb.bak          # Backup of Workbench model
├── scouting.pdf                       # Project documentation
├── scouting_v.final.pdf              # Final project documentation
└── .gitattributes                     # Git configuration
```

### File Descriptions

- **SQL_Query_ScoutingDatabase.sql**: Contains the complete MySQL database schema with all table definitions, constraints, and relationships
- **ScoutingDatabase.mwb**: MySQL Workbench model file containing the visual database design
- **scouting.pdf & scouting_v.final.pdf**: Project documentation and specifications

## 🚀 Installation and Configuration

### Prerequisites

- ![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=flat&logo=mysql&logoColor=white) **MySQL Server 8.0+**
- ![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=flat&logo=mysql&logoColor=white) **MySQL Workbench** (Optional, for visual editing)

### Database Setup

#### Method 1: Using MySQL Command Line

1. **Clone the repository**:
   ```bash
   git clone https://github.com/OL-sergio/ScoutingDatabaseSql.git
   cd ScoutingDatabaseSql
   ```

2. **Connect to MySQL**:
   ```bash
   mysql -u your_username -p
   ```

3. **Execute the schema**:
   ```sql
   source SQL_Query_ScoutingDatabase.sql;
   ```

#### Method 2: Using MySQL Workbench

1. **Open MySQL Workbench**
2. **Connect to your MySQL server**
3. **Open the model file**: `File > Open Model > ScoutingDatabase.mwb`
4. **Forward Engineer the database**: `Database > Forward Engineer`
5. **Follow the wizard** to create the database on your server

### Configuration Steps

1. **Database Connection Settings**:
   ```sql
   -- Default database name: mydb
   -- Update connection parameters as needed
   Host: localhost
   Port: 3306
   Username: your_mysql_username
   Password: your_mysql_password
   ```

2. **Verify Installation**:
   ```sql
   USE mydb;
   SHOW TABLES;
   ```

3. **Expected Output**:
   ```
   +------------------+
   | Tables_in_mydb   |
   +------------------+
   | ACTIVITIES       |
   | GROUPS_ACTIVITIES|
   | INVENTORY        |
   | SCOUT            |
   | SCOUTS_GROUPS    |
   | SCOUT_SPECIALITYS|
   | SCOUT_TYPES      |
   | STAFF            |
   | STAFF_TYPE       |
   | TYPE_ACTIVITIES  |
   | USERS            |
   +------------------+
   ```

## 💻 Usage Examples

### Basic Operations

**Create a new user**:
```sql
INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, BIRTHDATE, NATIONATY, CREATION_DATE)
VALUES ('scoutmaster01', 'secure_password', 'master@scouts.org', '1985-06-15', 'USA', CURDATE());
```

**Add a scout**:
```sql
INSERT INTO SCOUT (idSCOUT, NAME, BIRTHDATE, COUNTRY, EMAIL, PHONE, USERNAME, CREATION_DATE, SCOUT_SPECIALITYS_idSCOUT_SPECIALITYS, SCOUT_TYPES_idSCOUT_TYPES)
VALUES (1, 'John Doe', '2010-03-20', 'USA', 'john@email.com', 1234567890, 'scoutmaster01', CURDATE(), 1, 1);
```

**Query scout groups and their activities**:
```sql
SELECT sg.NAME as GroupName, a.NAME as ActivityName, a.START_DATE
FROM SCOUTS_GROUPS sg
JOIN GROUPS_ACTIVITIES ga ON sg.idSCOUTS_GROUP = ga.SCOUTS_GROUPS_idSCOUTS_GROUP
JOIN ACTIVITIES a ON ga.ACTIVITIES_idACTIVITIES = a.idACTIVITIES;
```

## 🔧 Development and Customization

### Adding New Features

1. **Modify the MySQL Workbench model** (`ScoutingDatabase.mwb`)
2. **Forward engineer** the changes to generate updated SQL
3. **Test the schema** with sample data
4. **Update documentation** as needed

### Database Maintenance

- **Regular Backups**: Use `mysqldump` for database backups
- **Index Optimization**: Add indexes for frequently queried columns
- **Data Validation**: Implement triggers for data integrity

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Make your changes to the database schema
4. Test the changes thoroughly
5. Commit your changes (`git commit -am 'Add new feature'`)
6. Push to the branch (`git push origin feature/new-feature`)
7. Create a Pull Request

## 📄 License

This project is available for educational and scouting organization use. Please respect the scouting community values when using this system.

## 🔗 Related Documentation

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Workbench Manual](https://dev.mysql.com/doc/workbench/en/)
- [Scouting Organization Guidelines](https://www.scouting.org/)

---

**Note**: This is a database design project focused on MySQL database management. While the requirements mentioned Android Studio configuration, this repository contains database schema files rather than Android application code. For mobile application integration, consider using this database as a backend service with appropriate API endpoints.