select * from ds_salaries;

-- 1. Apakah ada data yang NULL ?
select * 
from 
	ds_salaries 
where
	work_year IS NULL
	OR experience_level IS NULL
	OR employment_type IS NULL
	OR job_title IS NULL
	OR salary IS NULL
	OR salary_currency IS NULL
	OR salary_in_usd IS NULL
	OR employee_residence IS NULL
	OR remote_ratio IS NULL
	OR company_location IS NULL
	OR company_size IS NULL;
	

-- 2. Melihat ada job tittle apa saja
SELECT DISTINCT    -- Untuk menghapus duplikat
	job_title
FROM
	ds_salaries
ORDER BY          -- Untuk mengurutkan agar rapih berdasarkan kolom job_title
	job_title;
    

-- 3. Job title apa saja yang berkaitan dengan data analyst
SELECT
	DISTINCT job_title
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'   -- Menggunakan klausa LIKE dan ditambahkan persen agar kata data analyst yang di awal maupun akhir akan ditampilkan
ORDER BY
	job_title;
    
    
-- 4. Berapa rata-rata gaji data analyst?
SELECT
	AVG(salary_in_usd) AS avg_salary_in_usd
FROM
	ds_salaries;

-------------------

SELECT     -- Select inituh untuk mencari tau rata-rata dalam rupiah perbulannya
	AVG(salary_in_usd) * 15000 / 12 AS avg_salary_in_rp_monthly
FROM
	ds_salaries;


-- Revisi jawaban no. 4 harusnya ada tambahan klausa where untuk memfilter data analys saja
SELECT
	AVG(salary_in_usd) AS avg_salary_in_usd
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%';
    
    
-- 4.1 Berapa rata-rata gaji data analyst berdasarkan experience levelnya?
SELECT
	experience_level,
	(AVG(salary_in_usd) * 15000) / 12 AS avg_sal_rp_monthly
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'
GROUP BY                             -- GROUP BY itu untuk mengklasifikasikan, sedangkan order by merapihkan klasifikasinya
	experience_level;
    
    
-- Revisi jawaban nomor 4.2.

SELECT
	experience_level,
	employment_type,
	(AVG(salary_in_usd) * 15000) / 12 AS avg_sal_rp_monthly
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'
GROUP BY
	experience_level,
	employment_type
ORDER BY
	experience_level,
	employment_type;


-- 5. Negara dengan gaji yang menarik untuk posisi data analyst, full time, exp kerjanya entry level dan menengah / mid
SELECT
	company_location,
	AVG(salary_in_usd) avg_sal_in_usd  -- alias gak perlu pakai AS juga tetap jalan
FROM
	ds_salaries
WHERE
	job_title LIKE '%data analyst%'
	AND employment_type = 'FT'
	AND experience_level IN ('MI', 'EN')
GROUP BY                               -- GROUP BY Ini hany untuk agregat
	company_location
HAVING								   -- HAVING juga untuk filter agregat
	avg_sal_in_usd >= 20000;		
    
    

-- 6. Di tahun berapa, kenaikan gaji dari mid ke senior itu memiliki kenaikan yang tertinggi? 
-- (untuk pekerjaan yang berkaitan dengan data analyst yang penuh waktu
WITH ds_1 AS (
	SELECT
		work_year,
		AVG(salary_in_usd) sal_in_usd_ex
	FROM
		ds_salaries
	WHERE
		employment_type = 'FT'
		AND experience_level = 'EX'
		AND job_title LIKE '%data analyst%'
	GROUP BY
		work_year
),
ds_2 
	AS (
	SELECT
		work_year,
		AVG(salary_in_usd) sal_in_usd_mi
	FROM
		ds_salaries
	WHERE
		employment_type = 'FT'
		AND experience_level = 'MI'
		AND job_title LIKE '%data analyst%'
	GROUP BY
		work_year
),
t_year AS (
	SELECT
		DISTINCT work_year
	FROM
		ds_salaries
)
SELECT
	t_year.work_year,
	ds_1.sal_in_usd_ex,
	ds_2.sal_in_usd_mi,
	ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
FROM
	t_year
	LEFT JOIN ds_1 ON ds_1.work_year = t_year.work_year
	LEFT JOIN ds_2 ON ds_2.work_year = t_year.work_year;
    
    
-- Atau jika tidak mau menggunakan CTE year bisa digunakan subquery seperti di bawah
WITH ds_1 
	AS (
    SELECT
        work_year,
        AVG(salary_in_usd) sal_in_usd_ex
    FROM
        ds_salaries
    WHERE
        employment_type = 'FT'
        AND experience_level = 'EX'
        AND job_title LIKE '%data analyst%'
    GROUP BY
        work_year
),
ds_2 AS (
    SELECT
        work_year,
        AVG(salary_in_usd) sal_in_usd_mi
    FROM
        ds_salaries
    WHERE
        employment_type = 'FT'
        AND experience_level = 'MI'
        AND job_title LIKE '%data analyst%'
    GROUP BY
        work_year
)

SELECT
    ds_1.work_year,
    ds_1.sal_in_usd_ex,
    ds_2.sal_in_usd_mi,
    ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
FROM
    (
        SELECT DISTINCT work_year
        FROM ds_salaries
    ) t_year
LEFT JOIN ds_1 ON ds_1.work_year = t_year.work_year
LEFT JOIN ds_2 ON ds_2.work_year = t_year.work_year;


