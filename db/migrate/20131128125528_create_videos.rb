class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :videoinfo

      t.timestamps
    end
    add_index :videos, [:created_at]
  end
end
