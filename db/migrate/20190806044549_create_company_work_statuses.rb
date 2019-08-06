class CreateCompanyWorkStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :company_work_statuses do |t|
      t.integer :work_id
      t.integer :company_id
      t.boolean :process_status
      t.timestamps
    end
  end
end
