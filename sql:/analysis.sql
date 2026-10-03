-- ============================================================
-- Project : Student Mental Health in Japan
-- Question: Does length of stay affect international students'
--           depression, social connectedness and acculturative stress?
-- Database: PostgreSQL
-- ============================================================

-- 1. Preview the data
SELECT *
FROM students;

-- 2. Average scores by length of stay (international students only)
SELECT stay,
       COUNT(inter_dom)     AS count_int,     -- number of international students per length of stay
       ROUND(AVG(todep), 2) AS average_phq,   -- depression (PHQ-9)
       ROUND(AVG(tosc), 2)  AS average_scs,   -- social connectedness (SCS)
       ROUND(AVG(toas), 2)  AS average_as     -- acculturative stress (ASISS)
FROM students
WHERE inter_dom = 'Inter'                     -- international students only
GROUP BY stay                                 -- needed because of the aggregate functions above
ORDER BY stay DESC;                           -- longest stay first
