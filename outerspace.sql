CREATE TABLE stars(
    star VARCHAR(50) PRIMARY KEY,
    temp_in_kelvin FLOAT NOT NULL,
        CHECK (temp_in_kelvin >= 0)
);

CREATE TABLE planets(
    planet VARCHAR(50) PRIMARY KEY,
    orbit_star VARCHAR(50) NOT NULL REFERENCES stars,
    orbital_period FLOAT NOT NULL
);

CREATE TABLE moons(
    moon VARCHAR(50) PRIMARY KEY,
    planet VARCHAR(50) NOT NULL REFERENCES planets
);


INSERT INTO stars(star, temp_in_kelvin)
    VALUES
        ('The Sun', 5800),
        ('Proxima Centauri', 3042),
        ('Gliese 876', 3192);

INSERT INTO planets(planet, orbit_star, orbital_period)
    VALUES
        ('Earth', 'The Sun', 1.00),
        ('Mars', 'The Sun', 1.882),
        ('Venus', 'The Sun', 0.62),
        ('Proxima Centauri b', 'Proxima Centauri', 0.03),
        ('Gliese 876 b', 'Gliese 876', 0.236);

INSERT INTO moons(moon, planet)
    VALUES
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');


SELECT planets.planet, planets.orbit_star, COUNT(moons.planet) as moon_count
    FROM planets
        LEFT JOIN moons ON moons.planet = planets.planet
            GROUP BY planets.planet
                ORDER BY planets.planet ASC;


