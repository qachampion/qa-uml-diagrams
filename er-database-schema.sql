-- Users Table: Stores user profile and preferences
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    preferred_location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Companies Table: Normalized entity for employers
CREATE TABLE Companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50),
    website_url VARCHAR(255),
    logo_url VARCHAR(255)
);

-- Jobs Table: The core entity for search results
CREATE TABLE Jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location_city VARCHAR(50),
    location_state VARCHAR(50),
    location_zip VARCHAR(20),
    salary_min DECIMAL(10, 2),
    salary_max DECIMAL(10, 2),
    job_type ENUM('Full-time', 'Part-time', 'Contract', 'Internship'),
    posted_date DATE NOT NULL,
    application_url VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Search Sessions Table: Tracks the user's search flow (PMD context)
CREATE TABLE SearchSessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, -- Nullable for guest users
    search_query_title VARCHAR(100),
    search_query_location VARCHAR(100),
    search_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    result_count INT,
    was_geolocated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Saved Jobs Table: Many-to-Many relationship between Users and Jobs
CREATE TABLE SavedJobs (
    user_id INT,
    job_id INT,
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, job_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id) ON DELETE CASCADE
);

-- Search History Table: To power the "Historical search result tiles"
CREATE TABLE SearchHistory (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    search_query_title VARCHAR(100),
    search_query_location VARCHAR(100),
    clicked_job_id INT, -- Nullable if they didn't click a specific job
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);