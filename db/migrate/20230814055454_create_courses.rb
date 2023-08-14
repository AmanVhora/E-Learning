class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :title
      t.references :course_category, null: false, foreign_key: true
      t.string :caption
      t.text :description
      t.integer :price
      t.string :language

      t.timestamps
    end
  end
end
