class CreateStudentRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :student_ratings do |t|
      t.integer :company_id
      t.integer :student_id
      t.integer :work_id
      t.integer :score
      t.timestamps
    end
  end
end
