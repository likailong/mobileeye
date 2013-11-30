class CreateLivevideos < ActiveRecord::Migration
  def change
    create_table :livevideos do |t|
      t.string :information
      t.string :location
      t.string :url

      t.timestamps
    end
    add_index :livevideos, :created_at
  end
end
