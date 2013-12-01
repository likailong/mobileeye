class AddLatToLivevideos < ActiveRecord::Migration
  def change
    add_column :livevideos, :lat, :string
  end
end
