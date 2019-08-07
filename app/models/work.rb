class Work < ApplicationRecord

  validates :title,  presence: true
  validates :dateline,  presence: true
  validates :salary,  presence: true
  validates :work_location,  presence: true
  validates :content,  presence: true
  validates :status,  presence: true

end
