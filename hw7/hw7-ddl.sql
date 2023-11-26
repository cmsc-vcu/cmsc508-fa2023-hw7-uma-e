# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET AUTOCOMMIT=1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS skills;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_desc varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key(skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(skills_id, skills_name, skills_desc, skills_tag,skills_url,skills_time_commitment) values
(1, 'modding minecraft', 'downloading balanced tech mods for minecraft', 'Skill 1', null, null),
(2, 'pickling', 'the skill of creating a yummy briny mixture to store foods', 'Skill 2', 'picklemasters.com', 3),
(3, 'booching', 'creating alcoholic beverages or kombucha at home using various substances such as baja blast', 'Skill 3',null,5),
(4, 'catnapping', 'successfully stealing cats off the streets', 'Skill 4',null,null),
(5, 'snake charming', 'convincing snakes not to bite you', 'Skill 5','snakecharmers.net',90),
(6, 'pomegranate peeling', 'quick rate at tedious task of acquiring seeds from a pomegranate', 'Skill 6',null,null),
(7, 'russian', 'being literate in the russian language', 'Skill 7',null,null),
(8, 'plant whispering', 'the ability to stop a plant from dying long-term', 'Skill 8',null,1000);




# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people(
    people_id int not null,
    first_name varchar(255),
    last_name varchar(255) not null,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date not null,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,last_name, first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
(1,'Person 1', 'Bobal', 'bobal2022@yahoo.com', null, null, 'bobiti', 'likes to eat cookies','2020-06-23'),
(2,'Person 2', 'Bobam', null, 'linkedin-bobam.com', 'headshot-bobam.com', 'bobami', 'king of cats', '2008-09-28'),
(3,'Person 3', 'Keren', 'kerenrecipes@hotmail.com', null, null, null, 'granny of the block', '1990-10-23'),
(4,'Person 4', 'Minnesota', 'minnesotss@gmail.com', null, 'headshot-minnie0102304.com', 'sotaminnix', 'is from Minnesota', '2019-01-02'),
(5,'Person 5', 'Gazpacho', 'garbanzobeans@gmail.com', null, null, null, 'might just be the office cat', '2021-01-09'),
(6,'Person 6', 'Huel', 'huellie@yahhoo.com', 'linked-huel-o1.com', 'headshot-huel01.com', 'itshuel', 'always shows up to meetings late', '2001-12-19'),
(7,'Person 7', 'Ninja', null, null, null, null, 'pretends to be a ninja too often', '2023-11-20'),
(8,'Person 8', 'Bon', 'boniver@gmail.com', 'linkedin-bon_iver.com', 'boniver/headshot.com', 'bonmakesmusic', 'makes sad music', '2022-04-14'),
(9,'Person 9', 'Melis', 'melis200202023@gmail.com', null, null, null, 'the roomie of the database engineer', '2023-08,21'),
(10,'Person 10', 'Jazpacho', 'darksouls2028@vcu.edu', null, null, null, 'gazpacho has an evil twin', '2021-01-09');




# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired)
# None of the fields can be NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (skills_id) on delete cascade,
    foreign key (people_id) references people (people_id) on delete cascade,
    unique(skills_id, people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills(people_id, skills_id) values
(1,1),
(1,3),
(1,6),
(2,3),
(2,4),
(2,5),
(3,1),
(3,5),
(5,3),
(5,6),
(6,2),
(6,3),
(6,4),
(7,3),
(7,5),
(7,6),
(8,1),
(8,3),
(8,5),
(8,6),
(9,2),
(9,5),
(9,6),
(10,1),
(10,4),
(10,5);


select
 last_name,
 skills_name,
 skills_tag
from
 peopleskills a
INNER JOIN people b on (a.people_id = b.people_id)
INNER JOIN skills c on (a.skills_id = c.skills_id)
; 



SELECT
 *
from
 people a
LEFT JOIN peopleskills b on (a.people_id = b.people_id)
 ;


select
skills_name,
count(*)
from
peopleskills a
INNER JOIN people b on (a.people_id = b.people_id)
INNER JOIN skills c on (a.skills_id = c.skills_id)
GROUP BY
skills_name
; 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    id int not null,
    name varchar(255) not null,
    sort_priority int not null,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (id, name, sort_priority) values
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);

select * from roles

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date,
    PRIMARY KEY(id),
    foreign key (people_id) references people (people_id) on delete cascade,
    foreign key (role_id) references roles (id) on delete cascade,
    unique(role_id, people_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles(people_id, role_id) values
(1,2),
(2,5),
(2,6),
(3,2),
(3,4),
(4,3),
(5,3),
(6,2),
(6,1),
(7,1),
(8,1),
(8,4),
(9,2),
(10,2),
(10,1);

