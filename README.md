# 📱 Connects App

**Connects App** is a Flutter application for displaying a list of users with detailed profiles, built using **Clean Architecture** and **BLoC** state management.  
The app supports responsive design with **flutter_screenutil** and features a modern **Glassmorphism UI**.

---

## ✨ Features

- 🔄 **State Management** with `flutter_bloc`
- 🌐 **API Integration** using `Dio` & `Retrofit`
- 🧩 **Clean Architecture** (Data, Domain, Presentation layers)
- 🖼 **Modern UI** with Glassmorphism effects
- 📱 **Responsive UI** with `flutter_screenutil`
- ⚡ **Pagination** for user list
- 🔍 **User Details** screen with smooth navigation
- 🛠 **Retry Mechanism** for failed requests
- 🔄 **Pull-to-refresh** for data updates

---

## 📂 Project Structure

lib/
├── core/
│ ├── di/ # Dependency Injection (GetIt)
│ ├── helpers/ # Utilities (dimensions, spacing, extensions)
│ ├── networking/ # API constants, service, error handling
│ ├── theming/ # Colors, Styles
│ └── widgets/ # Shared Components (Loader, Error, Avatar...)
│
├── features/
│ └── users/
│ ├── data/ # Models, API Calls, Repository
│ ├── domain/ # Entities, UseCases
│ └── presentation/ # Cubits, Views, Widgets
│
└── main.dart

---

## 🌐 API

This app uses the Reqres public API for demonstration:

GET /users?page=1 → Fetch paginated user list

GET /users/{id} → Fetch single user details

## 🛠 Tech Stack

State Management: flutter_bloc

Networking: dio, retrofit

Dependency Injection: get_it

Responsive UI: flutter_screenutil

Animations: Hero, AnimatedSwitcher

UI Effects: Glassmorphism

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
