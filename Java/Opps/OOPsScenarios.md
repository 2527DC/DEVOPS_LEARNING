# Mastering OOPs: Real-World Guidelines & Scenario Questions

To master Object-Oriented Programming (OOP) for production projects and technical interviews, you must move away from generic examples (like `Animal` and `Dog`) and think in terms of **real-time software architectures**.

---

## 💡 When to Use Which OOP Concept

### 1. Encapsulation (Data Hiding & Protection)
* **When to use**: Whenever you want to protect data from being directly manipulated or corrupted by other parts of the application.
* **Real-time Example**: A `BankAccount` class. You shouldn't allow `account.balance = -5000;`. Instead, make `balance` private and provide a `.withdraw(amount)` method that validates if the user has sufficient funds before changing the balance.

### 2. Abstraction (Contracts & Decoupling)
* **When to use**: When you know *what* an operation should do, but the *how* can vary or change. It defines a strict contract.
* **Real-time Example**: An `EmailService` interface with a `sendEmail(String to, String body)` method. You might implement it today using AWS SES (`AwsEmailService`), but tomorrow you could switch to SendGrid (`SendGridEmailService`) without changing the controllers or services that call `sendEmail`.

### 3. Polymorphism (Extensibility & Uniformity)
* **When to use**: When you need to treat different subclasses or implementations uniformly under a single parent type, avoiding long, ugly `if-else` or `switch` blocks.
* **Real-time Example**: A payment processor. Instead of writing:
  ```java
  if (paymentType.equals("PAYPAL")) { payWithPayPal(); }
  else if (paymentType.equals("CREDIT_CARD")) { payWithCard(); }
  ```
  You define a `PaymentMethod` interface with a `processPayment()` method. You can then do:
  ```java
  paymentMethod.processPayment(); // Automatically runs the correct code at runtime!
  ```

### 4. Inheritance (The "Is-A" Relationship)
* **When to use**: Only when there is a strict vertical hierarchy where a subclass is a specialized version of the parent class (e.g., `SavingsAccount` **is a** `BankAccount`).
* **⚠️ Design Rule**: Don't use inheritance just to share code. If you want to reuse code, use **Composition** (defining a class instance as a field, or a "Has-A" relationship) instead.

---

## 🎯 3 Real-World Scenario Practice Questions

Here are 3 common scenario questions designed to test your OOP design skills. Try to write the Java classes and interfaces for them in your practice environment!

### Scenario 1: The E-commerce Notification System
**Problem:** You are building an e-commerce platform. When a customer places an order, the system needs to send them notifications. Depending on the customer's preference, they should receive an Email, an SMS, or a Push Notification on their phone.
* **Your Task:** 
  1. How will you use **Abstraction** to define a common notification behavior?
  2. Implement three separate classes for Email, SMS, and Push notifications.
  3. Write a `NotificationService` class with a method `sendOrderAlert(NotificationSender sender, String message)` that demonstrates **Polymorphism**.

---

### Scenario 2: The Ride-Hailing App (Uber-like)
**Problem:** You are designing the pricing module for a ride-sharing app. The app has different ride types: `EconomyRide`, `PremiumRide`, and `PoolRide`. Each ride calculates fares differently based on distance and traffic.
* **Your Task:**
  1. Create a base `Ride` class or interface.
  2. Implement the unique fare calculation formulas for each ride type using **Method Overriding**.
  3. Ensure the driver's current coordinates and user details are protected using **Encapsulation**.

---

### Scenario 3: The Document Parser Tool
**Problem:** Your system needs to read and parse files upload by users. The system must support `.pdf`, `.csv`, and `.json` file formats. Each parser requires specific configurations (e.g., PDF parser needs password properties, CSV parser needs column delimiter properties).
* **Your Task:**
  1. Create an abstract class `DocumentParser` that defines common behaviors like `openFile()` and `closeFile()`, and an abstract method `parseData()`.
  2. Implement specific subclass parsers (`PdfParser`, `CsvParser`, `JsonParser`).
  3. How will you use constructors to ensure each parser receives its mandatory configurations during instantiation?
