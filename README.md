lib/
 ├── cart_manager.dart                # Business logic for managing shopping cart
 ├── weather_service.dart             # Simulated weather API service
 └── widgets/
      ├── shopping_cart.dart          # Interactive shopping cart UI
      ├── user_registration_form.dart # User registration form with validation
      └── weather_display.dart        # Weather information UI

test/
 ├── cart_manager_test.dart           # Unit tests for CartManager logic
 ├── validators_test.dart             # Unit tests for Validators class
 └── user_registration_form_test.dart # Widget tests for registration form




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
