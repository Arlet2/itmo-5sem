INSERT INTO sectors 
    (sector_letter, sector_number, square_size)
    VALUES('A', 1, 5);

INSERT INTO sectors 
    (sector_letter, sector_number, square_size)
    VALUES('B', 1, 5);

INSERT INTO sectors 
    (sector_letter, sector_number, square_size)
    VALUES('C', 2, 5);

INSERT INTO maps
    (map_id)
    VALUES(0);

INSERT INTO pages
    (page_id, map_id)
    VALUES(0, 0);

INSERT INTO islands
    (island_id, map_id, island_name, island_length, island_width)
    VALUES(0, 0, 'Isla Nublar', 13, 4);

INSERT INTO island_sectors
    (island_id, sector_letter, sector_number)
    VALUES(0, 'A', 1);

INSERT INTO island_sectors
    (island_id, sector_letter, sector_number)
    VALUES(0, 'B', 1);

INSERT INTO island_sectors
    (island_id, sector_letter, sector_number)
    VALUES(0, 'C', 2);

SELECT * FROM pages;
SELECT * FROM maps;
SELECT * FROM islands;
SELECT * FROM sectors;
SELECT * FROM island_sectors;