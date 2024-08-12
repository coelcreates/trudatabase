# Yoga Studio Management System

## Project Overview
This system manages employee information, roles, responsibilities, and task tracking for a yoga studio.

## Requirements

## File Structure Overview
-Project Planning:
  -Contains ER diagrams and file structure documentation.

-Source Code (src):

  -YogaStudio: Main application code
   -Controllers: Handle HTTP requests
   -Models: Define data structures
   -Services: Contain business logic
   -Data: Includes database context
  
  -YogaStudio.Tests: Unit tests for your application
  -SQL: Database scripts and queries

-Solution file: YogaStudioManagementSystem.sln, "master file" that ties all parts of your application together in the development environment. It doesn't get deployed with your application, but it's crucial for development and building your projects.

-README

### Employee Management
- Store employee information with the following attributes:
  - First Name (string)
  - Last Name (string)
  - Email (string)
  - Phone Number (uint8)
  - List of Roles (list of strings)

### Role and Responsibility Management
- Maintain a list of roles and their associated responsibilities
- Track days on which responsibilities are to be performed
- Possible roles include:
  - Hospitality
  - Instructor
  - Owner
  - Admin (optional)
- Role attributes:
  - Title (string)
  - Substitute Flag (boolean)
  - List of Tasks (list of strings)

### Task Tracking
- Track when each employee last performed specific responsibilities
- Track when each responsibility was last performed by any employee

### Reporting
- Allow for easy querying and reporting of information

### Optional Features
- Track miscellaneous administrative tasks

## Data Structure

### Employee
```c#
{
  "first_name": string,
  "last_name": string,
  "email": string,
  "phone_number": uint8,
  "roles": string
}