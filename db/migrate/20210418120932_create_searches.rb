class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :category
      t.string :text
      t.string :email
      t.text :data

      t.timestamps
    end
  end
end
