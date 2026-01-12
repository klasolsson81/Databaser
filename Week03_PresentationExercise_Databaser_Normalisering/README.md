# Vecka 3: Databas-normalisering

Detta projekt fokuserar på att identifiera brister i databasdesign (redundans och anomalier) och åtgärda dessa genom normalisering till Tredje Normalform (3NF).

---

## Övning 1: E-handel (Orderhantering)

### Steg 1: Identifierade problem
I den ursprungliga tabellen fann jag följande brister:
* **Redundans:** Kundnamn (t.ex. "Alice") upprepas för varje order, vilket slösar utrymme.
* **Uppdateringsanomali:** Om en kund byter namn måste vi ändra det på varje enskild orderrad.
* **Raderingsanomali:** Om vi tar bort en order försvinner även informationen om vad produkten (t.ex. "Bok") kostar.

### Steg 2: Design (3NF)
Genom att dela upp datan i separata entiteter för Kunder, Produkter och Ordrar har vi eliminerat dubbellagring.

![Normalized Relational Database Schema](./01_Exercise.png)

### Steg 3: Implementering
Tabellerna skapas via skriptet: [`01_CreateTables.sql`](./01_CreateTables.sql)

---

## Övning 2: Skola (Klasser & Betyg)

### Steg 1: Identifierade problem
Den platta tabellen för skolan led av följande problem:
* **Redundans:** Lärarnas namn och klassnamn upprepas för varje enskild elev.
* **Uppdateringsanomali:** Om en lärare byter namn måste vi ändra det på flera rader, annars blir datan inkonsekvent.
* **Raderingsanomali:** Om vi tar bort den enda eleven i en klass (t.ex. Physics-101) försvinner även informationen om att klassen och läraren existerar.

### Steg 2: Design (3NF)
Strukturen har normaliserats till fyra relaterade tabeller: Lärare, Klasser, Elever och Betyg.

![Normalized School Database Schema](./02_Exercise.png)

### Steg 3: Implementering
Tabellerna skapas via skriptet: [`02_CreateSchoolTables.sql`](./02_CreateSchoolTables.sql)

---
*Utvecklat av Klas Olsson, 2026*
