class Internal < ActiveRecord::Base
  attr_accessible :attribute1size, :attribute2size, :attribute3size, :attribute4size, :attribute5size, :attribute6size, :attribute7size, :attribute8size, :attribute9size, :finalized
  validates :attribute1size, :attribute2size, :attribute3size, :attribute4size, :attribute5size, :attribute6size, :attribute7size, :attribute8size, :attribute9size, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  belongs_to :sketch
  belongs_to :tester
  belongs_to :subject
end
