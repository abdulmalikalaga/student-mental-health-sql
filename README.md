# 🎓 Student Mental Health in Japan: Does Length of Stay Matter?

An SQL analysis of how international students' mental health, social connectedness and acculturative stress change with their length of stay at a Japanese university.

<img width="945" height="522" alt="mentalhealth" src="https://github.com/user-attachments/assets/2a6fc91f-4b54-448e-81ea-2772420e8fa4" />

---

## 📌 Project Overview

A Japanese international university surveyed its students in 2018 and published a study the following year. It found that international students have a higher risk of mental health difficulties than the general population, and that **social connectedness** and **acculturative stress** (the stress of joining a new culture) are predictive of depression.

This project explores the survey data with **PostgreSQL** to ask:

> Do international students' depression, social connectedness and acculturative stress scores change with how long they have been in Japan?

## 🗂️ Dataset

- **File:** [`data/students.csv`](data/students.csv)
- **Size:** 286 rows × 50 columns
- **Source:** 2018 student survey from a Japanese international university (provided through DataCamp)

| Column | Description |
| ------ | ----------- |
| `inter_dom` | Student type (international or domestic) |
| `japanese_cate` | Japanese language proficiency |
| `english_cate` | English language proficiency |
| `academic` | Academic level (undergraduate or graduate) |
| `age` | Current age of student |
| `stay` | Length of stay in years |
| `todep` | Total depression score (PHQ-9 test) |
| `tosc` | Total social connectedness score (SCS test) |
| `toas` | Total acculturative stress score (ASISS test) |

## 🛠️ Tools Used

- **PostgreSQL** for querying
- **DataCamp Workspace** (Jupyter notebook) for running the analysis

## 🔍 Approach

1. Previewed the `students` table.
2. Filtered to **international students only** (`WHERE inter_dom = 'Inter'`).
3. Grouped by `stay` (length of stay in years).
4. Calculated the number of students and the average depression, social connectedness and acculturative stress scores for each length of stay.

```sql
SELECT stay,
       COUNT(inter_dom)   AS count_int,
       ROUND(AVG(todep), 2) AS average_phq,
       ROUND(AVG(tosc), 2)  AS average_scs,
       ROUND(AVG(toas), 2)  AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
```

The full query is in [`sql/analysis.sql`](sql/analysis.sql).

## 📊 Results

| Stay (years) | Students | Avg. depression (PHQ-9) | Avg. social connectedness (SCS) | Avg. acculturative stress (ASISS) |
| :---: | :---: | :---: | :---: | :---: |
| 10 | 1 | 13.00 | 32.00 | 50.00 |
| 8 | 1 | 10.00 | 44.00 | 65.00 |
| 7 | 1 | 4.00 | 48.00 | 45.00 |
| 6 | 3 | 6.00 | 38.00 | 58.67 |
| 5 | 1 | 0.00 | 34.00 | 91.00 |
| 4 | 14 | 8.57 | 33.93 | 87.71 |
| 3 | 46 | 9.09 | 37.13 | 78.00 |
| 2 | 39 | 8.28 | 37.08 | 77.67 |
| 1 | 95 | 7.48 | 38.11 | 72.80 |

## 💡 Key Findings

- **Most international students are newcomers.** 180 of the 201 international students (about 90%) have stayed 3 years or less, so the reliable part of the data is the 1–4 year range.
- **Depression scores are highest around year 3** (9.09), compared with 7.48 in year 1.
- **Acculturative stress rises over the first four years**, from 72.80 in year 1 to 87.71 in year 4.
- **Social connectedness drifts lower over the same period**, from 38.11 in year 1 to 33.93 in year 4.
- Taken together, longer stays in the 1–4 year range go with slightly higher depression, higher acculturative stress and lower social connectedness, which is consistent with the study's conclusion.

## ⚠️ Limitations

- Groups with a stay of **5+ years have only 1–3 students each**, so their averages are not reliable and should not be used to draw conclusions.
- This is a **correlation, not proof of cause**. Averages by year do not show that a longer stay *causes* higher scores.
- This analysis covers international students only; it does not yet compare them with domestic students.

## 🚀 Next Steps

- Compare international and domestic students on the same measures.
- Group `stay` into short, medium and long stay (the `stay_cate` column) to reduce the small-group problem.
- Check how language proficiency and academic level relate to the scores.

## 📁 Repository Structure

```
student-mental-health-sql/
├── README.md
├── notebook.ipynb        # Full DataCamp Workspace notebook
├── sql/
│   └── analysis.sql      # The SQL query used in the analysis
├── data/
│   └── students.csv      # Survey dataset
└── images/
    └── mentalhealth.jpg  # Cover image used in the notebook and README
```

## ▶️ How to Reproduce

1. Load `data/students.csv` into a PostgreSQL table named `students`.
2. Run the query in `sql/analysis.sql`.
3. Or open `notebook.ipynb` in DataCamp Workspace / Jupyter.

## 👤 Author

**Deji**
GitHub: [@abdulmalikalaga](https://github.com/abdulmalikalaga)
