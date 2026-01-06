# 🏏 NPL Data Analysis: From Raw Stats to Winning Insights

**A complete data pipeline project showing how I process data and find stories in numbers.**

## 🔍 What I Discovered
My analysis revealed a **winning secret**: 80% of teams relied heavily on just 1-2 star players, but the **champion was different**—they had a balanced team where everyone contributed.

*Think of it like a cricket version of "Don't put all your eggs in one basket."*

## 🛠️ My Process (The Data Journey)

### **1. Collecting the Data** 📥
- **Where:** ESPNcricinfo website
- **How:** Used ParseHub to neatly collect:
  - Batting stats (runs, strike rates)
  - Bowling stats (wickets, economy)
  - Player info (team, role)

### **2. Cleaning & Fixing Problems** 🧹
**The Problem:** Raw data had players who didn't even bat or bowl!
**My Solution:** I used **Python (Pandas)** to tag each player:
```python
# Simple but crucial fix
player['did_play'] = 'Yes' if (player['runs'] > 0 or player['wickets'] > 0) else 'No'
