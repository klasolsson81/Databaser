# Övningar - Vecka 1 - Simple SQL

Detta repository innehåller lösningar för den första veckans SQL-övningar i .NET-utbildningen. Projekten fokuserar på databasdesign, relationer (Primary/Foreign Keys), JOINs, aggregatfunktioner och subqueries.

## Miljö & Verktyg
* **Databas:** SQL Server Express 2025
* **Verktyg:** SQL Server Management Studio (SSMS) 2022
* **Framework:** .NET 8 (för framtida kopplingar)

---

## Övningsöversikt

### 1. Musikbiblioteket
Fokus på grundläggande tabellstrukturer och kopplingar mellan Artister, Album och Låtar.
* **Tekniker:** `CREATE TABLE`, `FOREIGN KEY`, `INNER JOIN`, `LEFT JOIN`.

### 2. Game Store
En mini-spelbutik för att hantera inventering och försäljning.
* **Tekniker:** `SUM()`, `GROUP BY`, `HAVING`, samt `TRIGGERS` för loggning.

### 3. Social Feed
Ett förenklat socialt nätverk med användare, inlägg och likes.
* **Tekniker:** Många-till-många-relationer, `EXISTS` vs `JOIN`.

### 4. Hogwarts Course Planner
Ett system för att hantera studenter och kursregistreringar.
* **Tekniker:** Kopplingstabeller, `UNIQUE` constraints och validering via triggers.

### 5. Analytics Challenge
Avancerad analys av orderdata.
* **Tekniker:** Subqueries i `WHERE`, `RANK()` (Window Functions) och komplex datamanipulering.

---

## Hur man använder skripten
Varje mapp innehåller numrerade SQL-filer som bör köras i ordning:
1. `01_CreateTables.sql` - Skapar databasen och tabellstrukturen.
2. `02_InsertData.sql` - Fyller tabellerna med testdata.
3. `03_Queries.sql` - Innehåller lösningarna på uppgifterna.
4. `04_Bonus_...` - Innehåller extra utmaningar som triggers eller constraints.

---
*Utvecklat av Klas Olsson, 2026*
