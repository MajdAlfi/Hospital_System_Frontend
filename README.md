
# 🏥 Hospital Image Management System - Frontend (Flutter)

This repository contains the frontend of the Hospital Image Management System (IMS), developed using Flutter. It serves as the mobile application interface for patients and medical staff to interact with the backend services.

---

## 📌 Project Overview

This application is part of a larger cloud-based, service-oriented system aimed at modernizing ABC Healthcare Group’s IT infrastructure. It provides user-friendly mobile interfaces for the following functionalities:

- Patient and staff account management
- Upload and viewing of medical images (MRI, CT, X-ray)
- Diagnostic report handling
- Cost calculation and patient billing details
- Secure login for different roles (patients, radiologists, doctors)

---

## 🚀 Features

- 🧑‍⚕️ Role-based user authentication
- 📷 Image upload and classification (MRI, CT, X-ray)
- 📝 Diagnostic reports with timestamps
- 💰 Cost tracking per patient
- 🔒 Secure access and data privacy

---

## 📂 Folder Structure

```
hospital_app_frontend/
├── lib/
│   ├── screens/
│   ├── services/
│   ├── models/
│   └── main.dart
├── assets/
├── pubspec.yaml
└── README.md
```

---

## 🧑‍💻 Technologies Used

- **Flutter**: UI toolkit for building natively compiled mobile applications.
- **Dart**: Programming language for Flutter apps.
- **HTTP**: For communication with backend APIs.
- **Provider**: For state management.

---

## ⚙️ Setup Instructions

1. **Prerequisites**
   - Flutter SDK installed
   - Android Studio or VS Code
   - A connected device or emulator

2. **Clone the Repository**
   ```bash
   git clone https://github.com/your-org/hospital_app_frontend.git
   cd hospital_app_frontend
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

> **Note:** Make sure the backend (`HospitalSystem`) is running and accessible for full functionality.

---

## 📡 Backend Integration

This app communicates with the Node.js backend via REST APIs for operations such as:

- Authentication
- Patient and staff management
- Image upload metadata
- Diagnostic report handling

---
