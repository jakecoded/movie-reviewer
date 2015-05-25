class User < ActiveRecord::Base
  has_many :movies
  has_many :reviews

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_database_authentication(warden_conditions)
  	
	conditions = warden_conditions.dup

  	if login = conditions.delete(:login)
  		where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	else
  		where(conditions.to_hash).first
  	end

  end

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
