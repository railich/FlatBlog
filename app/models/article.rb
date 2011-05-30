class Article < ActiveRecord::Base
  validates :title, :body, :presence => true
  validates :title, :uniqueness => true
  
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
end
