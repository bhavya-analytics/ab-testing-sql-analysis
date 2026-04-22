CREATE TABLE experiment_results (
    user_id INT PRIMARY KEY,
    variant VARCHAR(10),
    device VARCHAR(20),
    user_region VARCHAR(50),
    clicked INT,
    converted INT,
    revenue DECIMAL(10,2),
    event_date DATE
);
