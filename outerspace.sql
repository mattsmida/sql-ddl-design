CREATE TABLE stars(
    star VARCHAR(50) PRIMARY KEY,
    temp_in_kelvin FLOAT NOT NULL,
        CHECK (temp_in_kelvin >= 0)
);

CREATE TABLE planets(
    planet VARCHAR(50) PRIMARY KEY,
    star VARCHAR(50) NOT NULL REFERENCES stars,
    orbital_period_in_yrs FLOAT NOT NULL
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

INSERT INTO planets(planet, star, orbital_period_in_yrs)
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

--aliases for clarity--
SELECT p.planet, p.star, COUNT(m.planet) as moon_count
    FROM planets AS p
        LEFT JOIN moons AS m
            ON m.planet = p.planet
    GROUP BY p.planet
    ORDER BY p.planet ASC;

--GROUP BY necessity in COUNT aggregate queries --


