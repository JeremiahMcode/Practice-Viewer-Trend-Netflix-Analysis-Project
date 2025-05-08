SELECT * FROM netflix.data;



select Floor(releaseYear / 10) * 10 as Decade, Round(AVG(imdbAverageRating), 2) as Average_Rating, Count(*) as movie_count
from data
Group by Decade
Order by Decade;
 
select genres, avg(imdbAverageRating) as Average_Rating
from data
group by genres
order by Average_Rating desc
limit 10;

select releaseYear, round(avg(imdbAverageRating),2) as Average_Rating
from data
group by releaseYear
order by releaseYear desc;




SELECT title, imdbID, imdbAverageRating, imdbNumVotes
FROM data
ORDER BY imdbNumVotes DESC
LIMIT 10;

select title, releaseYear, imdbAverageRating, releaseYear, imdbNumVotes
from data
where imdbAverageRating >= 8 and releaseYear >= 2022
order by imdbAverageRating desc;


select releaseYear, COUNT(*) as movie_count
from data
group by releaseYear
order by releaseYear desc;

select title, imdbAverageRating, imdbNumVotes
from data
where imdbNumVotes >= 1000000
order by imdbAverageRating DESC
limit 10;

select sum(imdbNumVotes) as total_votes, genres
from data
group by genres
order by total_votes desc;

select genres, max(imdbAverageRating) as top_rated
from data
group by genres
order by top_rated desc;

with GenreRanked AS (
  select 
    releaseYear,
    genres,
    ROUND(avg(imdbAverageRating), 2) as avg_rating,
    rank() over (partition by releaseYear order by avg(imdbAverageRating) desc) as genre_rank
  from data
  where releaseYear > 2000
  group by releaseYear, genres
)

select *
from GenreRanked
where genre_rank = 1
order by releaseYear desc;

select releaseYear, genres, round(avg(imdbAverageRating),2) as avg_rating
from data
group by releaseYear, genres
order by genres, releaseYear;