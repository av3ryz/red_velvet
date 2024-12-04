-- Create the artists table
CREATE TABLE artists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Create the albums table
CREATE TABLE albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

-- Create the songs table
CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Create the artist_albums junction table
CREATE TABLE artist_albums (
    artist_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Create the artist_songs junction table
CREATE TABLE artist_songs (
    artist_id INTEGER NOT NULL,
    song_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (song_id) REFERENCES songs(id)
);

-- Insert artists
INSERT INTO artists (name)
VALUES
    ('Irene'),
    ('Seulgi'),
    ('Wendy'),
    ('Joy'),
    ('Yeri');

-- Insert albums
INSERT INTO albums (title)
VALUES
    ('Cosmic'),
    ('Like a Flower');

-- Insert songs for album 'Cosmic' (album_id = 1)
INSERT INTO songs (title, album_id)
VALUES 
    ('Cosmic', 1),
    ('Sunflower', 1),
    ('Last Drop', 1),
    ('Love Arcade', 1),
    ('Bubble', 1),
    ('Night Drive', 1);

-- Insert songs for album 'Like a Flower' (album_id = 2)
INSERT INTO songs (title, album_id)
VALUES
    ('Like A Flower', 2),
    ('Summer Rain', 2),
    ('Calling Me Back', 2),
    ('Strawberry Silhouette', 2),
    ('Start Line', 2),
    ('Winter Wish', 2),
    ('Ka-Ching', 2),
    ('I Feel Pretty', 2);

-- Associate artists with albums
INSERT INTO artist_albums (artist_id, album_id)
VALUES
    -- Album 'Cosmic' belongs to all five artists
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    -- Album 'Like a Flower' belongs to Irene
    (1, 2);

-- Associate artists with songs
-- Songs from 'Cosmic' are sung by all five artists
INSERT INTO artist_songs (artist_id, song_id)
VALUES
    -- Irene
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
    -- Seulgi
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6),
    -- Wendy
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6),
    -- Joy
    (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6),
    -- Yeri
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6);

-- Songs from 'Like a Flower' are sung by Irene
INSERT INTO artist_songs (artist_id, song_id)
VALUES
    (1, 7), (1, 8), (1, 9), (1, 10),
    (1, 11), (1, 12), (1, 13), (1, 14);