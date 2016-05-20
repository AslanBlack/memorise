class DropScrapes < ActiveRecord::Migration
  def change
    drop_table :scrapes
  end
end
