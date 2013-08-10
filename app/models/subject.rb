class Subject < TemporaryUser
  has_one :sketch
  has_many :internals
  has_many :externals
end
