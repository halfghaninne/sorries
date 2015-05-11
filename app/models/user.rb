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
  
  ########################### CHARTING METHODS ####################
  
  # def count_chart_data
  # end
  
  # data = [{"label":"one", "value":20},
  #         {"label":"two", "value":50},
  #         {"label":"three", "value":30}];
  
  def gender_chart_data
    @data = [{label: "men", value: self.apologies.where(gender: "man").count}, 
            {label: "women", value: self.apologies.where(gender: "woman").count}, 
            {label: "trans", value: self.apologies.where(gender: "trans").count}, 
            {label: "genderqueer", value: self.apologies.where(gender: "genderqueer").count}, 
            {label: "undetermined", value: self.apologies.where(gender: "undetermined").count}]
  end
  
  def relationship_chart_data
  end
  
  def was_warranted_chart_data
  end
  
  # def communicate_chart_data
  # end
  
  
end