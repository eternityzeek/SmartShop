# Smart Shop

**Smart Shop** is a lightweight e-commerce Flutter application built as a demo project to showcase key concepts in state management, data persistence, theming, and API integration. It utilizes modern Flutter practices like `Provider` for state management, `SharedPreferences` for local storage, and RESTful API consumption using the [FakeStore API](https://fakestoreapi.com).



## Features

### Authentication

* Login & Registration screens with `TextFormField` validation
* Splash screen that checks login state
* Persistent login using `SharedPreferences`
* Dummy user data or optional use of FakeStore API

### Home Page

* Product list fetched from [FakeStore API](https://fakestoreapi.com)
* Add/Remove from **Cart**
* Mark/Unmark as **Favourite** (stored locally)
* Product details include:

  * Name
  * Price
  * Rating (with star UI)
* Sorting by:

  * Price (Low → High / High → Low)
  * Rating
* Pull-to-refresh with `RefreshIndicator`

### Cart Page

* Shows cart items with:

  * Product name
  * Price
  * Rating
* Displays total cart value
* Badge icon with item count
* Managed via `Provider`

### Favourites Page

* List of user-favourited products
* Persistence using `SharedPreferences`

### Theme Toggling

* Switch between Light & Dark modes
* Toggle available via Drawer or AppBar
* Persisted using `SharedPreferences`

###  Navigation

* Drawer with navigation to:

  * Home
  * Cart
  * Favourites
  * Profile
  * Logout

###  Logout

* Clears user session from `SharedPreferences`
* Redirects back to Login screen


##  Tech Stack

* **Flutter** (SDK 3.8+)
* **Dart**
* **Provider** (State Management)
* **SharedPreferences** (Local Storage)
* **HTTP** (API Requests)
* **FakeStore API** (Mock E-commerce Data)



##  Screenshots
<img width="1504" height="1006" alt="Screenshot (80)" src="https://github.com/user-attachments/assets/8fcd63aa-4591-4594-b8c5-185c3d4dc4f7" />
<img width="1490" height="1019" alt="Screenshot (82)" src="https://github.com/user-attachments/assets/dd935e01-0056-423f-bf2e-7ddb7f1d7444" />
<img width="1487" height="1006" alt="Screenshot (84)" src="https://github.com/user-attachments/assets/40905bef-bd12-490b-9637-118593a92827" />
<img width="1500" height="1016" alt="Screenshot (83)" src="https://github.com/user-attachments/assets/25a25b03-8a2e-496a-b5cf-4302692ee38b" />
<img width="1486" height="1011" alt="Screenshot (86)" src="https://github.com/user-attachments/assets/1477e673-ed8e-4cc1-aa30-dc9fc7b8c9bb" />
<img width="1510" height="1014" alt="Screenshot (87)" src="https://github.com/user-attachments/assets/89cfe0c7-60cc-48ba-9b3e-e9a5db412acd" />
<img width="1503" height="1004" alt="Screenshot (85)" src="https://github.com/user-attachments/assets/2f1961af-35cf-4887-9596-3f376b27773c" />



## Getting Started

### Prerequisites

* Flutter SDK (3.8 or higher)
* Dart
* Android Studio / IntelliJ / VS Code 

### Installation

1. **Clone the repo**

   ```bash
   git clone https://github.com/yourusername/smart_shop.git
   cd smart_shop
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```


##  Project Structure Overview

```
lib/
│
├── main.dart
├── app_theme.dart
├── constants.dart
├── services/
│   └── api_service.dart
├── models/
│   ├── product.dart
│   └── user.dart
├── providers/
│   ├── auth_provider.dart
│   ├── cart_provider.dart
│   ├── product_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── favorites_screen.dart
│   └── profile_screen.dart
└── widgets/
    ├── product_card.dart
    └── drawer_widget.dart


* `models/` – Data models (e.g., Product)
* `providers/` – All state management logic
* `services/` – API services (HTTP)
* `screens/` – UI pages/screens
* `widgets/` – Reusable UI components
* `utils/` – Theme, constants, helper functions


## Learning Goals

This project was designed to demonstrate:

* State management using `Provider`
* Theme toggling and persistence
* Login state and session handling with `SharedPreferences`
* Dynamic UI with real API integration
* Routing and Navigation with Flutter's Navigator
* Modern UI/UX practices with Material Design



## Acknowledgements

* [FakeStoreAPI](https://fakestoreapi.com) for providing test data
* Flutter & Dart documentation
* Community plugins: `provider`, `shared_preferences`, `http`
