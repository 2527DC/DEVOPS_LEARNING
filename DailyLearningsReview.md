# Review of Daily Learning Questions & Concepts

This document reviews the questions, terminology, and conceptual statements in [DailyLearnnings.md](file:///Users/admin/Desktop/Learning2/DailyLearnnings.md) to correct any misconceptions, clarify technical definitions, and fix typos.

---

## 1. Corrections to Direct Questions

### Question 1: Static Method Overriding (Java)
* **Your Note (Line 51):** `can the static method be overriden`
* **Review / Correction:** 
  * **Answer:** No, static methods **cannot** be overridden in Java. 
  * **Explanation:** Overriding depends on dynamic binding (runtime polymorphism). Since static methods are bound statically at compile-time to the class rather than the instance, a subclass method with the same signature merely **hides** (shadows) the superclass method, but does not override it.

### Question 2: Variable Shadowing & The `final` Keyword (Java)
* **Your Note (Line 52):** `got to know the shadowing concept in java  hapens while using the final keyword`
* **Review / Correction:**
  * **Misconception:** Variable shadowing does **not** require or depend on the `final` keyword.
  * **Explanation:** Shadowing occurs when a variable declared in an inner scope (like a local variable or method parameter) has the same name as a variable in an outer scope (like an instance field). It happens regardless of whether the variables are declared `final`. The `final` keyword only prevents the variable reference/value from being reassigned after initialization.

### Question 3: Comparing Columns of Different Datatypes in Joins (SQL)
* **Your Note (Line 61):** `Q what if we want to compare  the non datatype what approch should be followed`
* **Review / Correction:**
  * **Clarification:** If you meant *"how do we join columns with different (non-matching) datatypes?"*, the approach is **explicit type casting**.
  * **Explanation:** In PostgreSQL, you can cast one or both columns using the `::` operator or the `CAST()` function so they match.
    ```sql
    -- Example: Joining a numeric ID to a text ID
    SELECT * 
    FROM orders o
    JOIN users u ON o.user_id = u.id::integer;
    ```

### Question 4: Serverless Deployments & Privileged Containers
* **Your Note (Line 42):** `why cant    we use the serverless architecture deployment for piston type apliction ( clue : pist uses previlage mode as true )`
* **Review / Correction:**
  * **Terminology Check:** If "piston" refers to a **bastion** host or an application requiring root host namespace access, the premise is correct.
  * **Explanation:** Serverless container platforms (like AWS Fargate or Google Cloud Run) run in highly isolated, multi-tenant environments. They block the use of `privileged: true` containers to prevent escape to the underlying host kernel, which would compromise security.

---

## 2. Terminology & Spelling Fixes

To keep your logs clean and accurate, here are the corrected spellings for key technical terms in your notes:

| Date | Your Spelling | Correct Spelling | Concept |
| :--- | :--- | :--- | :--- |
| **16-7-26** | `Polimorfisam` | **Polymorphism** | Object-Oriented Programming pillar. |
| **16-7-26** | `inheritence` | **Inheritance** | Class relationship model. |
| **16-7-26** | `Queues` | **Queues** | Asynchronous task management in the Event Loop. |
| **16-7-26** | `protoytpe` | **Prototype** | JavaScript object chaining mechanism. |
| **17-7-26** | `previlage` | **Privileged** | Security mode for root access containers. |
| **18-7-26** | `transite` | **Transient** | Java keyword (`transient`) to skip serialization. |
| **22-7-26** | `initger` | **Integer** | Whole number data type. |
| **22-7-26** | `presission` | **Precision** | Floating-point accuracy bounds. |

---

## 3. Key Conceptual Verifications

* **JavaScript Overloading (Line 8):** *"method overriding and overloading doesn't happen strictly"*
  * **Verdict: Correct.** JavaScript has no native method signature overloading. If you declare two functions with the same name, the second one completely overrides the first.
* **Accounting Datatypes (Line 70):** *"double precision should not be used in the accounting where we use numeric data type"*
  * **Verdict: Correct.** Binary float representations introduce tiny rounding errors over time. Accounting systems must use exact fixed-point `numeric` / `decimal` types.
* **Terraform fmt vs. validate (Lines 18-19):**
  * **Verdict: Correct.** `terraform fmt` is strictly a style formatter. `terraform validate` is a syntax and attribute validation checker.
