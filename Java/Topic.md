# Java Topics for Spring Boot (Interview Prep)

This document classifies Java concepts based on their relevance and necessity for **Spring Boot** development and interviews. 

---

## ✅ Necessary Java Concepts for Spring Boot
These topics are **mandatory**. You will use them daily in Spring Boot, and interviewers will frequently ask how they relate to the framework.

### 1. Object-Oriented Programming (OOPs)
Spring Boot is built entirely on OOP principles.
- [X] **Interfaces**: Vital because Spring uses interface-driven programming (e.g., Spring Data JPA `JpaRepository`, Service interfaces).
- [X] **Polymorphism & Abstraction**: Spring's Dependency Injection (DI) injects interface implementations dynamically at runtime.
- [X] **Encapsulation**: Used in creating Beans, DTOs, and Entity classes (private fields with getters/setters).

### 2. Java 8+ Features (Modern Java)
Modern Spring Boot (especially Spring Boot 3.x, which requires Java 17+) relies heavily on these features.
- [ ] **Streams & Lambdas**: Used for data processing in services and mapping database entities to DTOs.
- [ ] **Optional Class**: Spring Data JPA methods like `findById()` return `Optional<T>`. You must know how to handle them.
- [ ] **Records (Java 16+)**: Widely used in Spring Boot as lightweight, boilerplate-free DTOs (Data Transfer Objects).
- [ ] **Default & Static Methods in Interfaces**: Crucial for custom repository behavior and security configurations.

### 3. Java Collections Framework
You will constantly manipulate collections when retrieving database results or handling request bodies.
- [ ] **List (ArrayList, LinkedList)**: Returning lists of data from controllers/services.
- [ ] **Set (HashSet)**: Defining `one-to-many` or `many-to-many` relationships in JPA entities to prevent duplicate records.
- [ ] **Map (HashMap)**: Handling dynamic JSON payloads, properties mapping, and context caches.

### 4. Annotations & Reflection
Spring Boot is highly annotation-driven.
- [ ] **Custom Annotations**: Understanding `@Target`, `@Retention`, and how Spring detects beans using custom annotations.
- [ ] **Reflection API Basics**: Knowing how Spring automatically instantiates and injects beans (via `@Autowired` or constructor injection) using reflection under the hood.

### 5. Exception Handling
Critical for building robust REST APIs.
- [ ] **Exception Hierarchy**: Understanding `RuntimeException` vs checked exceptions.
- [ ] **Custom Exceptions**: Creating custom business exceptions (e.g., `ResourceNotFoundException`).
- [ ] **Global Exception Handling**: Knowing how exception hierarchy integrates with Spring's `@ControllerAdvice` and `@ExceptionHandler`.

### 6. Generics
- [ ] **Generic Classes & Methods**: Essential for writing reusable REST responses (e.g., `ResponseEntity<T>`) and understanding Spring's generic interfaces like `Repository<T, ID>`.

### 7. Thread Safety & Beans Scope
- [ ] **Singleton Pattern & Thread Safety**: By default, Spring beans are Singletons. You must understand that instance variables in a Spring Bean (like a `@Service` or `@Controller`) are shared across threads, requiring thread-safe practices.

---

