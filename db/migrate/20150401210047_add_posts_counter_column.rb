class AddPostsCounterColumn < ActiveRecord::Migration
  def change
    add_column :posters, :counter, :integer
  end
end
