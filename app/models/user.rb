class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :organization_users
  has_many :organizations, through: :organization_users

  before_save :set_full_name

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
end
