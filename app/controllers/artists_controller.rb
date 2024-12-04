class ArtistsController < ApplicationController
  def index
    sql = "SELECT * FROM artists"
    @artists = ActiveRecord::Base.connection.execute(sql)
  end

  def show
    artist_id = params[:id]
    sql = ActiveRecord::Base.send(:sanitize_sql_array, ["SELECT * FROM artists WHERE id = ?", artist_id])
    @artist = ActiveRecord::Base.connection.execute(sql).first
  end
end