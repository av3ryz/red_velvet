class SongsController < ApplicationController
  def index
    songs_sql = "SELECT * FROM songs"
    @songs = db.execute(songs_sql)
  end

  def show
    song_id = params[:id]
    song_sql = sanitize_sql([ "SELECT * FROM songs WHERE id = ?", song_id ])
    @song = db.execute(song_sql).first

    artists_sql = sanitize_sql([ "SELECT artists.* FROM artists
    INNER JOIN artist_songs ON artists.id = artist_songs.artist_id
    WHERE artist_songs.song_id = ?", song_id
    ])
    @artists = db.execute(artists_sql)
  end
end
