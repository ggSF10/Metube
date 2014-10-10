class Playlist < ActiveRecord::Base
 
  has_many :videos, :through => :VideoPlaylists
  belongs_to :user
  has_many :VideoPlaylists

end