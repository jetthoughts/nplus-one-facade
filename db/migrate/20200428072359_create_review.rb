class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rate
      t.references :film

      t.timestamps
    end
  end
end
