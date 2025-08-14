class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

      enum role: { customer: 0,owner: 1 ,admin: 2 }
      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       has_one :shop, dependent: :destroy
end
