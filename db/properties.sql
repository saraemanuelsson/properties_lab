DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
    id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    value INT,
    square_footage INT,
    build VARCHAR(255)
);

INSERT INTO properties (address,value,square_footage,build) VALUES ('RJ8 8CH',10000,6000,'detached');
