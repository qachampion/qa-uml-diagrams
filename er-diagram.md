```` ```mermaid ````
erDiagram
    %% Entities
    USERS {
        int user_id PK
        string username UK
        string email UK
        string preferred_location
        datetime created_at
    }

    COMPANIES {
        int company_id PK
        string company_name
        string industry
        string website_url
        string logo_url
    }

    JOBS {
        int job_id PK
        int company_id FK
        string title
        text description
        string location_city
        string location_state
        string location_zip
        decimal salary_min
        decimal salary_max
        enum job_type
        date posted_date
        string application_url
    }

    SEARCH_SESSIONS {
        int session_id PK
        int user_id FK
        string search_query_title
        string search_query_location
        datetime search_timestamp
        int result_count
        boolean was_geolocated
    }

    SAVED_JOBS {
        int user_id PK,FK
        int job_id PK,FK
        datetime saved_at
    }

    SEARCH_HISTORY {
        int history_id PK
        int user_id FK
        string search_query_title
        string search_query_location
        int clicked_job_id
        datetime searched_at
    }

    %% Relationships
    USERS ||--o{ SEARCH_SESSIONS : "initiates"
    USERS ||--o{ SEARCH_HISTORY : "generates"
    USERS ||--o{ SAVED_JOBS : "saves"
    
    COMPANIES ||--o{ JOBS : "posts"
    
    JOBS ||--o{ SAVED_JOBS : "is_saved_in"
    JOBS ||--o{ SEARCH_HISTORY : "clicked_in"
    
    %% Styling
    classDef entity fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef pk fill:#fff9c4,stroke:#fbc02d,stroke-width:1px;
    classDef fk fill:#ffe0b2,stroke:#e65100,stroke-width:1px;
    
    class USERS,COMPANIES,JOBS,SEARCH_SESSIONS,SAVED_JOBS,SEARCH_HISTORY entity;
```` ``` ````