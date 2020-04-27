class CreateFilm < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.string :genre, null: false

      t.timestamps
    end
  end
end
