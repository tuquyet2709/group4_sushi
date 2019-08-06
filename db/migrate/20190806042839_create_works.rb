class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :title
      t.datetime :dateline
      t.integer :salary
      t.string :tag
      t.string :work_location
      t.string :content
      t.boolean :status , default: false

      t.timestamps
    end
  end
end
