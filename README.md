# 🏏 Nepal Premier League (NPL) Season 1: Performance Analysis
**A Complete Data Pipeline: From Web Scraping to Interactive Dashboards**

## 📌 Project Overview
This project demonstrates a complete **data engineering and analytics workflow** using Nepal Premier League (NPL) data. I scraped raw statistics, cleaned and transformed the data, and built interactive dashboards to uncover key insights about team strategy and player performance.

## 🎯 Key Objectives
- Build an **end-to-end data pipeline** from collection to visualization.
- Resolve common real-world data issues like redundancy and missing records.
- Derive **actionable insights** about team composition and success factors in the NPL.

## 📊 Live Dashboard
**👉 [View the Interactive Tableau Dashboard](https://public.tableau.com/app/profile/yourname/viz/YourDashboardName)**
*(Replace this with your actual Tableau Public link. If it's not public, remove this line.)*

---

## 🛠️ Technical Architecture & Process

```mermaid
flowchart LR
    A[“<b>1. Data Collection</b><br>Scraping with ParseHub”] --> B[“<b>2. Data Preparation</b><br>Python Pandas for Cleaning”];
    B --> C[“<b>3. Data Integration</b><br>SQL for Merging & Querying”];
    C --> D[“<b>4. Analysis & Insight</b><br>Identifying Key Patterns”];
    D --> E[“<b>5. Visualization</b><br>Building Dashboards in Tableau”];
