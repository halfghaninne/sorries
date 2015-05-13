class Apology
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :date, type: Date
  field :gender, type: String
  field :relationship, type: String
  field :was_warranted, type: Boolean
  field :could_communicate_differently, type: Boolean
  
  validates_presence_of :gender, :relationship, :was_warranted, :could_communicate_differently
  belongs_to :user

  attr_accessible :date, :gender, :relationship, :was_warranted, :could_communicate_differently
  
end