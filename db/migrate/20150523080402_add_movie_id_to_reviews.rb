class AddMovieIdToReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :movie_id, :integer
  end

  def down
  	remove_column :reviews, :movie_id, :integer
  end
end
