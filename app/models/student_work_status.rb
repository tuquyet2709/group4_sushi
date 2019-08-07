class StudentWorkStatus < ApplicationRecord
  belongs_to :student
  belongs_to :work

  validates :work_id,  presence: true
  validates :student_id,  presence: true
  validates :process_status,  presence: true
end
