class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :ideas
  has_many :posts
  acts_as_voter
  
  mount_uploader :avatar, AvatarUploader
  
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

 
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
  
  validates :name, :email, :about, :presence =>true  
    
end
