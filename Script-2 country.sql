
-- 1 selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq

select *
from `countries`
where `name` like 'P%' and 
`area` > 1000;

-- 2 selezionare le nazioniil cui national day è avvenuto piu di 100 anni fa 

select *
from `countries`
where TIMESTAMPDIFF (year, national_day,curdate()) > 100;

-- 3 Selezionare il nome delle regioni del continente europeo, in ordine alfabetico

select r.name
from `regions`r
inner join `continents`c
on r.continent_id = c.continent_id 
where c.continent_id = 4
order by r.name;

-- 4 Contare quante lingue sono parlate in Italia 

select count(*)
from country_languages 
where country_id = 107;

 -- 5 Selezionare quali nazioni non hanno un national day

select *
from `countries`
where national_day  is null;

 -- 6 Per ogni nazione selezionare il nome, la regione e il continente

select  c.name, r.name, con.name
from `countries`c
inner join `regions` r
on c.region_id = r.region_id
inner join `continents` con 
on r.continent_id = con.continent_id;

-- 7 Modificare la nazione Italy, inserendo come national day il 2 giugno 1946

update countries c 
set national_day = '1946-06-02'
where c.name like 'Italy';

 -- 8 Per ogni regione mostrare il valore dell'area totale

select sum(c.area) as area_totale, r.name
from `regions`r
inner join `countries`c
on r.region_id = c.region_id
group by r.name 
order by area_totale;

-- 9 Selezionare le lingue ufficiali dell'Albania

SELECT c.name, l.`language` 
FROM `countries` c
INNER JOIN `country_languages` c_l
ON c.country_id = c_l.country_id 
INNER JOIN `languages` l 
ON l.language_id = c_l.language_id 
WHERE c.name LIKE 'Albania' AND c_l.official IS TRUE ;

-- 10 Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010

SELECT c.name as nazione, AVG(cs.gdp) as media_gdp_2000_2010
FROM `countries` c
INNER JOIN `country_stats` cs 
ON c.country_id = cs.country_id
WHERE c.name LIKE 'United Kingdom' AND cs.`year` >= 2000 and cs.`year` <= 2010
GROUP BY nazione;

-- 11 Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa

SELECT *
FROM `countries` c
INNER JOIN `country_languages` cl
ON c.country_id = cl.country_id
INNER JOIN `languages` l 
ON l.language_id = cl.language_id
WHERE l.`language` LIKE 'Hindi'
ORDER BY c.area DESC;

-- 12

