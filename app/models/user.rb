require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :username, type: String
  field :password, type: String
  field :_id, type: String, default: ->{ username } 
  validates_presence_of :username
  validates_presence_of :password
  
  has_many :apologies
  accepts_nested_attributes_for :apologies
  
  attr_accessible :username, :password
  
  before_create :set_password

  def set_password
    encrypted_pass = BCrypt::Password.create(self.password)
    self.password = encrypted_pass
  end
end