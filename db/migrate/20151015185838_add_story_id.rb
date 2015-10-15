class AddStoryId < ActiveRecord::Migration
  def change
    add_column :contributions, :story_id, :integer
  end
end
