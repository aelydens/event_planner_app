class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.date :date
      t.references :course, index: true
    end
    add_foreign_key :lessons, :courses
  end
end
