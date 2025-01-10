

# How to Install MySQL Server and MySQL Workbench on Windows 11

## Overview

This guide will walk you through the process of installing **MySQL Server** and **MySQL Workbench** on Windows 11. MySQL is a powerful, widely-used relational database management system ideal for web development, data storage, and application management.

### Video Tutorial

- For a visual walkthrough, check out this [YouTube video](https://www.youtube.com/watch?v=a3HJnbYhXUc).
- Another tutorial available [here](https://www.mysqltutorial.org/getting-started-with-mysql/install-mysql/)

---

## Step 1: Download MySQL Installer

1. Visit the official MySQL website at [MySQL Downloads](https://dev.mysql.com/downloads/installer/).
2. Select the **MySQL Community Edition** (free to use).
3. Download the MySQL Installer for Windows.

---

## Step 2: Install MySQL

1. Run the downloaded installer.
2. Choose the installation type:
   - **Developer Default**: Installs MySQL Server, MySQL Workbench, and other components.
   - **Server Only**: Installs just the MySQL Server.
   - **Custom**: Allows you to select the components you need.
3. Follow the prompts to complete the installation.

---

## Step 3: Configure MySQL Server

1. Set up a root user password.
2. Configure networking settings (default settings are usually sufficient).
3. Optionally, create additional users.
4. Set MySQL as a **Windows service** to ensure it starts automatically.

---

## Step 4: Open MySQL Workbench

1. After installation, launch **MySQL Workbench**.
2. Connect to your MySQL Server using the root user credentials.
3. Start creating and managing your databases visually.

---

## Step 5: Test Installation via Command Line (Optional)

1. Open the MYSQL Command Prompt.
   - Optional: Run the following command to log in to MySQL Shell:
      ```bash
      mysql -u root -p
      ```

3. Enter your root password.
4. Execute SQL commands directly in the shell.

---

## Basic SQL Commands

Here are some essential SQL commands to get you started:

### 1. Create a Database
```sql
CREATE DATABASE testdb;
```

### 2. Use a Database
```sql
USE testdb;
```

### 3. Create a Table
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 4. Insert Data into a Table
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
```

### 5. Select Data from a Table
```sql
SELECT * FROM users;
```

### 6. Check Table Information
```sql
DESCRIBE users;
```

---

## Helpful Links

- [Install MySQL Server Guide](https://www.mysqltutorial.org/getting-started-with-mysql/install-mysql/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [YouTube Tutorial](https://www.youtube.com/watch?v=a3HJnbYhXUc)

---

Now you are ready to start managing your databases with MySQL Server and MySQL Workbench. Happy coding!
