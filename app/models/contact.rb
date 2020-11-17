class Contact < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_one :address
end
