class External < ActiveRecord::Base
  attr_accessible :attribute1size, :attribute2size, :attribute3size, :attribute4size, :attribute5size, :attribute6size, :attribute7size, :attribute8size, :attribute9size
  belongs_to :sketch
  belongs_to :tester
  belongs_to :subject
end
