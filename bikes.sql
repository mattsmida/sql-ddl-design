CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);


CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    code VARCHAR(50) REFERENCES bikes,
    price NUMERIC(6, 2) NOT NULL,
    customer_id INT REFERENCES customers,
    comments TEXT,
    purchase_time TIMESTAMP WITH TIMEZONE
);

CREATE TABLE bikes(
    code VARCHAR(50) PRIMARY KEY
    price NUMERIC(6, 2),
    model VARCHAR(50)
)



