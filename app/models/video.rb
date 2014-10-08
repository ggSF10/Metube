class Video < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  validates :author, presence: true
  validates :url, presence: true
end
