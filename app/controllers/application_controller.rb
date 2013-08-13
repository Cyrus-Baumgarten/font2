class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def generator
    a = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    output = []
    20.times do
    	output.push(rand(1..9).to_s)
      output.push(a[rand(1..26)])
    end
    output.join
  end
  
  def attributes
    @attributes = {
      1 => @sketch.attribute1,
      2 => @sketch.attribute2,
      3 => @sketch.attribute3,
      4 => @sketch.attribute4,
      5 => @sketch.attribute5,
      6 => @sketch.attribute6,
      7 => @sketch.attribute7,
      8 => @sketch.attribute8,
      9 => @sketch.attribute9 }
  end
  
  def internal_means
    @completedinternals = []
    @completedinternalcount = 0
    @internals.each do |internal|
      if internal.finalized?
        @completedinternals.push(internal)
        @completedinternalcount += 1
      end
    end
    #adds up each attributes values and divides them by completed tests to find average and store in variable
    @internal_attribute_1_total = 0
    @internal_attribute_2_total = 0
    @internal_attribute_3_total = 0
    @internal_attribute_4_total = 0
    @internal_attribute_5_total = 0
    @internal_attribute_6_total = 0
    @internal_attribute_7_total = 0
    @internal_attribute_8_total = 0
    @internal_attribute_9_total = 0
    
    @completedinternals.each do |internal|
       @internal_attribute_1_total += internal.attribute1size
       @internal_attribute_2_total += internal.attribute2size
       @internal_attribute_3_total += internal.attribute3size
       @internal_attribute_4_total += internal.attribute4size
       @internal_attribute_5_total += internal.attribute5size
       @internal_attribute_6_total += internal.attribute6size
       @internal_attribute_7_total += internal.attribute7size
       @internal_attribute_8_total += internal.attribute8size
       @internal_attribute_9_total += internal.attribute9size
    end
    
    if @completedinternalcount > 0
      @internal_attribute_1_mean = @internal_attribute_1_total / @completedinternalcount
      @internal_attribute_2_mean = @internal_attribute_2_total / @completedinternalcount
      @internal_attribute_3_mean = @internal_attribute_3_total / @completedinternalcount
      @internal_attribute_4_mean = @internal_attribute_4_total / @completedinternalcount
      @internal_attribute_5_mean = @internal_attribute_5_total / @completedinternalcount
      @internal_attribute_6_mean = @internal_attribute_6_total / @completedinternalcount
      @internal_attribute_7_mean = @internal_attribute_7_total / @completedinternalcount
      @internal_attribute_8_mean = @internal_attribute_8_total / @completedinternalcount
      @internal_attribute_9_mean = @internal_attribute_9_total / @completedinternalcount
    end
  end
  
  def external_means
    #creates an array of external objects that are marked as final
    @completedexternals = []
    @completedexternalcount = 0
    @externals.each do |external|
      if external.finalized?
        @completedexternals.push(external)
        @completedexternalcount += 1
      end
    end
    @external_attribute_1_total = 0
    @external_attribute_2_total = 0
    @external_attribute_3_total = 0
    @external_attribute_4_total = 0
    @external_attribute_5_total = 0
    @external_attribute_6_total = 0
    @external_attribute_7_total = 0
    @external_attribute_8_total = 0
    @external_attribute_9_total = 0
    
    @completedexternals.each do |external|
       @external_attribute_1_total += external.attribute1size
       @external_attribute_2_total += external.attribute2size
       @external_attribute_3_total += external.attribute3size
       @external_attribute_4_total += external.attribute4size
       @external_attribute_5_total += external.attribute5size
       @external_attribute_6_total += external.attribute6size
       @external_attribute_7_total += external.attribute7size
       @external_attribute_8_total += external.attribute8size
       @external_attribute_9_total += external.attribute9size
    end
    
    if @completedexternalcount > 0
      @external_attribute_1_mean = @external_attribute_1_total / @completedexternalcount
      @external_attribute_2_mean = @external_attribute_2_total / @completedexternalcount
      @external_attribute_3_mean = @external_attribute_3_total / @completedexternalcount
      @external_attribute_4_mean = @external_attribute_4_total / @completedexternalcount
      @external_attribute_5_mean = @external_attribute_5_total / @completedexternalcount
      @external_attribute_6_mean = @external_attribute_6_total / @completedexternalcount
      @external_attribute_7_mean = @external_attribute_7_total / @completedexternalcount
      @external_attribute_8_mean = @external_attribute_8_total / @completedexternalcount
      @external_attribute_9_mean = @external_attribute_9_total / @completedexternalcount
    end
  end
  
end
