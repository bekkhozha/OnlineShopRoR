class User < ApplicationRecord
  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :get_admin, -> {where(admin: true)}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
