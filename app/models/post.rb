class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end

class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.split & [/Won't Believe/, /Secret/, /Guess/, /Top \d/] 
