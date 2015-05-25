class AddUserIdToMovies < ActiveRecord::Migration
  def up
    add_column :movies, :user_id, :integer
  end

  def down
  	remove_column :movies, :user_id, :integer
  end

end
