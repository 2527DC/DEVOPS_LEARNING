# JavaScript Interview Preparation: Core & Advanced Topics

A comprehensive checklist of JavaScript concepts categorized for technical interviews, spanning from foundational concepts to advanced runtime mechanics.

---

## 📌 1. Basic / Fundamental Topics
These form the bedrock of JavaScript. Interviewers expect you to know these inside out without hesitation.

### A. Syntax & Language Fundamentals
- [ ] **Variables & Scope:** `var` vs `let` vs `const`, function scope vs block scope, hoisting, temporal dead zone (TDZ).
- [ ] **Data Types:**
  - Primitives (String, Number, Boolean, Null, Undefined, Symbol, BigInt).
  - Objects/Reference Types (Arrays, Objects, Functions).
  - Type Coercion (Implicit vs Explicit, `==` vs `===`).
  - Checking types (`typeof` vs `instanceof`).
- [ ] **Operators & Control Flow:** Nullish coalescing (`??`), Optional chaining (`?.`), short-circuit evaluation (`&&`, `||`).

### B. Functions & Execution
- [ ] **Function Declarations vs Expressions:** Syntax, hoisting differences.
- [ ] **Arrow Functions:** Syntax, lack of `arguments` object, lexical binding of `this` (cannot be used as constructor functions).
- [ ] **IIFE (Immediately Invoked Function Expressions):** Syntax, use cases (data privacy, module pattern).
- [ ] **Parameters & Arguments:** Default parameters, rest parameters (`...rest`), spread syntax (`...spread`).

### C. Data Structures (Built-in)
- [ ] **Arrays:**
  - Mutator methods (`push`, `pop`, `shift`, `unshift`, `splice`, `reverse`, `sort`).
  - Accessor/Iteration methods (`map`, `filter`, `reduce`, `forEach`, `find`, `some`, `every`, `flat`).
- [ ] **Objects:** Literal creation, property access, dynamic keys, checking key existence (`in`, `hasOwnProperty`, `Object.hasOwn`).
- [ ] **Maps & Sets:** Differences from standard Objects and Arrays, use cases, performance benefits, WeakMap and WeakSet (garbage collection implications).

---

## 🚀 2. Intermediate / Core Topics
These are the most common ground for screening questions and hands-on coding exercises.

### A. Scope, Closures & Context
- [ ] **Lexical Scope & Scope Chain:** How JavaScript searches for variables.
- [ ] **Closures:** Definition, lexical environment, practical applications (encapsulation/private variables, memoization, currying, module pattern).
- [ ] **Execution Context & Call Stack:** Creation phase vs Execution phase, Global execution context, Function execution context.
- [ ] **The `this` Keyword:** Rules of determination (implicit, explicit, default, new binding), lexical `this` in arrow functions.
- [ ] **Call, Apply, and Bind:** Differences, usage, and creating custom polyfills for them.

### B. Object-Oriented JS & Prototypes
- [ ] **Prototype Chain & Inheritance:** Prototypical inheritance, `__proto__`, `prototype` property, prototype lookup mechanism.
- [ ] **Constructor Functions & `new` Keyword:** What happens under the hood when `new` is invoked.
- [ ] **Classes (ES6):** Syntax, `extends`, `super`, static methods, getters/setters, private class fields (`#privateField`).

### C. Asynchronous JavaScript (The Fundamentals)
- [ ] **Callbacks:** Synchronous vs asynchronous callbacks, callback hell.
- [ ] **Promises:** States (pending, fulfilled, rejected), creation, chaining, error handling (`catch`, `finally`), utility methods (`Promise.all`, `Promise.allSettled`, `Promise.race`, `Promise.any`).
- [ ] **Async/Await:** Syntactic sugar on promises, error handling with `try...catch`, writing sequential vs parallel async code.

---

## 🔥 3. Advanced / Expert Topics
These distinguish senior engineers. Deep knowledge here is tested in architecture and system design interviews.

### A. The JavaScript Runtime & Event Loop
- [ ] **Single-threaded nature:** How JS handles concurrency despite being single-threaded.
- [ ] **Event Loop Architecture:** Call Stack, Web APIs/Node APIs, Task Queue (Macrotask), Microtask Queue (Promises, `queueMicrotask`, `process.nextTick`).
- [ ] **Priority of execution:** Microtasks vs Macrotasks execution order.

### B. Advanced Memory & Performance
- [ ] **Memory Management:** Garbage collection (Mark-and-sweep algorithm), memory allocation.
- [ ] **Memory Leaks:** Common causes (dangling event listeners, detached DOM nodes, closures, global variables) and how to debug/profile them.
- [ ] **Performance Optimizations:** Debouncing vs Throttling, `requestAnimationFrame`, `requestIdleCallback`.

### C. Modern JS & Metaprogramming
- [ ] **Generators & Iterators:** `function*`, `yield`, custom iterables (`[Symbol.iterator]`).
- [ ] **Proxies & Reflect:** Intercepting object operations, validation, reactivity patterns (e.g., Vue 3 reactive model).
- [ ] **Modules:** ES Modules (`import`/`export`) vs CommonJS (`require`/`module.exports`), static analysis, tree-shaking.

### D. Advanced Design Patterns & DOM Mechanics
- [ ] **Design Patterns:** Singleton, Factory, Observer/Pub-Sub, Module, Decorator.
- [ ] **Event Delegation & Bubbling:** Bubbling vs capturing phases, event delegation pattern, `event.target` vs `event.currentTarget`, preventing default behavior (`event.preventDefault()`) and stopping propagation (`event.stopPropagation()`).
- [ ] **Polyfills & Transpilation:** Writing custom polyfills for ES6+ features (e.g., custom `Promise`, custom `Array.prototype.map`, custom `bind`).

---

## 📈 4. Practice & Coding Exercises
Interviewers will often ask you to implement these from scratch:
1. **Debounce & Throttle** functions (with leading/trailing edge options).
2. **Polyfills** for `Promise.all`, `Promise.allSettled`, `Array.prototype.reduce`, `Array.prototype.map`, `Array.prototype.filter`, `Function.prototype.bind`.
3. **Deep Clone** function (handling circular references, nested objects, functions, arrays, dates, regExps).
4. **Curry** function (supporting placeholder arguments or arbitrary parameter lengths).
5. **Flatten Array / Object** (converting nested structures to single-level arrays/objects).
6. **Event Emitter** class (implementing `on`, `off`, `emit`, and `once`).
