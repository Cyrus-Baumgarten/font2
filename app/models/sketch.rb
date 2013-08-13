class Sketch < ActiveRecord::Base
  validates :attribute1, :attribute2, :attribute3, :attribute4, :attribute5, :attribute6, :attribute7, :attribute8, :attribute9, presence: true
  attr_accessible :attribute1, :attribute2, :attribute3, :attribute4, :attribute5, :attribute6, :attribute7, :attribute8, :attribute9
  belongs_to :user
  belongs_to :subject
  has_many :internals
  has_many :externals
end