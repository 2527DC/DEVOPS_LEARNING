# Access Modifiers in Java

Access modifiers in Java help control the visibility (scope) of classes, constructors, variables, methods, and data members. They are the foundation of **Encapsulation**.

There are four access modifiers in Java:
1. **`private`**
2. **`default`** (no keyword)
3. **`protected`**
4. **`public`**

---

## 📊 Access Visibility Matrix

| Modifier | Within Same Class | Within Same Package | Subclass (Same Package) | Subclass (Different Package) | Outside Package (World) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **`private`** | ✅ Yes | ❌ No | ❌ No | ❌ No | ❌ No |
| **`default`** (No keyword) | ✅ Yes | ✅ Yes | ✅ Yes | ❌ No | ❌ No |
| **`protected`** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes (via inheritance only) | ❌ No |
| **`public`** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |

---

## 🔍 Detailed Modifiers & Scopes

### 1. `private` (Class-Level Scope)
The most restrictive modifier. Members marked `private` are visible **only within the class they are declared in**.
* **Use case**: Hiding sensitive data fields (variables) to enforce encapsulation.
* **Code Example**:
  ```java
  package pack1;

  public class Account {
      private double balance = 1000.0; // Invisible outside this class

      public double getBalance() { // Public getter to access private data
          return this.balance;
      }
  }
  ```

### 2. `default` (Package-Private Scope)
When no access modifier is specified, Java uses `default`. It is visible **only within the same package**.
* **Use case**: Sharing utilities or helper classes within a package but hiding them from the rest of the application.
* **Code Example**:
  ```java
  package pack1;

  class Helper { // No keyword = default class
      void showMessage() { // Default method
          System.out.println("Hello from Helper!");
      }
  }
  ```
  *(If another class in package `pack2` tries to import and use `Helper`, it will cause a compile-time error.)*

### 3. `protected` (Package + Subclass Scope)
Members marked `protected` are accessible within the **same package** AND by **subclasses in other packages** (via inheritance).
* **Use case**: When you want parent class variables or methods to be accessible to child classes but hide them from the general public.
* **Code Example**:
  ```java
  package pack1;

  public class Parent {
      protected void printHeritage() {
          System.out.println("Protected family history");
      }
  }
  ```
  ```java
  package pack2;
  import pack1.Parent;

  public class Child extends Parent {
      public void show() {
          printHeritage(); // Accessible because Child extends Parent
      }
  }
  ```

### 4. `public` (Universal Scope)
The least restrictive modifier. Members marked `public` are visible **everywhere** in the project.
* **Use case**: Exposing APIs, controllers, services, and entry points.
* **Code Example**:
  ```java
  package pack1;

  public class Config {
      public static final String APP_NAME = "SpringApp";
  }
  ```

---

## ⚠️ Important Rules & Interview Gotchas
1. **Class-Level Restrictions**: 
   * A top-level class (outer class) can **only** be declared as `public` or `default`. 
   * Top-level classes **cannot** be declared as `private` or `protected` (except for nested/inner classes).
2. **Method Overriding Rule**:
   * When overriding a method in a subclass, the overriding method **cannot declare a more restrictive access modifier** than the parent method.
   * *Example*: If a parent class method is `protected`, the overriding method in the child class must be `protected` or `public`. It cannot be `default` or `private`.
