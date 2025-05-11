# 📝 Task Management API

A secure RESTful API backend for a simple task management application using **Spring Boot 3**, **Keycloak**, and **JWT** authentication.

## 🚀 Features

- User authentication via Keycloak
- Role-based access control
- Task CRUD operations (Create, Read, Update, Delete)
- Swagger UI for API documentation  `http://localhost:8081/swagger-ui/index.html`
- Secure endpoints with JWT token validation

---

## 🛠️ Build & Run Instructions

### 1. 🔐 Keycloak Setup

1. Start a Keycloak server (e.g., Docker or local install).
2. Access Keycloak Admin Console: `http://localhost:8080/`
3. Import the provided realm configuration:

   - Navigate to **Realm settings** → **Import**
   - Import file: `realm-export.json`

4. Start Keycloak and verify the realm and client exist.

---

### 2. 📦 Install Dependencies & Run Spring Boot App

```bash
# Use Maven to install dependencies and run the app
./mvnw clean install
./mvnw spring-boot:run
