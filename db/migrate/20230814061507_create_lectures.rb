class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.references :course, null: false, foreign_key: true
      t.string :video_title

      t.timestamps
    end
  end
end
