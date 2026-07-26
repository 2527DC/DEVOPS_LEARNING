# JavaScript Interview Topics

A concise, well‑structured checklist of core and advanced JavaScript concepts that are frequently asked in technical interviews.

## 1. Fundamental Concepts
- **Data Types** – Primitive types (String, Number, Boolean, Null, Undefined, Symbol, BigInt) and reference types (Object, Array, Function).
- **Execution Model** – Call stack, event loop, micro‑tasks vs. macro‑tasks, and how asynchronous code is scheduled.
- **Variables** – `var`, `let`, `const`; hoisting behavior; Temporal Dead Zone (TDZ).

## 2. Functions
- **Function Declaration vs. Function Expression** – hoisting differences and when each is evaluated.
- **Arrow Functions** – lexical `this`, no own `arguments` object, concise syntax.
- **Rest Parameters** – gather remaining arguments into an array.
  ```js
  function sum(...numbers) {
    return numbers.reduce((a, b) => a + b, 0);
  }
  ```
- **Spread Operator** – expand an iterable into individual elements or create shallow copies of arrays/objects.
  ```js
  const originalUser = { id: 1, name: "Chethan", role: "Developer" };
  const updatedUser = { ...originalUser, role: "Team Lead" };
  console.log(updatedUser); // { id: 1, name: "Chethan", role: "Team Lead" }
  console.log(originalUser.role); // "Developer" (original unchanged)
  ```

## 3. Control Flow
- Conditional statements: `if`, `else if`, `else`, `switch`.
- Ternary operator: `condition ? exprIfTrue : exprIfFalse`.

## 4. Loops
- Classic loops: `for`, `while`, `do…while`.
- Collection iteration: `for…of`, `for…in`.
- Array helpers: `map`, `filter`, `reduce`, `forEach`.
- **`let` and `var` in loops** – block scoping with `let` vs. function scoping with `var`.

## 5. Scope & Closures
- Lexical scope chain and how variables are resolved.
- Closures – functions retaining access to their outer lexical environment.

## 6. Promises
- **States** – pending, fulfilled, rejected.
- Methods: `then`, `catch`, `finally`.
- Common patterns: promise hell, promise chaining.
- Utility methods:
  - `Promise.all` – resolves when **all** promises resolve; rejects immediately if any reject.
  - `Promise.allSettled` – waits for every promise to settle and returns an array describing each outcome.
  - `Promise.race` – fulfills or rejects with the first settled promise (useful for time‑outs).
  - `Promise.any` – fulfills with the first fulfilled promise; rejects with `AggregateError` if all reject.

## 7. Async / Await
- Syntactic sugar over promises.
- Error handling with `try…catch`.

## 8. The `this` Keyword
- Binding rules: default binding, implicit binding, explicit binding (`call`, `apply`, `bind`), `new` binding, and lexical binding in arrow functions.

## 9. Timers
- `setTimeout()` – schedule a callback after a delay.

## 10. ES6 Features
- Spread and Rest (covered in the Functions section).
- Arrow functions – concise syntax and lexical `this`.
- Ternary operator – inline conditional expressions.
- Destructuring of arrays and objects.
  ```js
  const [first, ...rest] = [1, 2, 3, 4];
  const { name, ...others } = { name: "Alice", age: 30, city: "NY" };
  ```

## 11. Object‑Oriented JavaScript (OOP)
- **Prototype Chain** – inheritance via `[[Prototype]]`.
- **Classes** – `class` syntax, `extends`, `super`, static methods, getters/setters, private fields (`#`).
- **Encapsulation** – hiding internal state using closures or private class fields.
- **Inheritance** – subclassing with `extends`.

---

Use this checklist as a quick reference while preparing for JavaScript interviews.
