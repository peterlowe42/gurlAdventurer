class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :fullname
      t.text :bio

      t.timestamps null: false
    end
  end
end
