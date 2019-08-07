class Work < ApplicationRecord
  has_many :student_work_statuses
  has_many :students, through: :student_work_statuses

  belongs_to :company

  validates :title,  presence: true, length: { maximum: 30 }
  validates :dateline,  presence: true
  validates :salary,  presence: true
<<<<<<< HEAD
  validates :content,  presence: true, length: { maximum: 500 }
  validates :status,  presence: true
=======
  validates :work_location,  presence: true
  validates :content,  presence: true

>>>>>>> 5fa6f1d... done all
end
