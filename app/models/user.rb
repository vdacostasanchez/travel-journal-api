class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :trips
  has_many :journal_entries
  has_many :images
  has_many :places
end
