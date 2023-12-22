class Trip < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :journal_entries
  has_many :places
end
