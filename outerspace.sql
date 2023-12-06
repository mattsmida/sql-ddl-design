CREATE TABLE stars(
    star VARCHAR(50) PRIMARY KEY,
    temp FLOAT NOT NULL,
        CHECK (temp >= 0)
);

CREATE TABLE planets(
    planet VARCHAR(50) PRIMARY KEY,
    orbit_star VARCHAR(50) NOT NULL REFERENCES stars,
    orbital_period FLOAT
);

CREATE TABLE moons(
    moon VARCHAR(50) PRIMARY KEY,
    planet VARCHAR(50) NOT NULL REFERENCES planets
);

