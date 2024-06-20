-- SQL PROJECT
create database sqlproject;
use sqlproject;
select * from athletes_data;
select count(*) from athletes_data;
-- 1. Show how many medal counts present for entire data
select Medal,count(Medal) as countmedal 
from athletes_data
group by Medal
order by countmedal desc;


-- 2. Show count of unique sports present in Olympics
select distinct(Sport) from athletes_data;
select count(distinct(Sport)) from athletes_data;

-- 3. Show how many different medals won by team India
select * from athletes_data;
select Medal,count(Medal) as countmedal
from athletes_data
where Team = 'India'
group by Medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select * from athletes_data;
select Team,Event,count(Medal) as countmedal
from athletes_data
where Team = 'India' and Medal <> 'NOMedal'
group by Event
order by countmedal desc;


-- 5. Show event wise medals won by India in order of year
select * from athletes_data;
select  Event,Year,count(Medal) as countmedal
from athletes_data
where Team = 'India'
group by Event,Year
order by Year desc;



-- 6. show country who won maximum medals.
select * from athletes_data;
select Team, count(Medal) as maxmedal
from athletes_data
where Medal <> 'NoMedal'
group by Medal, Team
order by maxmedal desc
limit  1;

-- 7.show top 10 countries whowon gold
select Team,count(Medal) as countmedal
 from athletes_data
 where Medal = 'Gold'
 group by Team
 order by countmedal desc
 limit 10;
 


--  8. show in which year did United states won most gold medal
select * from athletes_data;
select year, count(Medal) as countmedal
from athletes_data
where Team = 'Unites States' and Medal = 'Gold'
group by year
order by countmedal desc
limit 1;


-- 9. In which sports United States has most medals.
select * from athletes_data;
select Team, Sport, count(Medal) as countmedal
from athletes_data
where Team = 'United States' and Medal <> 'NoMedal'
group by Sport
order by countmedal desc
limit 1;



-- 10. Find top three players who won most medals along with their sports and country
select * from athletes_data;
select Name, sport,Team, count(Medal) as countmedal
from athletes_data
where Medal <> 'NoMedal'
group by Name , Sport , Team
order by countmedal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.
select * from athletes_data;
select Name, Sport, count(Medal) as countmedal
from athletes_data
where Sport = 'Cycling' and Medal = 'Gold'
group by Name
order by countmedal desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
  select * from athletes_data;
  select Name, Team, Sport, count(Medal) as countmedal 
  from athletes_data
  where Medal <> 'NoMedal' and sport = 'Basketball'
  group by Name , Team , Sport 
  order by countmedal desc
  limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select * from athletes_data;

SELECT * 
FROM athletes_data 
WHERE Name = 'Arvo Ossian Aaltonen';
select Medal,  count(Medal) as countmedal
from athletes_data
where Name = 'Arvo Ossian Aaltonen' AND  Medal <> 'NoMedal'
group by Medal
order by countmedal desc;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select * from athletes_data;
select Sex, Year, count(Medal) as countmedal
from athletes_data
where Medal <> 'NoMedal'
group by sex, Year
order by countmedal desc , Year ;




-- write a procedure to get name of player by country
DELIMITER &&
create procedure getplayernamebycountry (in ctr varchar(50))
BEGIN

select * from athletes_data
where Team = ctr;
END

&& DELIMITER ;
call getplayernamebycountry('China');
call getplayernamebycountry('United States');


