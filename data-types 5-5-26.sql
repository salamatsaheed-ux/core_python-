USE data_types_db;
---------------------------------------------------
-- TEST DIFFERENCE: CHAR vs VARCHAR
---------------------------------------------------
SELECT 
    state,
    LENGTH(state) AS char_length,
    name,
    LENGTH(name) AS varchar_length
FROM users;

-- STRINGS MANIPULATION

-- CREATE TABLE
CREATE TABLE students (
    id INT,
    name CHAR(50),
    gender VARCHAR(10),
    state CHAR(10),
    email CHAR(100),
    phone CHAR(20)
);
ALTER TABLE students MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- INSERT SAMPLE DATA
INSERT INTO students (name, gender, state, email, phone) VALUES
('amusan hannah', 'Female', 'kwara', 'amusan@gmail.com', 081400000),
('falusi omolola', 'Female', 'osun', 'lola@example.com', 070466665),
('loveth esther', 'Female', 'kogi',  'esther@school.com', 090822222),
('rhoda innocent', 'Female', 'abia', 'rhoda@mail.com', 081400000);

select * from students;
---------------------------------------------------
-- 1.  CASE FUNCTIONS
---------------------------------------------------
SELECT name, UPPER(name) AS upper_name FROM students;
SELECT name, LOWER(name) AS lower_name FROM students;

---------------------------------------------------
-- 2. LENGTH FUNCTIONS
---------------------------------------------------
SELECT name, LENGTH(name) AS byte_length FROM students;

---------------------------------------------------
-- 3. CONCATENATION
---------------------------------------------------
SELECT CONCAT(name, gender, email) AS full_info FROM students; -- join all the info
SELECT CONCAT_WS(' - ', name, gender, email) AS combined FROM students; -- seperate info with -(hyphen)

---------------------------------------------------
-- 4. SUBSTRING
---------------------------------------------------
-- SUBSTRING(text, start, length)
SELECT name, SUBSTRING(name, 1, 6) AS short_name FROM students;

-- use case
SELECT *
FROM students
WHERE SUBSTRING(name, 1, 3) = 'lov';

-- OR
SELECT *
FROM students
WHERE name LIKE 'LOV%';

INSERT INTO students  (name, gender, state, email, phone)
 VALUES ('loveth OBAJEMU', 'Female', 'kogi',  'esther@school.com', 090822222);

---------------------------------------------------
-- 5. REPLACE
---------------------------------------------------
SELECT id, state, 
       REPLACE(state, 'kogi', 'lagos') AS updated_state
FROM students
WHERE id = 4;

---------------------------------------------------
-- 6. INSERT FUNCTION
---------------------------------------------------
-- INSERT(original_string, position, length, new_string)
SELECT INSERT(phone, 5, 4, '***') AS masked_phone FROM students;

---------------------------------------------------
-- 7. TRIM FUNCTIONS
---------------------------------------------------
SELECT TRIM('   hello world   ') AS trimmed;
SELECT LTRIM('   left space') AS left_trim;
SELECT RTRIM('right space   ') AS right_trim;

---------------------------------------------------
-- 8. REVERSE & REPEAT
---------------------------------------------------
SELECT name, REVERSE(name) AS reversed FROM students;
SELECT REPEAT(name, 2) AS repeated FROM students;

---------------------------------------------------
-- 9. ASCII & CHAR
---------------------------------------------------
SELECT ASCII('A') AS ascii_value;
SELECT CHAR(65, 66, 67) AS characters;

---------------------------------------------------
---------------------------------------------------
-- 10. FORMAT
---------------------------------------------------
SELECT FORMAT(12345.6789, 2) AS formatted_number;

---------------------------------------------------
-- 11. PATTERN MATCHING
---------------------------------------------------
SELECT * FROM students WHERE name LIKE '%a%';
SELECT * FROM students WHERE name LIKE '_o%';


---------------------------------------------------
-- 3. DATE & TIME
---------------------------------------------------
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    created_at DATETIME,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- INSERT DATA
INSERT INTO posts (title, created_at) VALUES
('My First Post', NOW()),
('Learning MySQL', '2024-01-01 10:00:00');

-- VIEW DATA
SELECT * FROM posts;

SELECT NOW();


---------------------------------------------------
-- CREATE TABLE WITH LOCATION
---------------------------------------------------
CREATE TABLE places (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    location POINT
);

---------------------------------------------------
-- INSERT DATA (Longitude, Latitude)
---------------------------------------------------
INSERT INTO places (name, location) VALUES
('School', POINT(3.3792, 6.5244)),   -- Lagos
('Mall', POINT(3.3500, 6.6000)),
('Hospital', POINT(3.4000, 6.5000));

---------------------------------------------------
-- VIEW DATA
---------------------------------------------------
SELECT name, ST_AsText(location) AS readable_location FROM places;

---------------------------------------------------
---------------------------------------------------
-- 4. CREATE TABLE WITH JSON
---------------------------------------------------
CREATE TABLE users_json (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    details JSON
);

---------------------------------------------------
-- INSERT JSON DATA
---------------------------------------------------
INSERT INTO users_json (name, details) VALUES
('Adijat', '{"age": 25, "skills": ["SQL", "Python"], "active": true}'),
('AbdSamad', '{"age": 30, "skills": ["Java"], "active": false}');

SELECT * FROM users_json;

# Assignment: Fix and Complete this SQL
CREATE TABLE practice (
    id varchar(45) PRIMARY KEY,   -- Is this the best choice for a simple ID?
    UserAge INT,                  -- ( Is INT too big for an age?
    PracName tinyint,             -- Can a name be a tinyint?
    design_at,                     --  What should go here?
);