class AddLngToLivevideos < ActiveRecord::Migration
  def change
    add_column :livevideos, :lng, :string
  end
end
