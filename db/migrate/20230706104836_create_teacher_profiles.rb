class CreateTeacherProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_profiles do |t|
      t.string :first_name
      t.string :lastname
      t.bigint :phone_no
      t.string :gender
      t.string :education
      t.date :birth_date
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
