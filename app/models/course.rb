class Course < ApplicationRecord
  belongs_to :school

  validates_presence_of :title, :description, :content, :duration, :creation_date, :active_students, :price


  scope :title_search, -> title {where("title LIKE ?", "%#{title}%")}
  scope :by_school, -> school_id {where(school_id: school_id)}
end
