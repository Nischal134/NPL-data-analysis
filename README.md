# NPL Data Analysis

## Project Overview
This project involves the collection, cleaning, and visualization of cricket data from the ESPNcricinfo website. The goal was to combine batting, bowling, and player profile information into a clean dataset suitable for detailed analysis and interactive visualization.

---

## Data Collection
- Data was **scraped from ESPNcricinfo** using ParseHub in CSV format.  
- Separate files were collected for:
  - **Batting statistics**
  - **Bowling statistics**
  - **Player profiles**

---

## Data Preparation
- All datasets were **combined into a single table** using SQL queries in the `data-manipulation.sql` file.  
- **Challenges faced**:
  - **Data redundancy** — duplicate or overlapping records were resolved within the SQL file.  
  - **Missing activity records** — some players had no batting or bowling activity, which could cause inaccuracies in analysis.  

- **Solution**:
  - Used the **Pandas library** to create a new column `did_bat/bowl` with values:
    - `T` → Player participated  
    - `F` → Player did not participate  

- The final dataset was **polished and structured** for visualization purposes.

---

## Data Visualization
- **Tableau** was used to create interactive visualizations.  
- All `.twbx` files correspond to specific visualization dashboards, which can be opened directly in Tableau.

---

## Project Structure
- `data-manipulation.sql` → SQL queries for data merging and cleaning  
- `Mainstream data/` → Raw batting, bowling, and profile CSV/Excel files  
- `Teamwise polishing/` → Processed and cleaned data files per team  
- Tableau `.twbx` files → Interactive dashboards for analysis  

---

## Technologies Used
- **Python (Pandas)** — Data cleaning and manipulation  
- **SQL** — Combining and querying multiple datasets  
- **Tableau** — Interactive visualization  
- **ParseHub** — Data scraping from ESPNcricinfo  

---

## Notes
- The project demonstrates the **full data analysis workflow**: scraping → cleaning → consolidation → visualization.  
- All files required for replication of results are included in this repository.
