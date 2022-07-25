SELECT 'CREATE DATABASE cupid' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'cupid') \gexec

\c cupid

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
      id SERIAL PRIMARY KEY
    , email TEXT NOT NULL
    , password_hash TEXT NOT NULL
    , name TEXT NOT NULL
    , photo_url TEXT NOT NULL
    , gender CHAR NOT NULL
    , age INT NOT NULL
    , pref_age_from INT
    , pref_age_to INT
    , pref_gender CHAR
);

DROP TABLE IF EXISTS swiped;
CREATE TABLE swiped (
      id SERIAL PRIMARY KEY
    , user_id INT REFERENCES users(id) NOT NULL
    , swiped_user_id INT REFERENCES users(id) NOT NULL
    , liked BOOLEAN
    , unmatched BOOLEAN
);    

DROP TABLE IF EXISTS interests CASCADE;
CREATE TABLE interests (
      code TEXT PRIMARY KEY
    , description TEXT
);

DROP TABLE IF EXISTS user_interests;
CREATE TABLE user_interests (
      id SERIAL PRIMARY KEY
    , user_id INT REFERENCES users(id) NOT NULL
    , interest_code TEXT REFERENCES interests(code)
);    

insert into interests values('art', 'Art'), ('cycling', 'Cycling'), ('soccer', 'Soccer'), ('dancing', 'Dancing'), ('photo', 'Photography'), 
                       ('gym', 'Gym'), ('cafe','Cafe-hoping'), ('camping', 'Camping'), ('dogs', 'Dogs'), ('cats', 'Cats');


select m.name, m.id, m.age, u.pref_age_from, u.pref_age_to  from users u
join users m on (u.pref_gender = m.gender or u.pref_gender = 'o') and m.age between u.pref_age_from and u.pref_age_to
where u.id = 1
and   m.id <> u.id
and   not exists (select 1 from swiped where user_id = u.id and swiped_user_id = m.id);

