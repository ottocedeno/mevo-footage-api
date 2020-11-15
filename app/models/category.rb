class Category < ApplicationRecord
  has_many :videos

  def self.all_category_names
    Category.all.map do |cat|
      cat.name
    end
  end
end
