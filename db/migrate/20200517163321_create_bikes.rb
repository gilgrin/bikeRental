class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :color
      t.string :size
      t.string :type
      t.integer :price
      t.string :equipment
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
