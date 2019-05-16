class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end

class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    click_baits = [/Won't Believe/, /Secret/, /Guess/, /Top \d/]
    unless click_baits.any?{|regex| value =~ regex}
      record.errors(attribute) << (options[:message] || "is not clickbait-y enough")
    end
  end
end
