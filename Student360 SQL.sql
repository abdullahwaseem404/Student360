create database student;

SELECT gaming_genre, AVG(grades) AS avg_grade
FROM students
GROUP BY gaming_genre;

SELECT gaming_hours, grades
FROM students
ORDER BY gaming_hours DESC;

SELECT CASE
WHEN study_hours < 5 THEN 'Low Study'
WHEN study_hours BETWEEN 5 AND 8 THEN 'Medium Study'
ELSE 'High Study'
END AS study_category, AVG(grades) AS avg_grade
FROM students
GROUP BY study_category;

SELECT stress_level, AVG(grades)
FROM students
GROUP BY stress_level;

SELECT 
    gaming_genre,
    AVG(grades / NULLIF(study_hours,0)) AS efficiency_score
FROM students
GROUP BY gaming_genre;

SELECT 
    CASE 
        WHEN sleep_hours < 6 THEN 'Low Sleep'
        WHEN sleep_hours BETWEEN 6 AND 8 THEN 'Normal Sleep'
        ELSE 'High Sleep'
    END AS sleep_category,
    AVG(grades) AS avg_grade
FROM students
GROUP BY sleep_category;

SELECT *
FROM students
WHERE grades > 90
ORDER BY grades DESC;

SELECT 
    ROUND(gaming_hours,0) AS gaming_bucket,
    AVG(grades) AS avg_grade
FROM students
GROUP BY gaming_bucket
ORDER BY gaming_bucket;

SELECT 
    CASE 
        WHEN addiction_score > 15 THEN 'High Addiction'
        ELSE 'Low Addiction'
    END AS addiction_level,
    AVG(grades)
FROM students
GROUP BY addiction_level;

SELECT 
    CASE 
        WHEN attendance > 80 THEN 'High Attendance'
        ELSE 'Low Attendance'
    END,
    AVG(grades)
FROM students
GROUP BY 1;

SELECT 
    CASE 
        WHEN reaction_time_ms < 250 THEN 'Fast'
        ELSE 'Slow'
    END AS reaction_speed,
    AVG(grades)
FROM students
GROUP BY reaction_speed;

SELECT gender, AVG(grades), AVG(study_hours)
FROM students
GROUP BY gender;

SELECT 
    ROUND(device_usage,0) AS usage_bucket,
    AVG(grades)
FROM students
GROUP BY usage_bucket;

SELECT 
    student_id,
    (gaming_hours + device_usage + addiction_score) AS risk_score,
    grades
FROM students
ORDER BY risk_score DESC;