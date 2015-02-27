class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :company, index: true
      t.integer :capacity
      t.date :date

      t.timestamps
    end
    add_foreign_key :events, :companies
  end
end
