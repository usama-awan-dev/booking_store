class Shop < ApplicationRecord

      has_one_attached :image
      validates :name, presence: true
      belongs_to :user

      has_many :products, dependent: :destroy

end
