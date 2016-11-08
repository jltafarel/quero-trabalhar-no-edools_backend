class School < ApplicationRecord
  validates_presence_of :name, :email, :pitch, :subdomain, :creation_date
  validates_uniqueness_of :subdomain
  validates_format_of :email, with: /@/

  scope :name_search, -> name {where("name LIKE ?", "%#{name}%")}
end
