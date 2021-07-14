class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs
  has_many :comments
  has_many :favorites, dependent: :destroy

  mount_uploader :profile_image, ImageUploader

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 7 }



def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


end
