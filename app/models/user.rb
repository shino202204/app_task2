class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Active Storageを使って画像を扱えるようにする
  has_one_attached :image

  # アソシエーションの設定
  has_many :books, dependent: :destroy

  def get_image(width, height)
    # 「unless」：もし〜でなければ → もし画像が添付されていなければ
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width,height]).processed
  end
end