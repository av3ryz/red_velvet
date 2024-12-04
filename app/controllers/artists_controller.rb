class ArtistsController < ApplicationController
  def index
    sql = "SELECT * FROM artists"
    @artists = ActiveRecord::Base.connection.execute(sql)
  end

  def show
  end
end
