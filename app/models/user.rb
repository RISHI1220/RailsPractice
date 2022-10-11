class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :name, presence: true, length: { minimum:1, maximum: 20 }

  before_save :capatalize_title
     
  private
  def capatalize_title
    self.name=name.capitalize()
  end
end
