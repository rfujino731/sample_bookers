class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  # def get_profile_image
  #   unless image.attached?
  #     byebug
  #     puts("####################################")
  #     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
  #     image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
  #   end
  #     byebug
  #     puts("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
  #     image.variant(resize_to_limit: [100, 100])
  # end


  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height])
  end


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpeg'
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end



end