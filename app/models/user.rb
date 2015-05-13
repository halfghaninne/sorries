require 'bcrypt'

require 'json'

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
  
  def gender_chart_data
    data = [{label: "MEN", value: self.apologies.where(gender: "man").count}, 
            {label: "WOMEN", value: self.apologies.where(gender: "woman").count}, 
            {label: "TRANS", value: self.apologies.where(gender: "trans").count}, 
            {label: "GENDERQUEER", value: self.apologies.where(gender: "genderqueer").count}, 
            {label: "UNDETERMINED", value: self.apologies.where(gender: "undetermined").count}]
    
    @data = data.to_json
  end
  
  def relationship_chart_data
    labels_array = self.apologies.distinct(:relationship)
    data = []
    labels_array.each do |label|
      value = self.apologies.where(relationship: label).count
      data << {label: label.upcase, value: value}
    end
    
    @data = data.to_json
    
  end
  
  def communicate_differently_chart_data
    data = [{label: "YES", value: self.apologies.where(could_communicate_differently: true).count},
            {label: "NO", value: self.apologies.where(could_communicate_differently: false).count}]
    
    @data = data.to_json
  end
  
  
  def was_warranted_chart_data
    data = [{label: "WARRANTED", value: self.apologies.where(was_warranted: true).count},
            {label: "NOT", value: self.apologies.where(was_warranted: false).count}]
    
    @data = data.to_json
  end

  
  
end