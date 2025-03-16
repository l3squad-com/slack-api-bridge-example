# Slack API with FastAPI and APIBridge

This project demonstrates the use of the `api_bridge` library for handling CRUD operations efficiently within a FastAPI application. The `api_bridge` library simplifies API development by providing a structured approach to database interactions.

## Features
- Utilizes `api_bridge` for seamless CRUD operations
- FastAPI-based lightweight and high-performance API
- Single database configuration for MySQL
- Easily extensible for additional API functionalities

## Requirements
- Python 3.8+
- MySQL database
- FastAPI
- APIBridge
- Uvicorn (for running the server)

## Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/l3squad-com/slack-api-bridge-example.git
   cd slack-api-bridge-example
   ```

2. **Create a virtual environment (optional but recommended)**
   ```sh
   python -m venv venv
   source venv/bin/activate  # On Windows use: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```sh
   pip install -r requirements.txt
   ```

## Configuration

Modify the `db_config` dictionary in `main.py` to match your MySQL database credentials:
```python
# Database Configuration
 db_config = {
    "host": "localhost",
    "port": 3306,
    "database": "slack_db",
    "user": "root",
    "password": "1234"
}
```

## Running the Application

Start the FastAPI server using Uvicorn:
```sh
uvicorn main:app --reload
```
The API will be available at `http://127.0.0.1:8000/slack-apis`.

## API Endpoints

The following API endpoints are available:

- **GET** `/slack-apis/test` - Test database connection
- **GET** `/slack-apis/{table_name}` - Retrieve all records from a table
- **POST** `/slack-apis/{table_name}` - Create a new record in a table
- **GET** `/slack-apis/{table_name}/{record_id}` - Retrieve a specific record from a table
- **PUT** `/slack-apis/{table_name}/{record_id}` - Update an existing record in a table
- **PATCH** `/slack-apis/{table_name}/{record_id}` - Partially update an existing record
- **DELETE** `/slack-apis/{table_name}/{record_id}` - Soft delete a record
- **DELETE** `/slack-apis/{table_name}/{record_id}/hard` - Permanently delete a record

Refer to the `api_bridge` documentation for additional customization and endpoint details.

## Extending Functionality

You can add custom routes and business logic by integrating additional routers into `main.py` or extending the `api_bridge` functionality.


