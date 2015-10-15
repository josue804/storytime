class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :body, :string
      t.column :user_id, :integer
      t.column :image_id, :integer
      t.column :points, :integer

      t.timestamps
    end

  end
end
