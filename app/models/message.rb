require 'net/http'
require 'uri'
require 'json'

class Message < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url
  

  
end
