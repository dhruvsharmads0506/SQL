<div id="top">
    <br />
    <h1 align="center">🚀 MySQL Practice & Learning Repository</h1>
    <p align="center">
        A comprehensive SQL practice set covering DDL, DML, Joins, Set Operations, Subqueries, and Views.
    </p>
    <br />
</div>

<div align="center">
    <img src="https://img.shields.io/badge/Language-MySQL-blue?style=for-the-badge&logo=mysql" alt="MySQL Badge">
    <img src="https://img.shields.io/badge/Concepts-Intermediate-green?style=for-the-badge" alt="Intermediate Concepts Badge">
</div>

---

<br>

<h2 id="overview">📚 Overview & File Details</h2>

<p>This repository contains a structured, end-to-end SQL practice script (<code>mysql_practice.sql</code>) developed for learning and mastering essential database concepts. The script sequentially builds and queries three different database schemas (<code>ORG</code>, <code>temp</code>, and <code>Company_DB</code>) to provide diverse and realistic practice scenarios.</p>

<ul>
    <li><strong>File:</strong> <code>mysql_practice.sql</code></li>
    <li><strong>Author:</strong> Dhruv Sharma</li>
    <li><strong>Date:</strong> 18-11-2025</li>
    <li><strong>Purpose:</strong> A learning resource and practice set for fundamental to intermediate MySQL concepts.</li>
</ul>

---

<br>

<h2 id="concepts">🔑 Key SQL Concepts Covered</h2>

<p>The script systematically covers the following major SQL domains:</p>

<h3 id="ddl">1. Database & Table Management (DDL)</h3>
<p>DDL (Data Definition Language) commands are used to define the database structure or schema.</p>

| Command | Description | Example from Script |
| :--- | :--- | :--- |
| <strong><code>CREATE DATABASE</code></strong> | Creates a new SQL database. | <code>CREATE DATABASE ORG;</code> |
| <strong><code>CREATE TABLE</code></strong> | Creates a new table in the database. | <code>CREATE TABLE Worker (...);</code> |
| <strong><code>DROP TABLE</code></strong> | Deletes a table and all its data. | <code>DROP TABLE Customer;</code> |
| <strong><code>ALTER TABLE</code></strong> | Modifies the structure of an existing table (e.g., add, drop, or rename columns). | <code>ALTER TABLE account ADD interest...;</code> |
| <strong><code>DESCRIBE</code></strong> | Shows the structure of a table. | <code>DESC Worker;</code> |

<h3 id="dml">2. Data Manipulation (DML)</h3>
<p>DML (Data Manipulation Language) commands are used for managing data within schema objects.</p>

| Command | Description | Key Feature |
| :--- | :--- | :--- |
| <strong><code>INSERT INTO</code></strong> | Adds new rows of data into a table. | Basic data entry. |
| <strong><code>SELECT</code></strong> | Retrieves data from a database. | Used with <code>WHERE</code>, <code>ORDER BY</code>, <code>GROUP BY</code>. |
| <strong><code>UPDATE</code></strong> | Modifies existing records in a table. | Includes use of <code>SET SQL_SAFE_UPDATES = 0</code> for bulk updates. |
| <strong><code>DELETE FROM</code></strong> | Deletes records from a table. | Used with <code>WHERE</code> clause for targeted deletion. |
| <strong><code>REPLACE INTO</code></strong> | Works like <code>INSERT</code>, but replaces the row if the primary key already exists. | Demonstrates `VALUES`, `SET`, and `SELECT` syntax. |

<h3 id="constraints">3. Constraints & Referential Integrity</h3>
<p>Enforcing data rules for reliable data storage.</p>
<ul>
    <li><strong><code>PRIMARY KEY</code></strong>: Uniquely identifies each record.</li>
    <li><strong><code>FOREIGN KEY</code></strong>: Links tables; demonstrated with:
        <ul>
            <li><code>ON DELETE CASCADE</code>: Deletes child rows when parent is deleted.</li>
            <li><code>ON DELETE SET NULL</code>: Sets foreign key to <code>NULL</code> when parent is deleted.</li>
        </ul>
    </li>
    <li><strong><code>CHECK</code></strong>: Ensures values satisfy a specific condition (e.g., <code>CHECK(balance > 10000)</code>).</li>
    <li><strong><code>DEFAULT</code></strong>: Sets a default value if no value is provided.</li>
</ul>

<h3 id="queries">4. Filtering, Sorting, and Aggregation</h3>
<p>Techniques for analyzing and organizing data.</p>
<ul>
    <li><strong>Filtering:</strong> Use of <code>WHERE</code> with operators like <code>></code>, <code>BETWEEN</code>, <code>IN</code>, <code>NOT IN</code>, and <code>IS NULL</code>.</li>
    <li><strong>Pattern Matching:</strong> Use of the <code>LIKE</code> operator with wildcards (<code>%</code> and <code>_</code>).</li>
    <li><strong>Aggregation:</strong> Use of functions like <code>COUNT()</code>, <code>AVG()</code>, <code>SUM()</code>, <code>MIN()</code>, and <code>MAX()</code>.</li>
    <li><strong>Grouping:</strong> Use of <code>GROUP BY</code> and <code>HAVING</code> (e.g., finding departments with more than 2 employees).</li>
</ul>

<h3 id="joins">5. Joins 🔗</h3>
<p>Combining data from related tables (Employee, Client, Project).</p>

| Join Type | Description | Script Example |
| :--- | :--- | :--- |
| <strong><code>INNER JOIN</code></strong> | Returns records with **matching values** in both tables. | <code>employee INNER JOIN project</code> |
| <strong><code>LEFT JOIN</code></strong> | Returns all records from the left table, and matched records from the right. | <code>employee LEFT JOIN project</code> |
| <strong><code>RIGHT JOIN</code></strong> | Returns all records from the right table, and matched records from the left. | <code>employee RIGHT JOIN project</code> |
| <strong><code>CROSS JOIN</code></strong> | Returns the **Cartesian product** (all possible combinations). | <code>Employee CROSS JOIN Project</code> |

<h3 id="setops">6. Set Operations</h3>
<p>Combining or comparing results of two <code>SELECT</code> statements (using Dept1 and Dept2 tables).</p>
<ul>
    <li><strong><code>UNION</code></strong>: Combines results, removing duplicates.</li>
    <li><strong><code>INTERSECT</code> (Simulated)</strong>: Achieved using <code>INNER JOIN</code>.</li>
    <li><strong><code>MINUS</code> (Simulated)</strong>: Achieved using <code>LEFT JOIN</code> and checking for <code>IS NULL</code>.</li>
</ul>

<h3 id="subqueries">7. Subqueries (Nested Queries)</h3>
<p>Using one query's result to inform another.</p>
<ul>
    <li><strong>Non-Correlated:</strong> Using <code>IN</code> with a subquery (e.g., older than average age).</li>
    <li><strong>Derived Table:</strong> Subquery used in the <code>FROM</code> clause.</li>
    <li><strong>Correlated Subquery:</strong> Advanced example to find the Nth highest value (3rd oldest employee).</li>
</ul>

<h3 id="views">8. Views</h3>
<p>Creating, modifying, and dropping virtual tables.</p>
<ul>
    <li><strong><code>CREATE VIEW</code></strong>: Creates a simplified view of complex data.</li>
    <li><strong><code>ALTER VIEW</code></strong>: Updates the view definition.</li>
    <li><strong><code>DROP VIEW</code></strong>: Removes the virtual table.</li>
</ul>

---
<br>
<p align="center">
    Made with ❤️ for SQL learners.
</p>
