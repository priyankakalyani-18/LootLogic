# 🎰 LootLogic

### Statistical Analysis of Gacha & Loot Box Systems Using Monte Carlo Simulation in R

**LootLogic** is a simulation-based statistical tool developed to study the probability mechanics, fairness, and player spending behavior behind randomized reward systems (Gacha/Loot Boxes) in modern video games.

By running thousands of virtual trials, the application approximates real-world outcomes to help users understand the effectiveness of "pity systems" and the true cost of rare-item acquisition.

---

## 🚀 Live Application

**[View the Live Dashboard on Shinyapps.io](https://priyankakalyani.shinyapps.io/LootLogic/)**

---

## 📸 Preview


*(Note: Replace 'screenshot.png' with the actual filename of the image you upload to your repository)*

---

## 🛠️ Project Requirements (Project 4)

This application was built using **R Shiny** and fulfills the following technical criteria:

* **Sidebar Layout:** Features a professional `sidebarLayout` for parameter adjustment.
* **Interactive Controls:** Includes multiple user inputs, such as `sliderInput` for probabilities and `numericInput` for simulation size and pity thresholds.
* **Reactive Logic:** Implements a `reactive()` expression to handle the heavy Monte Carlo simulations separately from the rendering logic, ensuring a smooth user experience.
* **HTML Integration:** Uses native R Shiny HTML functions (`h3`, `h4`, `h5`, `p`, `hr`) for structured documentation and interface design.
* **Live Deployment:** Successfully hosted on the public `shinyapps.io` server.

---

## 🧠 Methodology: Monte Carlo Simulation

The core of LootLogic is a Monte Carlo simulation. It models 1,000+ independent player sessions simultaneously. For each player, the script:

1. Generates random numbers to simulate individual "pulls."
2. Checks against the base success probability.
3. Applies a "Pity System" hard-cap if the player reaches a specific threshold without success.
4. Aggregates the data to show the average, median, and extreme "luck" outcomes.

---

## 📂 Repository Structure

```bash
LootLogic/
├── app.R           # Core Shiny application code
├── README.md        # Project documentation
└── screenshot.png   # Visual preview of the app

```

---

## 👩‍💻 Author

**Priyanka Kalyani** MSCA Doctoral Candidate (DC5)

Warsaw University of Technology

*Machine Learning & Structural Health Monitoring Researcher*
