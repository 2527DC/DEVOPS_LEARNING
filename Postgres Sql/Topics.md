# PostgreSQL Topics — Sequential Learning Path

This roadmap is ordered step-by-step from beginner fundamentals to advanced database administration and programming.

## Table of Contents
1. [Database Management](#1-database-management)
2. [Table Management](#2-table-management)
3. [Data Types](#3-data-types)
4. [Constraints](#4-constraints)
5. [Modifying Data (Mutations)](#5-modifying-data-mutations)
6. [Querying & Filtering Data](#6-querying--filtering-data)
7. [In-Built Functions & Aggregations](#7-in-built-functions--aggregations)
8. [JOINS & Schemas](#8-joins--schemas)
9.  [Views & Materialized Views](#9-views--materialized-views)
10. [Set Operators](#10-set-operators)
11. [Subqueries](#11-subqueries)
12. [Conditionals & Control Flow](#12-conditionals--control-flow)
13. [Indexes & Performance](#13-indexes--performance)
14. [Transactions](#14-transactions)
15. [Advanced PostgreSQL (PL/pgSQL & Objects)](#15-advanced-postgresql-plpgsql--objects)
16. [Roles & Permissions](#16-roles--permissions)

---

## 1. Database Management
*Learn how to create, inspect, modify, and drop databases.*
- `CREATE DATABASE`
- `SHOW` / List Databases (`\l`)
- `ALTER DATABASE`
- `RENAME` Database
- `DROP DATABASE`

---

## 2. Table Management
*Learn how to define structure and manage tables.*
- `CREATE TABLE`
- `ALTER TABLE`
- `DROP TABLE`
- `TRUNCATE TABLE`

---

## 3. Data Types
*Understand column data types for storing structured data.*
- `INTEGER`
- `TEXT`
- `BOOLEAN`
- `DATE`
- `TIMESTAMP`
- `JSON` / `JSONB`

---

## 4. Constraints
*Enforce data integrity and relationships at the table level.*
- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL` Constraint
- `UNIQUE` Constraint
- `CHECK` Constraint

---

## 5. Modifying Data (Mutations)
*Learn how to insert, update, delete, and upsert records.*
- `INSERT`
- `UPDATE`
- `DELETE`
- `UPSERT` (`ON CONFLICT`)

---

## 6. Querying & Filtering Data
*Learn the core operations for retrieving and filtering rows.*
- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `IN`
- `IS NULL`
- `LIKE` / `NOT LIKE`
- `BETWEEN`

---

## 7. In-Built Functions & Aggregations
*Transform data and compute summarized statistics.*

### Aggregate Functions
- `GROUP BY`
- `HAVING`
- `AVG()`
- `COUNT()`
- `MAX()`
- `MIN()`
- `SUM()`

### String Functions
- `CONCAT()`
- `FORMAT()`
- `UPPER()`
- `LOWER()`
- `REPLACE()`

### Date & Time Functions
- `CURRENT_DATE`
- `EXTRACT()`

### Window Functions
- `ROW_NUMBER()`

---

## 8. JOINS & Schemas
*Combine data across multiple tables and organize objects.*

### Joins
- `INNER JOIN`
- `LEFT JOIN`
- `FULL OUTER JOIN`
- `SELF JOIN`
- `CROSS JOIN`
- `NATURAL JOIN`

### Schema Management
- `CREATE SCHEMA`
- `ALTER SCHEMA`
- `DROP SCHEMA`

---

## 9. Views & Materialized Views
*Create virtual and cached tables to simplify queries and improve performance.*

### Standard Views
- `CREATE VIEW` (Simple & Complex Views)
- Updatable Views (`WITH CHECK OPTION`)

### Materialized Views
- `CREATE MATERIALIZED VIEW`
- `REFRESH MATERIALIZED VIEW` (with `CONCURRENTLY`)

### Advanced & Management
- `CREATE RECURSIVE VIEW`
- `ALTER VIEW`
- `DROP VIEW`

---

## 10. Set Operators
*Combine the results of two or more `SELECT` statements.*
- `UNION`
- `INTERSECT`
- `EXCEPT`

---

## 11. Subqueries
*Nest queries inside larger queries for complex logic.*
- Introduction to Subqueries
- `EXISTS`
- `ANY`
- `ALL`

---

## 12. Conditionals & Control Flow
*Apply conditional logic directly within SQL queries.*
- `CASE`
- `COALESCE()`
- `NULLIF()`
- `CAST()`

---

## 13. Indexes & Performance
*Optimize query speed by indexing columns.*
- `CREATE INDEX`
- `DROP INDEX`
- `UNIQUE INDEX`
- Multicolumn Indexes

---

## 14. Transactions
*Ensure ACID properties and atomic execution of queries.*
- `BEGIN`
- `COMMIT`
- `ROLLBACK`

---

## 15. Advanced PostgreSQL (PL/pgSQL & Objects)
*Server-side programming, complex queries, triggers, and control statements.*
- Common Table Expressions (CTE - `WITH` clause)
- Block Structure
- Variables & Constants
- `IF` Statement
- `LOOP` Statement, `WHILE` Loops, `FOR` Loops
- `EXIT` & `CONTINUE`
- Stored Procedures
- Triggers
- Exception Handling

---

## 16. Roles & Permissions
*Manage user access, security roles, and privilege grants.*
- `CREATE ROLE`
- `ALTER ROLE`
- `DROP ROLE`
- `GRANT`
- `REVOKE`
- Role Membership
