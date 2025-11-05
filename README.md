
# 🌟 **EduPro – Smart Learning Platform**

> *Empowering learners everywhere through interactive, modern, and connected digital education.*

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"  alt="link not found"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"  alt="link not found"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="link not found" />
  <img src="https://img.shields.io/badge/MockAPI-6C63FF?style=for-the-badge&logo=api&logoColor=white" alt="link not found"/>
</p>

---

## 📘 **Project Overview**

**EduPro** is a **Smart Learning Platform App** built using **Flutter** and **Firebase**, developed as part of the **Excelerate Internship Program (Team 20)**.  
It offers an engaging, data-driven learning experience that enables users to explore programs, enroll in courses, and interact through a beautifully designed UI inspired by Excelerate’s purple-blue gradient branding.

---

## ⚙️ **Features**

- 🖥️ Modern UI with **Splash**, **Onboarding**, **Login**, **Register**, **Home**, **Explore**, **Program Listing**, **Program Details**, and **Profile** screens.  
- 🔥 **Firebase Authentication** for secure login and registration.  
- 🌐 **Mock API Integration** for real-time program listing and detail data.  
- 🧾 **Enroll Form** with input validation and data storage (Firebase/MockAPI).  
- 🧠 Smart error handling and loading indicators for smooth UX.  
- 📲 Clean **Bottom Navigation** & responsive layout.  
- 🎨 Consistent **Excelerate gradient theme** across the app.

---

## 🖼️ **App Preview**


<p align="center">
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/Splash_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/Onboarding_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/LetYOUIN_Screen.png" width="200"/>
</p>
<p align="center">
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/SignIn_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/SignUp_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/Notification_Screen.png" width="200"/>
</p>
<p align="center">
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/Home_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/AllCategory_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/ProgramListing_Screen.png" width="200"/>
</p>

<p align="center">
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/ProgramDetails_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/EnrollForm_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/EnrollSuccess_Screen.png" width="200"/>
  <img src="https://github.com/Avi0221/EduPro-Smart-Learning-Platform/blob/main/assets/images/Profile_Screen.png" width="200"/>
</p>

---

## 🎥 **Demo Video**

🚀 *Final Demo Coming Soon!*

```text
🎬 Video Link: [To be added soon]
```

---

## 🧠 **Tech Stack**

| Technology | Purpose |
|-------------|----------|
| **Flutter** | Frontend Mobile Framework |
| **Dart** | Programming Language |
| **Firebase Auth** | User Authentication |
| **Cloud Firestore** | Database (for Enroll Form data storage) |
| **MockAPI** | Sample API for Programs |
| **Provider / setState** | State Management |
| **Figma** | UI Design |

---

## 🗂️ **Folder Structure**

```
lib/
 ├── models/
 │    └── program_model.dart
 ├── services/
 │    └── program_service.dart
 ├── screens/
 │    ├── auth/
 │    │   ├── login_screen.dart
 │    │   └── register_screen.dart
 │    ├── home_screen.dart
 │    ├── program_list_screen.dart
 │    ├── program_detail_screen.dart
 │    ├── enroll_form_screen.dart
 │    ├── profile_screen.dart
 │    └── splash_screen.dart
 ├── main.dart
```

---

## ⚡ **Installation & Run Guide**

Follow these steps to set up and run the project locally 👇

### 🧩 **1. Clone the Repository**
```bash
git clone https://github.com/Avi0221/EduPro-Smart-Learning-Platform.git
cd EduPro-Smart-Learning-Platform
```

### 📦 **2. Install Dependencies**
```bash
flutter pub get
```

### 🔥 **3. Set Up Firebase (Android only)**
- Go to [Firebase Console](https://console.firebase.google.com/)
- Add an Android app with your package name  
- Download the `google-services.json` file  
- Place it inside:  
  ```
  android/app/
  ```
- Then update `android/build.gradle` and `app/build.gradle` according to Firebase setup.

### 🧠 **4. Run the App**
```bash
flutter run
```

### 🧪 **Test Credentials (for Demo)**
```
Email: testing20@gmail.com  
Password: Testing@team20
```

---

## 🗓️ **Internship Journey – Excelerate × EduPro (Team 20)**

### 🧩 **Week 1 – Project Foundation & Design**
- Defined purpose, user flow, and UI wireframes in **Figma**.  
- Initialized Flutter project and GitHub repo.  
- Documented proposal and tech stack.

### 🎨 **Week 2 – UI Development**
- Built screens: Splash, Onboarding, Login, Signup, Home, Program List.  
- Added Bottom Navigation and polished gradient visuals.  
- Delivered interactive prototype.

### 🔗 **Week 3 – API Integration & Forms**
- Integrated **MockAPI** for dynamic program data.  
- Built **Enroll Form** with validation (first name, email, password, etc.)  
- Implemented **data storage** for form submissions (Firebase/MockAPI).  
- Added error handling, success messages, and loading indicators.  
- Organized project structure and documentation.

---

## 🧾 **Reports**

| Week | Report PDF |
|------|-------------|
| 📘 **Week 1** | [Week_1_Avinash_Kumar_Team_20.pdf](./Week_1_Avinash_Kumar_Team_20.pdf) |
| 🎨 **Week 2** | [Week_2_Avinash_Kumar_Team_20.pdf](./Week_2_Avinash_Kumar_Team_20.pdf) |
| 🔗 **Week 3** | [Week_3_Avinash_Kumar_Team_20.pdf](./Week_3_Avinash_Kumar_Team_20.pdf) |

---

## 🧭 **Project Navigation**

<p align="center">
  <a href="#-edupro--smart-learning-platform">🏠 Home</a> •
  <a href="#-project-overview">📘 Overview</a> •
  <a href="#-features">⚙️ Features</a> •
  <a href="#-app-preview">📱 Screenshots</a> •
  <a href="#-installation--run-guide">⚡ Installation</a> •
  <a href="#-internship-journey--excelerate--edupro-team-20">🗓️ Timeline</a> •
  <a href="#-reports">🧾 Reports</a>
</p>

---

## 👨‍💻 **Author & Credits**

| Role | Name | Contribution |
|------|------|--------------|
| 💡 **Intern / Developer** | **Avinash Kumar** | Flutter App Development  •  UI Design  •  API Integration  •  Enroll Form Data Handling |
| 🧑‍🏫 **Program** | **Excelerate Internship (Team 20)** | Mentorship & Evaluation |
| 🏢 **Organization** | **Excelerate** | Platform & Project Guidance |

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Powered%20by-Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" />
</p>

---

## 🌈 **Acknowledgment**

> A heartfelt thanks to **Excelerate** for mentorship, guidance, and the opportunity to build a real-world Flutter application during this internship journey.

---

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=6C63FF&height=80&section=footer&text=✨%20Thank%20You%20for%20Visiting!%20✨&fontColor=ffffff&fontAlignY=60"/>
</p>
````