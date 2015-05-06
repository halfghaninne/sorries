class Apology
  include Mongoid::Document
  field :date, type: Timestamp
  field :gender, type: String
  field :relationship, type: String
  field :was_warranted, type: Boolean
  field :could_communicate_differently, type: Boolean
  referenced_in :user
end
