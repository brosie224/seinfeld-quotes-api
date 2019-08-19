class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :content
      t.string :character
      t.integer :season
      t.integer :episode

      t.timestamps
    end
  end
end
