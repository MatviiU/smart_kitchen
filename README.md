# Smart Kitchen Assistant

## Project description
The Smart Kitchen Assistant mobile application, developed in Flutter, is designed to simplify home grocery inventory management, minimize food waste, and automate meal planning. The core functionality is based on quickly and conveniently adding products to the user's virtual "Fridge" and receiving recipe recommendations based on the ingredients they currently possess.

---

## Key functional requirements

### Product inventory management
* Barcode scanning: Ability to add a product to the list by scanning its barcode using the device's camera.
* Manual entry: Ability to manually add a product (name, category, quantity).
* Product details: Must store: name, quantity, unit, date added, and expiration date (optional) for each product.
* Edit/Delete: Ability to modify product details or remove it from the list.

### Recipe recommendations
* "Cook Now" Suggestions: Generation of a list of recipes that can be made using only the products currently in the user's "Fridge".
* "Popular Today": Display of one or more "popular" or "recommended" recipes of the day (perhaps utilizing ingredients close to expiration).
* Recipe details: Viewing the full list of ingredients (highlighting possessed/missing items), instructions, and preparation time.

---

## Technical requirements
* Technology: Development must be done using Flutter and the Dart language.
* Database: Requires a solution for storing user product data and potentially caching recipe information (locally, e.g., Hive/Isar, or cloud, e.g., Firebase Firestore).
* State management: Selection of an efficient state management solution (e.g., Provider, Riverpod, or BLoC).
* Recipe API: Integration with a third-party API to fetch recipe data.

