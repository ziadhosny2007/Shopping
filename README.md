# 🛒 Shopping App

### Flutter E-Commerce Mobile Application

A modern E-Commerce mobile application built with **Flutter & Dart**, designed to provide users with a smooth and convenient online shopping experience.

The application integrates with a RESTful API to handle authentication, product browsing, search, favorites, cart management, and user profile operations.

---

## 📱 About The Project

Shopping App is a collaborative team project developed to apply practical Flutter development concepts and build a scalable mobile application.

The project focuses on clean code, maintainable architecture, efficient state management, and seamless API integration.

It provides users with essential e-commerce functionalities through an organized and user-friendly interface.

---

## ✨ Features

### 🔐 Authentication
- User Registration (Sign Up).
- User Login (Sign In).
- Secure token storage.
- Authentication state management.

### 🏠 Home & Products
- Browse available products.
- Explore product categories.
- View product details.
- Display product images and information.

### 🔎 Search
- Search for products.
- Debouncing to reduce unnecessary API requests.
- Loading, success, empty, and error states.

### ❤️ Favorites
- Add products to favorites.
- Remove products from favorites.
- Retrieve favorite products from the API.

### 🛒 Shopping Cart
- Add products to the cart.
- Remove products from the cart.
- Manage product quantities.
- Display cart items and total price.

### 👤 Profile Management
- Retrieve user profile information.
- Edit personal information.
- Pick profile images from the device.
- Upload profile images to the server.

### ⚙️ General
- RESTful API integration.
- Centralized error handling.
- Loading and error states.
- Reusable custom widgets.
- Modular feature organization.

---
## 📸 App Screenshots

### 🚀 Splash & Onboarding

![Splash Screen](assets/screenshots/splash.png)

![Onboarding](assets/screenshots/onboarding1.png)
![Onboarding](assets/screenshots/onboarding2.png)
### 🔐 Authentication

![Login](assets/screenshots/login.png)

![Sign Up](assets/screenshots/Signup.png)

### 🏠 Home & Products

![Home](assets/screenshots/home.png)

![Product Details](assets/screenshots/details Screen.png)

### ❤️ Favorites

![Favorites](assets/screenshots/favorite.png)

### 🛒 Shopping Cart

![Cart](assets/screenshots/cart.png)

### 👤 Profile

![Profile](assets/screenshots/profile.png)
---
## 🛠️ Technologies & Packages

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI development |
| Dart | Programming language |
| Flutter Bloc / Cubit | State management |
| Clean Architecture | Separation of concerns |
| REST API | Backend communication |
| HTTP | HTTP requests |
| GetIt | Dependency Injection |
| Injectable | Dependency registration |
| Flutter Secure Storage | Secure token storage |
| Cached Network Image | Image caching and loading |
| Build Runner | Code generation |

---

## 🏗️ Architecture

The application follows **Clean Architecture** principles to improve maintainability, scalability, and separation of concerns.

The project is organized into three main layers:

### 1. Presentation Layer
Responsible for the user interface and application state.

- Screens and Widgets.
- Cubits.
- States.
- User interactions.

### 2. Domain Layer
Contains the core business logic of the application.

- Entities.
- Repository Contracts.
- Use Cases.

### 3. Data Layer
Responsible for retrieving and managing external data.

- API Data Sources.
- Models / DTOs.
- Repository Implementations.
- Data Mapping.

### Dependency Injection

GetIt and Injectable are used to manage dependencies and reduce direct coupling between application components.

---

## 📂 Project Structure

```text
lib/
│
├── core/
│   ├── di/
│   ├── network/
│   ├── storage/
│   ├── theme/
│   ├── routes/
│   └── widgets/
│
├── features/
│   │
│   ├── auth/
│   │
│   ├── home/
│   │
│   ├── product_details/
│   │
│   ├── search/
│   │
│   ├── cart/
│   │
│   ├── favourite/
│   │
│   ├── profile/
│   │
│   └── app_section/
│
└── main.dart
```

Each feature is organized independently to keep the application modular and easier to maintain.

---

## 🔌 API Integration

The application communicates with a RESTful backend API to perform different operations.

**Base URL:**

```text
https://supermarket-dan1.onrender.com/api/v1
```

### Main API Operations

| Feature | Operations |
|---|---|
| Authentication | Sign Up / Sign In |
| Products | Get Products / Product Details |
| Categories | Get Categories / Products by Category |
| Search | Search Products |
| Favorites | Get / Add / Delete |
| Cart | Get / Add / Delete |
| Profile | Get / Edit / Upload Image |

---

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites

Make sure you have installed:

- Flutter SDK.
- Dart SDK.
- Android Studio or VS Code.
- Git.

### Installation

**1. Clone the repository**

```bash
git clone YOUR_REPOSITORY_URL
```

**2. Navigate to the project directory**

```bash
cd shopping
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Generate dependency injection files**

```bash
dart run build_runner build --delete-conflicting-outputs
```

**5. Run the application**

```bash
flutter run
```

---

## 🎯 What We Learned

Working on this project provided practical experience in:

- Building scalable Flutter applications.
- Applying Clean Architecture principles.
- Managing application state using Bloc and Cubit.
- Implementing Dependency Injection.
- Integrating RESTful APIs.
- Handling authentication and secure token management.
- Managing asynchronous operations.
- Implementing search with debouncing.
- Handling API errors and application states.
- Working with Git and GitHub in a team environment.
- Writing reusable and maintainable code.

---

## 👥 Team & Contributors

This project was developed collaboratively as a team, providing valuable experience in teamwork, task distribution, code collaboration, and version control.

### 1. Ziad Hosny Ali Emam

- GitHub: [@ziadhosny2007](https://github.com/ziadhosny2007)
- LinkedIn: [Ziad Hosny](https://www.linkedin.com/in/ziad-hosny-932149401/)

### 2. Zyad Ahmed Saad

- GitHub: [@zyad742](https://github.com/zyad742)
- LinkedIn: [Zyad Ahmed Saad](https://www.linkedin.com/in/zyad-ahmed-flutter)

---

## 👨‍💻 Developed With

Made with ❤️ using Flutter.

**If you find this project interesting, don't forget to give it a ⭐!**
