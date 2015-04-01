class UpdateTableNameAgain < ActiveRecord::Migration
  def change
    rename_table :poster, :posters
  end
end
