# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :password, presence: true, length: { in: 8..20 }, confirmation: true
end
