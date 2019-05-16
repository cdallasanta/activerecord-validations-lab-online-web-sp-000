class Author < ActiveRecord::Base
  validates :name,
    presence: true,
    uniqueness: true
  validates 
end
