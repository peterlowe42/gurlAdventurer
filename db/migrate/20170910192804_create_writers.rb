class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.text :bio

      t.timestamps null: false
    end
  end
end
