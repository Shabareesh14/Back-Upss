use Students;

create table students(
	student_id int primary key auto_increment,
    name varchar(100),
    gender enum("Male","Female","Others"),
    contact_info varchar(255)
);

	-- ( ========================================================== GENRES =============================================================== )

create table genres(
genre_id int primary key auto_increment,
genre_name varchar(30));

insert into genres (genre_name) values ("Horror"),("Romance"),("Thriller"),("Comedy"),("Action"),("Fantasy"),("Crime"),("Sports"),("Adventure");
insert into genres(genre_name) values ("Science Fiction");

select * from genres;

	-- ( ============================================== Movie Interseted ====================================================================)
    
create table student_movie_interests(
student_id int,
genre_id int,
primary key(student_id,genre_id),
foreign key(student_id) references students(student_id),
foreign key(genre_id) references genres(genre_id)
);

	 -- ( =============================================== Table Selections ====================================================================)
        
select * from students;
select * from genres;
select * from shopping_malls;
select * from beaches;
select * from movies;
select * from student_favorites;
select * from student_favorite_malls;
select * from student_favorite_beaches;
select * from student_favorite_movies;

insert into student_movie_interests values (1,1);
insert into student_movie_interests values (1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
insert into student_movie_interests values (2,1),(2,2),(2,4),(2,5),(2,8),(3,2),(3,4),(3,8),(3,10),(4,1),(4,2),(4,3),(4,4),(4,5),(4,8);

	-- ( ================================================= Student_Movie Join ===================================================================)
 
select s.student_id as Student, s.name as Student_Name ,g.genre_name as Genre_Name,g.genre_id from student_movie_interests i
join students s on i.student_id = s.student_id
join genres g on g.genre_id = i.genre_id;

	-- ( ================================================= Shopping Mall =========================================================================)

CREATE TABLE shopping_malls (
mall_id INT PRIMARY KEY AUTO_INCREMENT, 
mall_name VARCHAR(100),
 location VARCHAR(100)
);

insert into shopping_malls(mall_name,location) values ("Phoneix Mall","Chennai"),("LuLu","Kochi"),("Mantri Square","Bangalore"),("VR","Bangalore"),("CMR Central Mall","Visakhapatnam");

	-- ( ======================================================= Beaches =========================================================================)
    
create table beaches(
	beach_id int primary key auto_increment,
    beach_name varchar(100),
    beach_location varchar(100)
);

insert into beaches(beach_name,beach_location) values ("MarinaBeach","Chennai"),("BeasantNagarBeach","Chennai"),("KovalamBeach","Chennai"),
("KanniyaKumariBeach","KanniyaKumari"),("RameswaramBeach","Rameswaram");

	-- ( =================================================== Movies(with Hero & Heroine ================================================== )
    
create table movies(
movie_id int primary key auto_increment,
movie_name varchar(100),
hero_name varchar(100),
heroine_name varchar(100)
);

insert into movies(movie_name,hero_name,heroine_name) values ("GBU","Ajith","Thirsha"),("Anjaan","Surya","Samantha"),("96","VijaySethuPathi","Thirsha"),
("Thozha","Karthi","Thamana"),("Theri","Vijay","Samantha");

	-- ( ========================================================= Favorite Actors & Actresses ===================================================== )
    
create table student_favorites(
	student_id int primary key,
    favorite_actor varchar(100),
    favorite_actress varchar(100),
    foreign key (student_id) references students(student_id)
);    

insert into student_favorites (student_id,favorite_actor,favorite_actress) values (1,'Vijay','Samantha'),(2,'Vimal','Kajal'),(3,'Rajini','Nayanthara');
insert into student_favorites (student_id,favorite_actor,favorite_actress) values (4,"Ajith","Sneha"),(5,"Kamal","SaiPallavi"),(6,"Dhanush","AiswaryaRajesh"),
(7,"Simbu","Varalaxmi SarathKumar"),(8,"SivaKarthiKeyan","KeerthySuresh");

	-- ( ============================================================== Student's Favorite Malls ======================================================= )
    
create table student_favorite_malls(
student_id int,
mall_id int,
primary key(student_id,mall_id),
foreign key(student_id) references students(student_id),
foreign key(mall_id) references shopping_malls(mall_id)
);

insert into student_favorite_malls(student_id,mall_id) values (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),
(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5);


	-- ( =================================================================== Mall Joins ==================================================================== )

select s.student_id as Students, s.name as Name, m.mall_id as Mall_id, m.mall_name as Malls from student_favorite_malls f 
join students s on f.student_id = s.student_id
join shopping_malls m on m.mall_id = f.mall_id
where name = "Shabareesh" && mall_name = "LuLu";

	 -- ( ================================================================== Favorite Beaches ================================================================ )
    
create table student_favorite_beaches(
	student_id int,
    beach_id int,
    primary key(student_id,beach_id),
    foreign key (student_id) references students(student_id),
    foreign key (beach_id) references beaches(beach_id)
);

insert into student_favorite_beaches (student_id,beach_id) values (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),
(4,1),(4,4),(4,5),(5,1),(5,2),(5,4),(6,1),(6,2),(7,1),(7,2),(7,3),(8,1),(8,5);

	  -- ( ====================================================================== Beach Joins ================================================================ )
    
select s.student_id as ID, s.name as Name, b.beach_name as Beaches ,b.beach_id as Beach_ID from student_favorite_beaches fb
join students s on fb.student_id = s.student_id
join beaches b on b.beach_id = fb.beach_id
where beach_name = "KanniyaKumariBeach";

	-- ( ====================================================================== Favorite Movies ============================================================= )
 
 create table student_favorite_movies(
	student_id int,
    movie_id int,
    primary key (student_id,movie_id),
    foreign key (student_id) references students(student_id),
    foreign key (movie_id) references movies(movie_id)
);

insert into student_favorite_movies (student_id,movie_id) values (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,3),(3,5),(4,1),(4,4),(5,1),(5,2),(5,3),
(5,4),(5,5),(6,1),(6,2),(6,4),(7,5),(8,2),(8,5);

	-- ( ========================================================================= Movie Joins ================================================================== )

select s.student_id as Students, s.name as Name, m.movie_name as Fav_Movie,m.movie_id as Movie_ID from student_favorite_movies sfm
join students s on sfm.student_id = s.student_id
join movies m on m.movie_id = sfm.movie_id
where heroine_name = "Samantha";

select name as Name,genre_name as GENRE, count(*) as Fav_Genre from student_movie_interests i
join students s on s.student_id = i.student_id
join genres g on i.genre_id = g.genre_id group by s.name,g.genre_name order by g.genre_name;

select genre_name as Genre,count(*) as Fav_Genre from student_movie_interests i 
join students s on s.student_id = i.student_id
join genres g on i.genre_id = g.genre_id group by g.genre_name; 

select name as Name, favorite_actor as Actor, favorite_actress as Actress from student_favorites sf
join students s on s.student_id = sf.student_id order by name;

	-- ( Find students who share similar movie genres (e.g., Action or Romance lovers) ========================================= ) 
select 
g.genre_name as Genre,
group_concat(s.name order by s.name separator ', ') as Students
from
student_movie_interests i 
join students s on s.student_id = i.student_id
join genres g on i.genre_id = g.genre_id
group by g.genre_name;

	-- ( Group students by favorite actors or actresses — great for forming mini fan clubs! ======================================= )

select favorite_actress as Actress, 
group_concat(s.name order by s.name separator ', ') as Students
from student_favorites sf 
join students s on s.student_id = sf.student_id group by favorite_actress;

	-- (Suggest ideal friend groups who share similar tastes in entertainment and hangout spots. ================================== )
    
SELECT 
  s.name AS Student_Name,
  GROUP_CONCAT(DISTINCT m.movie_name ORDER BY m.movie_name SEPARATOR ', ') AS Favorite_Movies,
  GROUP_CONCAT(DISTINCT mi.mall_name ORDER BY mi.mall_name SEPARATOR ', ') AS Favorite_Malls
FROM 
  students s
LEFT JOIN 
  student_favorite_movies sfm ON s.student_id = sfm.student_id
LEFT JOIN 
  movies m ON sfm.movie_id = m.movie_id
LEFT JOIN 
  student_favorite_malls sfmall ON s.student_id = sfmall.student_id
LEFT JOIN 
  shopping_malls mi ON sfmall.mall_id = mi.mall_id
GROUP BY 
  s.student_id, s.name
ORDER BY 
  s.name;
  
	-- ( ======================================================= Common Favorite Beaches ==================================================== )
    
SELECT 
  b.beach_name AS Beaches,
  GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS Students
FROM 
  student_favorite_beaches sfb
JOIN 
  students s ON s.student_id = sfb.student_id
JOIN 
  beaches b ON sfb.beach_id = b.beach_id
GROUP BY 
  b.beach_name
ORDER BY 
  b.beach_name;

	-- ( =========================================================== Common Shopping Malls ===================================================== )

select 
m.mall_name as MALL,
group_concat(s.name order by s.name separator ', ') as Students
from
student_favorite_malls sfm
join students s on s.student_id = sfm.student_id
join shopping_malls m on sfm.mall_id = m.mall_id
group by m.mall_name
order by m.mall_name; 

 -- ( ================================================================= Common favorite Movies ================================================== )
 
 select 
 m.movie_name as Movie_Name,
 group_concat(s.name order by s.name separator ', ') as Students
 from 
 student_favorite_movies sfms
 join 
 students s on sfms.student_id = s.student_id
 join 
 movies m on m.movie_id = sfms.movie_id
 group by m.movie_name
 order by m.movie_name;
 
	-- ( ================================================================ Most Liked Actor/Actress =================================================== )
    
SELECT favorite_actor AS ACTOR,
count(*) as Total_Fans, 
group_concat(s.name ORDER BY s.name SEPARATOR ', ') AS Students
FROM
student_favorites sf 
JOIN students s ON s.student_id = sf.student_id
GROUP BY favorite_actor
ORDER BY Total_Fans DESC;

	-- ( =================================================================== Most Popular Movie Genre ================================================== )
    
SELECT g.genre_name as GENRE,
count(*) as FAV_GENRE,
group_concat(s.name order by s.name separator ', ') as Students
from student_movie_interests smi
join students s on s.student_id = smi.student_id
join genres g on smi.genre_id = g.genre_id
group by genre_name order by FAV_GENRE desc;

	-- ( =================================================== Top 5 Favorite Movie Currently ============================================================ )
    
select movie_name as MOVIES,
group_concat(s.name order by s.name separator ', ') as Students
from student_favorite_movies smi
join students s on s.student_id = smi.student_id
join movies m on smi.movie_id = m.movie_id
group by movie_name order by movie_name desc;

	-- ( ==================================================== Loves Romantic =========================================================================== )
    
select g.genre_name as GENRE,
group_concat(s.name order by s.name separator ', ') as Students
from student_movie_interests sfm
join students s on s.student_id = sfm.student_id
join genres g on sfm.genre_id = g.genre_id 
group by genre_name having genre_name = "Romance" order by genre_name;

	-- ( ====================================================== Most Popular Beahces ==================================================================== )
    
select b.beach_name as BEACHES,
count(*) as FAV_BEACH,
group_concat(s.name order by s.name) as Students
from 
student_favorite_beaches sfb
join students s on sfb.student_id = s.student_id
join beaches b on b.beach_id = sfb.beach_id 
group by beach_name having FAV_BEACH >= 4 order by count(*) desc LIMIT 1;

	-- ( ============================================================= Top Favorite Actors ============================================================== )
    
SELECT favorite_actor AS ACTOR ,
count(*) AS FAV_ACTOR,
GROUP_CONCAT(s.name ORDER BY s.name SEPARATOR ', ') AS Students
FROM 
student_favorites sf
JOIN students s ON s.student_id = sf.student_id
GROUP BY favorite_actor ORDER BY count(*) LIMIT 1;

	-- ( ========================================================= Most People Agree On Watching Together ================================================ )
    
select movie_name as MOVIES,
group_concat(s.name order by s.name separator ', ') as Students,
COUNT(*) as Total_Fans
from 
student_favorite_movies sfm 
join students s on s.student_id = sfm.student_id
join movies m on sfm.movie_id = m.movie_id
group by m.movie_name , m.movie_id order by Total_Fans DESC;