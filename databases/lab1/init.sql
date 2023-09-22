CREATE TABLE maps(
    map_id INTEGER PRIMARY KEY
);

CREATE TABLE pages(
    page_id INTEGER PRIMARY KEY,
    map_id INTEGER REFERENCES maps ON DELETE CASCADE
);

CREATE TABLE islands(
    island_id INTEGER PRIMARY KEY,
    map_id INTEGER REFERENCES maps ON DELETE CASCADE,
    island_name TEXT NOT NULL,
    island_length FLOAT NOT NULL,
    island_width FLOAT NOT NULL

    CHECK(island_length > 0)
    CHECK(island_width > 0)
);

CREATE TABLE sectors(
    sector_letter CHAR(1),
    sector_number INTEGER,
    square_size float NOT NULL,

    PRIMARY KEY(sector_letter, sector_number),

    CHECK(square_size > 0)
);

CREATE TABLE island_sectors(
    island_id INTEGER REFERENCES islands ON DELETE CASCADE,
    sector_letter CHAR(1),
    sector_number INTEGER,

    FOREIGN KEY(sector_letter, sector_number) REFERENCES sectors,

    PRIMARY KEY(island_id, sector_letter, sector_number)
);
