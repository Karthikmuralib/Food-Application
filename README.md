# 🍔 Food Application

## 📌 Project Overview

The **Food Application** is a web-based application developed to simulate an online food ordering system.
Users can browse available food items, add them to a cart, and place orders.

This project demonstrates backend development using **Java, Spring Boot, and MySQL**, along with basic frontend integration.

---

## 🚀 Tech Stack

- **Programming Language**: Java
- **Frameworks**: Spring Boot, Hibernate
- **Backend Technologies**: JDBC, Servlets
- **Database**: MySQL
- **Build Tool**: Maven
- **Tools Used**: Eclipse, Postman
- **Frontend**: HTML, CSS, JavaScript

---

## ✨ Features

- 👤 User Registration and Login
- 🍽️ Browse Food Menu
- 🛒 Add Items to Cart
- 📦 Place Orders
- 🔄 Backend Integration with Database
- ⚙️ REST API Support

---

## 🏗️ Architecture

- Follows **MVC (Model-View-Controller)** architecture
- Uses **Spring Boot** for backend development
- Handles database operations using **JDBC / Hibernate**
- REST APIs used for communication

---

## 📂 Project Structure

```
Food-Application/
│
├── src/main/java        # Java source code
├── src/main/resources   # Configuration files
├── pom.xml              # Maven dependencies
└── README.md
```

---

## ⚙️ How to Run the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/Karthikmuralib/Food-Application.git
   ```

2. Open the project in Eclipse or any IDE

3. Configure MySQL database:
   - Create a database
   - Update DB username & password in `application.properties`

4. Run the application:
   - Run as **Spring Boot Application**

5. Open browser:

   ```
   http://localhost:8080/TapFood/login.jsp
   ```

---

## Deploy on Railway

The deployable web project is in `TapFood/TapFood` and includes a Maven WAR build and Dockerfile.

1. Connect this GitHub repository to a Railway service.
2. Set the service root directory to `TapFood/TapFood`.
3. Railway will build the application from the included `Dockerfile`.
4. Add a MySQL-compatible database and configure these service variables:

   ```text
   DB_HOST=<database host>
   DB_PORT=<database port>
   DB_NAME=tapfood
   DB_USER=<database user>
   DB_PASSWORD=<database password>
   ```

5. Import the `tapfood` schema and tables into the Railway database.
6. Generate a Railway public domain and open:

   ```text
   https://<your-domain>/TapFood/login.jsp
   ```

The application uses `localhost`, `root`, and `root` as local defaults and reads Railway values from environment variables.

---

## 📸 Screenshots

<img width="952" height="830" alt="Image" src="https://github.com/user-attachments/assets/26661c49-7556-42bf-9267-98123b2db010" />

<img width="1600" height="780" alt="Image" src="https://github.com/user-attachments/assets/f75c9b53-92c2-428d-a55d-9c96d75e8e00" />

<img width="1600" height="702" alt="Image" src="https://github.com/user-attachments/assets/1ca6afa6-519d-428f-8650-c07c9122c036" />

<img width="1600" height="766" alt="Image" src="https://github.com/user-attachments/assets/9ab06b60-11a9-462a-a522-d9c07fb7ca9b" />

<img width="1600" height="753" alt="Image" src="https://github.com/user-attachments/assets/e53bcc15-51ea-4c04-a92a-d2c877e02bfa" />

<img width="1600" height="772" alt="Image" src="https://github.com/user-attachments/assets/11067358-c9df-48c9-a154-2310ea0bf98e" />

<img width="1600" height="754" alt="Image" src="https://github.com/user-attachments/assets/49da5259-3654-48a2-9549-716a1752fd93" />

<img width="1229" height="756" alt="Image" src="https://github.com/user-attachments/assets/6044f2bc-a1c5-4963-8df5-343e9da17135" />
🔮 Future Enhancements
💳 Online Payment Integration
📊 Admin Dashboard
📍 Order Tracking System
🎨 Improved UI/UX
👨‍💻 Author

Karthik Murali
GitHub: https://github.com/Karthikmuralib

📢 Note

This project is developed for learning purposes to demonstrate full-stack development using Java technologies.
