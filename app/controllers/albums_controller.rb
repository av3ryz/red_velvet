class AlbumsController < ApplicationController
  def index
    albums_sql = "SELECT * FROM albums"
    @albums = db.execute(albums_sql)
  end

  def show
    album_id = params[:id]
    album_sql = sanitize_sql([ "SELECT * FROM albums WHERE id = ?", album_id ])
    @album = db.execute(album_sql).first

    songs_sql = sanitize_sql([ "SELECT * FROM songs WHERE album_id = ?", album_id ])
    @songs = db.execute(songs_sql)
  end
end
