<pre> ```plaintext flutter_testing_project/ ├── lib/ │ ├── cart_manager.dart │ ├── weather_service.dart │ └── widgets/ │ ├── shopping_cart.dart │ ├── user_registration_form.dart │ └── weather_display.dart ├── test/ │ ├── cart_manager_test.dart │ ├── validators_test.dart │ └── user_registration_form_test.dart └── README.md ``` </pre>




#🧩 Features


###🛒 Shopping Cart

Add, update, or remove products dynamically.

Calculates subtotal, discounts, and total amount.

Prevents negative quantities.

Supports percentage-based discounts.

###👤 User Registration Form

Includes input validation for:

Full name

Email (regex-based)

Password strength (uppercase, number, and special character)

Password confirmation

Shows loading indicator during async submission.

Displays success or error messages.

###🌦️ Weather Display

Simulated API fetching (mocked for testing).

Supports Celsius ↔ Fahrenheit conversion.

Handles invalid/missing data gracefully.

Displays temperature, humidity, and wind speed.
