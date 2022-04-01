class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name_title
      t.string :name_first
      t.string :name_last
      t.string :gender
      t.string :email
      t.string :picture_thumbnail
      t.string :picture_medium
      t.string :picture_large

      t.timestamps
    end
  end
end
