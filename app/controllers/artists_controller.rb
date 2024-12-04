class ArtistsController < ApplicationController
  def index
    sql = "SELECT * FROM artists"
    @artists = db.execute(sql)
  end

  def show
    artist_id = params[:id]
    sql = sanitize_sql(["SELECT * FROM artists WHERE id = ?", artist_id])
    @artist = db.execute(sql).first

    albums_sql = sanitize_sql(["SELECT * FROM albums WHERE artist_id = ?", artist_id])
    @albums = db.execute(albums_sql)
  end
end