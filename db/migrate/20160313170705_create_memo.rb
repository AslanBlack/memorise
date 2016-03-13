class CreateMemo < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :title
      t.text :description
      t.string :url
    end
  end
end
