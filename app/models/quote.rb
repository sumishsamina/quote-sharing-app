class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :philosopher
  has_many :quote_categories, dependent: :destroy
  has_many :categories, through: :quote_categories

  #Validates that al least one category is selected
  validates :categories, presence: {message: "Must have atleast one category"}
  
end
