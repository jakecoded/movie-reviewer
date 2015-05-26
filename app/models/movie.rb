class Movie < ActiveRecord::Base

	belongs_to :user
	has_many :reviews

	searchkick word_start: [:title]

	validates :title, presence: true, length: { minimum: 5, maximum: 50 }
	validates :description, presence: true
	validates :duration, presence: true, numericality: true
	validates :director, presence: true
	has_attached_file :image, :styles => { :small => "150x150", :medium => "300x300>", :thumb => "100x100>", :cover_small => "210x350", :cover_large => "263x390" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
