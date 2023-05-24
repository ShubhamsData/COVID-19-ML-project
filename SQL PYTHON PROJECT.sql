use covid

SELECT * from covid19;

-- Find the number of corona patients who faced shortness of breath.
SELECT COUNT(*) AS num_corona_patients_with_shortness_of_breath 
FROM covid19
WHERE Corona = 'positive' AND Shortness_of_breath = 'TRUE';

-- Find the number of negative corona patients who have fever and sore_throat. 
SELECT COUNT(*) AS num_negative_corona_patients_with_fever_and_sore_throat 
FROM covid19 
WHERE Corona = 'negative' AND Fever = 'TRUE' AND Sore_throat = 'TRUE';

-- Group the data by month and rank the number of positive cases.
SELECT 
    CONCAT(SUBSTR(Test_date, 4, 2), '-', SUBSTR(Test_date, 7, 4)) AS month_year, 
    COUNT(*) AS num_positive_cases, 
    RANK() OVER (ORDER BY COUNT(*) DESC) AS pos_rank
FROM covid19 
WHERE Corona = 'positive'
GROUP BY month_year
ORDER BY num_positive_cases DESC;

-- Find the female negative corona patients who faced cough and headache.
SELECT * 
FROM covid19 
WHERE Corona = 'negative' AND Cough = 'TRUE' AND Headache = 'TRUE' AND Sex = 'female';

-- How many elderly corona patients have faced breathing problems?
SELECT COUNT(*) 
FROM covid19 
WHERE Corona = 'positive' AND Age_60_above = 'Yes' AND Shortness_of_breath = 'TRUE';

-- Which three symptoms were more common among COVID positive patients?
SELECT 
    COUNT(*) AS total_count,
    SUM(Cough = 'TRUE') AS cough_count,
    SUM(Fever = 'TRUE') AS fever_count,
    SUM(Sore_throat = 'TRUE') AS sore_throat_count,
    SUM(Shortness_of_breath = 'TRUE') AS shortness_of_breath_count,
    SUM(Headache = 'TRUE') AS headache_count
FROM covid19
WHERE Corona = 'positive';

-- Which symptom was less common among COVID negative people?
SELECT 
    COUNT(*) AS total_count,
    SUM(Cough = 'TRUE') AS cough_count,
    SUM(Fever = 'TRUE') AS fever_count,
    SUM(Sore_throat = 'TRUE') AS sore_throat_count,
    SUM(Shortness_of_breath = 'TRUE') AS shortness_of_breath_count,
    SUM(Headache = 'TRUE') AS headache_count
FROM covid19
WHERE Corona = 'negative';

-- What are the most common symptoms among COVID positive males whose known contact was abroad? 
SELECT 
    COUNT(*) AS total_count,
    SUM(Cough = 'TRUE') AS cough_count,
    SUM(Fever = 'TRUE') AS fever_count,
    SUM(Sore_throat = 'TRUE') AS sore_throat_count,
    SUM(Shortness_of_breath = 'TRUE') AS shortness_of_breath_count,
    SUM(Headache = 'TRUE') AS headache_count
FROM covid19
WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad';

























