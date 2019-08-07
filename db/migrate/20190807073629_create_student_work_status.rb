class CreateStudentWorkStatus < ActiveRecord::Migration[5.1]
  def change
    create_table :student_work_statuses do |t|
      t.integer :work_id
      t.integer :student_id
      t.integer :process_status
    end
  end
end
