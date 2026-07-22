# Core Interview Scenarios & Edge Cases

This guide covers critical interview scenarios, edge cases, and architectural questions related to your learning topics (Java, JavaScript, AWS, Terraform, Kubernetes, and Databases) that frequently appear in technical interviews but were not explicitly covered in your daily notes.

---

## 1. Java: Advanced Threading & Memory Scenarios

### Scenario A: The Limitation of `volatile`
* **Interview Question:** "If I declare a variable `private volatile int counter = 0;` and have 10 threads call `counter++` concurrently, is this operation thread-safe?"
* **The Trap:** Candidates think `volatile` makes it thread-safe.
* **The Reality:** No, it is **not** thread-safe. 
  * `counter++` is a compound operation (Read ➔ Modify ➔ Write).
  * `volatile` only guarantees **visibility** (that thread B immediately sees updates made by thread A) and prevents **instruction reordering**. It does **not** guarantee **atomicity**.
  * **Solution:** To make it thread-safe, you must use `synchronized`, a `ReentrantLock`, or an `AtomicInteger` (which uses Compare-And-Swap/CAS at the CPU level).

### Scenario B: Abstract Class vs. Interface in Java 8+
* **Interview Question:** "Since Java 8 introduced `default` and `static` methods in interfaces, and Java 9 introduced `private` methods, why do we still need abstract classes?"
* **The Answer:** 
  * **State (Instance Fields):** Interfaces cannot hold instance state (fields). Every variable in an interface is implicitly `public static final`. Abstract classes can have non-final instance fields (state).
  * **Constructor:** Abstract classes can have constructors; interfaces cannot.
  * **Single Inheritance vs Multiple Implementation:** A class can only extend one abstract class, but it can implement multiple interfaces.

---

## 2. JavaScript: Event Loop & Closure Edge Cases

### Scenario A: Execution Order in the Event Loop
* **Interview Question:** "What is the output order of this script, and why?"
  ```javascript
  console.log('1');

  setTimeout(() => {
      console.log('2');
  }, 0);

  Promise.resolve().then(() => {
      console.log('3');
  });

  console.log('4');
  ```
* **The Answer:** `1, 4, 3, 2`
* **The Reason:**
  1. Synchronous code runs first: `1` and `4` are printed.
  2. The Event Loop processes the **Microtask Queue** (Promises, `process.nextTick`) before the **Macrotask Queue** (setTimeout, setInterval).
  3. The promise resolution (`3`) is in the Microtask Queue, so it prints next.
  4. The `setTimeout` callback (`2`) is in the Macrotask Queue and runs last, even though the delay is `0`ms.

### Scenario B: Closures and Memory Leaks
* **Interview Question:** "How do closures cause memory leaks in JavaScript?"
* **The Answer:** A closure retains references to variables in its outer lexical scope even after the outer function has finished executing. If a closure is attached to a global object or a long-lived DOM element, the variables in that outer scope cannot be garbage collected, causing a memory leak.

---

## 3. AWS & Terraform: Infrastructure-as-Code Scenarios

### Scenario A: Terraform State Locking & Drift
* **Interview Question:** "What happens if someone manually changes the size of an EC2 instance in the AWS Console, and then you run `terraform plan`?"
* **The Answer:** This is called **State Drift**. During a `plan` or `apply`, Terraform refreshes its state by querying the real AWS APIs. It will detect that the real resource differs from the code configuration and the `terraform.tfstate` file. It will then output a plan to modify the instance back to the state defined in the Terraform code.

### Scenario B: Team Collaboration with Remote State
* **Interview Question:** "If two DevOps engineers run `terraform apply` at the exact same time, what happens, and how do you prevent corruption?"
* **The Answer:** Without locking, the state file could become corrupted or overridden.
* **The Solution:** Use **Remote State Backend with Locking** (e.g., storing the state file in an Amazon S3 bucket and configuring a DynamoDB table for state locking and consistency).

---

## 4. Kubernetes: Production Troubleshooting Scenarios

### Scenario A: Troubleshooting `CrashLoopBackOff`
* **Interview Question:** "A Pod is showing `CrashLoopBackOff` status. What are your step-by-step troubleshooting commands?"
* **The Answer:**
  1. Check Pod details to find exit codes or error messages:
     ```bash
     kubectl describe pod <pod-name>
     ```
  2. View logs of the crashed container:
     ```bash
     kubectl logs <pod-name> --previous
     ```
     *(The `--previous` flag is critical because it displays logs of the container instance that just crashed).*
  3. Common causes: Application runtime errors (e.g. database connection timeout, missing environment variables), misconfigured liveness probes, or file permission issues inside the container.

### Scenario B: Ingress vs. Ingress Controller
* **Interview Question:** "Can you explain the difference between an Ingress and an Ingress Controller?"
* **The Answer:** 
  * **Ingress:** A Kubernetes configuration resource (a YAML file) that defines rules for routing external HTTP/S traffic to internal services.
  * **Ingress Controller:** The actual application (like Nginx, Traefik, or AWS ALB Controller) running in the cluster that reads the Ingress rules and routes the traffic. An Ingress resource does nothing without an active Ingress Controller.

---

## 5. PostgreSQL: Performance & Execution Scenarios

### Scenario A: SQL Query Execution Order
* **Interview Question:** "What is the logical order of execution of a SELECT query?"
* **The Trap:** Candidates think it executes in the order it is written (starting with SELECT).
* **The Reality:** 
  1. `FROM` / `JOIN` (Gathers data sources)
  2. `WHERE` (Filters rows)
  3. `GROUP BY` (Groups filtered rows)
  4. `HAVING` (Filters groups)
  5. `SELECT` (Selects and computes expressions)
  6. `DISTINCT` (Removes duplicate rows)
  7. `ORDER BY` (Sorts output)
  8. `LIMIT` / `OFFSET` (Restricts rows returned)

### Scenario B: Indexing Pitfalls
* **Interview Question:** "I have a B-tree index on `created_at`. Why is the query `SELECT * FROM orders WHERE DATE(created_at) = '2026-07-22';` not using the index?"
* **The Answer:** Applying a function (like `DATE()`, `LOWER()`, etc.) to an indexed column prevents the database from using standard index scans. It must perform a Full Table Scan to evaluate the function for every row.
* **The Solution:** Rewrite the query to use a range:
  ```sql
  WHERE created_at >= '2026-07-22 00:00:00' AND created_at < '2026-07-23 00:00:00'
  ```
  Or create a expression-based index (Function-based index) on `DATE(created_at)`.
