
CREATE TABLE test (
    id SERIAL PRIMARY KEY, 
    
    name  VARCHAR(255) NOT NULL,
    
    created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL DEFAULT NULL
);

SELECT * FROM test;

