# TapFood — Food Delivery Web Application

A full-stack Java web application for browsing restaurants, managing a cart, and placing food orders — built with Servlets, JSP, JDBC, and MySQL, with a REST API layer for JSON-based data access.

## Features

- User registration and session-based authentication
- Browse restaurants and view menus
- Add items to a session-scoped shopping cart
- Checkout flow that creates a persisted order in MySQL
- Order history for logged-in users
- REST JSON API layer (see below) alongside the JSP-rendered UI

## Tech Stack

| Layer       | Technology                             |
| ----------- | -------------------------------------- |
| Language    | Java 21                                |
| Web Layer   | Jakarta Servlets, JSP                  |
| Server      | Apache Tomcat 10.1                     |
| Database    | MySQL                                  |
| Data Access | JDBC (DAO pattern), PreparedStatements |
| Build/IDE   | Eclipse Dynamic Web Project            |

## Architecture

The application follows an MVC-style layered architecture:

```
Controller (Servlets) → Service/DAO Layer → MySQL
                       ↘ JSP (View)
```

- **`com.tap.servlet`** — Controllers handling requests and forwarding to JSP views
- **`com.tap.model`** — Plain data model classes (User, Restaurant, Menu, Orders, Cart, CartItem)
- **`com.tap.model.daoimpl`** / **`com.tap.dao`** — Data access layer, one interface + implementation per entity
- **`com.tap.utility`** — Shared utilities (DB connection handling, JSON serialization)
- **`com.tap.api`** — REST API controllers returning JSON instead of forwarding to a view

## REST API

In addition to the browser-facing pages, the app exposes a JSON REST API:

| Resource    | Endpoint                      | Method | Description                                    |
| ----------- | ----------------------------- | ------ | ---------------------------------------------- |
| Restaurants | `/api/restaurants`            | GET    | List all restaurants                           |
| Restaurants | `/api/restaurants/{id}`       | GET    | Get a single restaurant                        |
| Menu        | `/api/menu?restaurantId={id}` | GET    | List menu items for a restaurant               |
| Menu        | `/api/menu/{id}`              | GET    | Get a single menu item                         |
| Cart        | `/api/cart`                   | GET    | View current session cart                      |
| Cart        | `/api/cart`                   | POST   | Add an item to the cart (`menuId`, `quantity`) |
| Cart        | `/api/cart/{menuId}`          | PUT    | Update an item's quantity (`quantity`)         |
| Cart        | `/api/cart/{menuId}`          | DELETE | Remove an item from the cart                   |
| Orders      | `/api/orders`                 | GET    | Order history for the logged-in user           |

Responses use standard HTTP status codes (`200`, `201`, `400`, `401`, `404`, `500`) and JSON bodies.

## Getting Started

### Prerequisites

- JDK 21+
- Apache Tomcat 10.1+ (Jakarta EE 9+ namespace)
- MySQL 8+
- Eclipse IDE for Enterprise Java Developers (or any Jakarta EE–capable IDE)

### Setup

1. Clone the repo and import as an existing project in Eclipse
2. Create a MySQL database named `tapfood` and run the schema (see `/schema` if included, or set up tables matching the model classes in `com.tap.model`)
3. Update DB credentials in `com/tap/utility/DBConnection.java` if different from `root` / `root`
4. Set the project's Targeted Runtime to Apache Tomcat 10.1 (Project → Properties → Targeted Runtimes)
5. Run on Server from Eclipse, or deploy the generated WAR to any Tomcat 10.1 instance
6. Visit `http://localhost:8080/TapFood/login.jsp`

## Project Status

Actively maintained as a personal learning project. Planned improvements include full CRUD REST endpoints for restaurants/menu (currently read-only via the API), and deployment to a live hosting environment.

## Author

**Murali Karthik B**
[LinkedIn](https://www.linkedin.com/in/murali-karthik7/) · [GitHub](https://github.com/Karthikmuralib)
