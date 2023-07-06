CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  release_year INT,
  duration_minutes INT,
  description TEXT,
);

CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE movies_genres (
  movie_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE media (
  id INT PRIMARY KEY,
  movie_id INT NOT NULL,
  type ENUM('video', 'image') NOT NULL,
  url VARCHAR(255) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE users (
  id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL, 
  email VARCHAR(255) NOT NULL
);

CREATE TABLE reviews (
  id INT PRIMARY KEY,
  movie_id INT NOT NULL,
  user_id INT NOT NULL,
  rating INT NOT NULL,
  comment TEXT,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE artists (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE skills (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE artist_skills (
  artist_id INT NOT NULL,
  skill_id INT NOT NULL,
  PRIMARY KEY (artist_id, skill_id),
  FOREIGN KEY (artist_id) REFERENCES artists(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id)
);

CREATE TABLE roles (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE movie_artist_roles (
  id INT PRIMARY KEY,
  movie_id INT NOT NULL,
  artist_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);
