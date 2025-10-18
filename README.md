```
flutter_testing_project/
 ├── lib/
 │    ├── cart_manager.dart
 │    ├── weather_service.dart
 │    └── widgets/
 │         ├── shopping_cart.dart
 │         ├── user_registration_form.dart
 │         └── weather_display.dart
 ├── test/
 │    ├── cart_manager_test.dart
 │    ├── validators_test.dart
 │    └── user_registration_form_test.dart
 └── README.md
```



#  🧩 Features


### 🛒 Shopping Cart

- Add, update, or remove products dynamically.

- Calculates subtotal, discounts, and total amount.

- Prevents negative quantities.

- Supports percentage-based discounts.

### 👤 User Registration Form

- Includes input validation for:

- Full name

- Email (regex-based)

- Password strength (uppercase, number, and special character)

- Password confirmation

- Shows loading indicator during async submission.

- Displays success or error messages.

### 🌦️ Weather Display

- Simulated API fetching (mocked for testing).

- Supports Celsius ↔ Fahrenheit conversion.

- Handles invalid/missing data gracefully.

- Displays temperature, humidity, and wind speed.


```
| Test Type       | File                               | Purpose                                                     |
| --------------- | ---------------------------------- | ----------------------------------------------------------- |
| **Unit Test**   | `cart_manager_test.dart`           | Verifies business logic for adding/removing/updating items. |
| **Unit Test**   | `validators_test.dart`             | Ensures email/password validation logic works correctly.    |
| **Widget Test** | `user_registration_form_test.dart` | Tests full UI form behavior and validation messages.        |

```

# 🧰 Technologies Used

- Flutter SDK

- Dart

- flutter_test (built-in testing framework)

- Material Design Widgets

# 🧑‍💻 Running the Tests

- To execute all tests, run the following command in your terminal:

```
flutter test
```

- To run a specific test file, for example the cart logic:

```
flutter test test/cart_manager_test.dart
```
