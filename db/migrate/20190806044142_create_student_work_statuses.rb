class CreateStudentWorkStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_work_statuses do |t|
      t.integer :process_status
      t.integer :work_id
      t.integer :student_id
      t.timestamps
    end
  end
end
