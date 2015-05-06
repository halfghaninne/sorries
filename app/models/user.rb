class User
  include Mongoid::Document
  field :username, type: String
  key :username
  field :password, type: String
  validates_presence_of :username
  validates_presence_of :password
  references_many :apologies
end
