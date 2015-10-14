class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.column :body, :string
      t.column :user_id, :integer
      t.column :image_id, :integer
      t.column :points, :integer

      t.timestamps
    end

  end
end
