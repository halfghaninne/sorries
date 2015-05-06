class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :date, type: Timestamp
  field :gender, type: String
  field :relationship, type: String
  field :was_warranted, type: Boolean
  field :could_communicate_differently, type: Boolean
  
  belongs_to :user
  
  attr_readonly :date
  attr_accessible :gender, :relationship, :was_warranted, :could_communicate_differently
end