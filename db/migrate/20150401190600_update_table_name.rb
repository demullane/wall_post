class UpdateTableName < ActiveRecord::Migration
  def change
    rename_table :wall_posts, :poster
  end
end
