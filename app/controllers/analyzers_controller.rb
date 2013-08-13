class AnalyzersController < ApplicationController
  def view
    @sketch = Sketch.find(params[:sketch_id])
    @user = @sketch.user
    unless (user_signed_in? && current_user == @user) || (user_signed_in? && current_user.admin?)
      flash[:error] = "I'm sorry, This Information is Private, Please Sign in if You Are This User"
      redirect_to new_user_session_path
    else
      @subject = @sketch.subject
      @externals = @sketch.externals.to_a
      @internals = @sketch.internals.to_a
      attributes
      #parent method in Application Controller
      #returns @attributes hash
    
      internal_means
      #parent method in Application Controller
      #returns
      #@completedinternals, an array of completed internal test objects
      #@completedinternalcount, an integer of the amount of completed internal tests
      #@internal_attribute_(n)_mean, an integer of the mean of all test results for the sketches attribute(n)
      external_means
      #parent method in Application Controller
      #returns same values as internal_means, just for externals
      #@completedexternals
      #@completedexternalcount
      #@external_attribute_(n)_mean
      
      
      #creates arrays and counters of completed internal tests for each of: subordinates, peers and superiors   
      @subordinate_completedinternals = [] 
      @subordinate_completedinternals_count = 0
    
      @peer_completedinternals = []
      @peer_completedinternals_count = 0
    
      @superior_completedinternals = []
      @superior_completedinternals_count = 0
    
      @completedinternals.each do |internal|
        if internal.number <= 5
          @subordinate_completedinternals.push(internal)
          @subordinate_completedinternals_count += 1
        elsif internal.number > 5 and internal.number <= 10
          @peer_completedinternals.push(internal)
          @peer_completedinternals_count += 1
        elsif internal.number >= 11
          @superior_completedinternals.push(internal)
          @superior_completedinternals_count += 1
        end
      end
      
      #creates arrays and counters of completed external tests for each of: subordinates, peers and superiors   
      @subordinate_completedexternals = [] 
      @subordinate_completedexternals_count = 0
    
      @peer_completedexternals = []
      @peer_completedexternals_count = 0
    
      @superior_completedexternals = []
      @superior_completedexternals_count = 0
    
      @completedexternals.each do |external|
        if external.number <= 5
          @subordinate_completedexternals.push(external)
          @subordinate_completedexternals_count += 1
        elsif external.number > 5 and external.number <= 10
          @peer_completedexternals.push(external)
          @peer_completedexternals_count += 1
        elsif external.number >= 11
          @superior_completedexternals.push(external)
          @superior_completedexternals_count += 1
        end
      end
      
      #SIX MASSIVE BLOCKS iterate over each of the six arrays and calculate the mean of all the values that have been given so far, updates as soon as one test has been completed
      #returns mean values as intance variables for the mean of every attribute for each of the three groups as: @(relationship)_internal_attribute_(n)_mean
      #all instance variables are used in the view
    
      subordinate_internal_attribute_1_total = 0
      subordinate_internal_attribute_2_total = 0
      subordinate_internal_attribute_3_total = 0
      subordinate_internal_attribute_4_total = 0
      subordinate_internal_attribute_5_total = 0
      subordinate_internal_attribute_6_total = 0
      subordinate_internal_attribute_7_total = 0
      subordinate_internal_attribute_8_total = 0
      subordinate_internal_attribute_9_total = 0

      @subordinate_completedinternals.each do |internal|
         subordinate_internal_attribute_1_total += internal.attribute1size
         subordinate_internal_attribute_2_total += internal.attribute2size
         subordinate_internal_attribute_3_total += internal.attribute3size
         subordinate_internal_attribute_4_total += internal.attribute4size
         subordinate_internal_attribute_5_total += internal.attribute5size
         subordinate_internal_attribute_6_total += internal.attribute6size
         subordinate_internal_attribute_7_total += internal.attribute7size
         subordinate_internal_attribute_8_total += internal.attribute8size
         subordinate_internal_attribute_9_total += internal.attribute9size
      end

      if @subordinate_completedinternals_count > 0
        @subordinate_internal_attribute_1_mean = subordinate_internal_attribute_1_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_2_mean = subordinate_internal_attribute_2_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_3_mean = subordinate_internal_attribute_3_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_4_mean = subordinate_internal_attribute_4_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_5_mean = subordinate_internal_attribute_5_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_6_mean = subordinate_internal_attribute_6_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_7_mean = subordinate_internal_attribute_7_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_8_mean = subordinate_internal_attribute_8_total / @subordinate_completedinternals_count
        @subordinate_internal_attribute_9_mean = subordinate_internal_attribute_9_total / @subordinate_completedinternals_count
      end
    
      peer_internal_attribute_1_total = 0
      peer_internal_attribute_2_total = 0
      peer_internal_attribute_3_total = 0
      peer_internal_attribute_4_total = 0
      peer_internal_attribute_5_total = 0
      peer_internal_attribute_6_total = 0
      peer_internal_attribute_7_total = 0
      peer_internal_attribute_8_total = 0
      peer_internal_attribute_9_total = 0

      @peer_completedinternals.each do |internal|
         peer_internal_attribute_1_total += internal.attribute1size
         peer_internal_attribute_2_total += internal.attribute2size
         peer_internal_attribute_3_total += internal.attribute3size
         peer_internal_attribute_4_total += internal.attribute4size
         peer_internal_attribute_5_total += internal.attribute5size
         peer_internal_attribute_6_total += internal.attribute6size
         peer_internal_attribute_7_total += internal.attribute7size
         peer_internal_attribute_8_total += internal.attribute8size
         peer_internal_attribute_9_total += internal.attribute9size
      end

      if @peer_completedinternals_count > 0
        @peer_internal_attribute_1_mean = peer_internal_attribute_1_total / @peer_completedinternals_count
        @peer_internal_attribute_2_mean = peer_internal_attribute_2_total / @peer_completedinternals_count
        @peer_internal_attribute_3_mean = peer_internal_attribute_3_total / @peer_completedinternals_count
        @peer_internal_attribute_4_mean = peer_internal_attribute_4_total / @peer_completedinternals_count
        @peer_internal_attribute_5_mean = peer_internal_attribute_5_total / @peer_completedinternals_count
        @peer_internal_attribute_6_mean = peer_internal_attribute_6_total / @peer_completedinternals_count
        @peer_internal_attribute_7_mean = peer_internal_attribute_7_total / @peer_completedinternals_count
        @peer_internal_attribute_8_mean = peer_internal_attribute_8_total / @peer_completedinternals_count
        @peer_internal_attribute_9_mean = peer_internal_attribute_9_total / @peer_completedinternals_count
      end
    
      superior_internal_attribute_1_total = 0
      superior_internal_attribute_2_total = 0
      superior_internal_attribute_3_total = 0
      superior_internal_attribute_4_total = 0
      superior_internal_attribute_5_total = 0
      superior_internal_attribute_6_total = 0
      superior_internal_attribute_7_total = 0
      superior_internal_attribute_8_total = 0
      superior_internal_attribute_9_total = 0

      @superior_completedinternals.each do |internal|
         superior_internal_attribute_1_total += internal.attribute1size
         superior_internal_attribute_2_total += internal.attribute2size
         superior_internal_attribute_3_total += internal.attribute3size
         superior_internal_attribute_4_total += internal.attribute4size
         superior_internal_attribute_5_total += internal.attribute5size
         superior_internal_attribute_6_total += internal.attribute6size
         superior_internal_attribute_7_total += internal.attribute7size
         superior_internal_attribute_8_total += internal.attribute8size
         superior_internal_attribute_9_total += internal.attribute9size
      end

      if @superior_completedinternals_count > 0
        @superior_internal_attribute_1_mean = superior_internal_attribute_1_total / @superior_completedinternals_count
        @superior_internal_attribute_2_mean = superior_internal_attribute_2_total / @superior_completedinternals_count
        @superior_internal_attribute_3_mean = superior_internal_attribute_3_total / @superior_completedinternals_count
        @superior_internal_attribute_4_mean = superior_internal_attribute_4_total / @superior_completedinternals_count
        @superior_internal_attribute_5_mean = superior_internal_attribute_5_total / @superior_completedinternals_count
        @superior_internal_attribute_6_mean = superior_internal_attribute_6_total / @superior_completedinternals_count
        @superior_internal_attribute_7_mean = superior_internal_attribute_7_total / @superior_completedinternals_count
        @superior_internal_attribute_8_mean = superior_internal_attribute_8_total / @superior_completedinternals_count
        @superior_internal_attribute_9_mean = superior_internal_attribute_9_total / @superior_completedinternals_count
      end
    
      subordinate_external_attribute_1_total = 0
      subordinate_external_attribute_2_total = 0
      subordinate_external_attribute_3_total = 0
      subordinate_external_attribute_4_total = 0
      subordinate_external_attribute_5_total = 0
      subordinate_external_attribute_6_total = 0
      subordinate_external_attribute_7_total = 0
      subordinate_external_attribute_8_total = 0
      subordinate_external_attribute_9_total = 0

      @subordinate_completedexternals.each do |external|
         subordinate_external_attribute_1_total += external.attribute1size
         subordinate_external_attribute_2_total += external.attribute2size
         subordinate_external_attribute_3_total += external.attribute3size
         subordinate_external_attribute_4_total += external.attribute4size
         subordinate_external_attribute_5_total += external.attribute5size
         subordinate_external_attribute_6_total += external.attribute6size
         subordinate_external_attribute_7_total += external.attribute7size
         subordinate_external_attribute_8_total += external.attribute8size
         subordinate_external_attribute_9_total += external.attribute9size
      end

      if @subordinate_completedexternals_count > 0
        @subordinate_external_attribute_1_mean = subordinate_external_attribute_1_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_2_mean = subordinate_external_attribute_2_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_3_mean = subordinate_external_attribute_3_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_4_mean = subordinate_external_attribute_4_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_5_mean = subordinate_external_attribute_5_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_6_mean = subordinate_external_attribute_6_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_7_mean = subordinate_external_attribute_7_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_8_mean = subordinate_external_attribute_8_total / @subordinate_completedexternals_count
        @subordinate_external_attribute_9_mean = subordinate_external_attribute_9_total / @subordinate_completedexternals_count
      end
    
      peer_external_attribute_1_total = 0
      peer_external_attribute_2_total = 0
      peer_external_attribute_3_total = 0
      peer_external_attribute_4_total = 0
      peer_external_attribute_5_total = 0
      peer_external_attribute_6_total = 0
      peer_external_attribute_7_total = 0
      peer_external_attribute_8_total = 0
      peer_external_attribute_9_total = 0

      @peer_completedexternals.each do |external|
         peer_external_attribute_1_total += external.attribute1size
         peer_external_attribute_2_total += external.attribute2size
         peer_external_attribute_3_total += external.attribute3size
         peer_external_attribute_4_total += external.attribute4size
         peer_external_attribute_5_total += external.attribute5size
         peer_external_attribute_6_total += external.attribute6size
         peer_external_attribute_7_total += external.attribute7size
         peer_external_attribute_8_total += external.attribute8size
         peer_external_attribute_9_total += external.attribute9size
      end

      if @peer_completedexternals_count > 0
        @peer_external_attribute_1_mean = peer_external_attribute_1_total / @peer_completedexternals_count
        @peer_external_attribute_2_mean = peer_external_attribute_2_total / @peer_completedexternals_count
        @peer_external_attribute_3_mean = peer_external_attribute_3_total / @peer_completedexternals_count
        @peer_external_attribute_4_mean = peer_external_attribute_4_total / @peer_completedexternals_count
        @peer_external_attribute_5_mean = peer_external_attribute_5_total / @peer_completedexternals_count
        @peer_external_attribute_6_mean = peer_external_attribute_6_total / @peer_completedexternals_count
        @peer_external_attribute_7_mean = peer_external_attribute_7_total / @peer_completedexternals_count
        @peer_external_attribute_8_mean = peer_external_attribute_8_total / @peer_completedexternals_count
        @peer_external_attribute_9_mean = peer_external_attribute_9_total / @peer_completedexternals_count
      end
    
      superior_external_attribute_1_total = 0
      superior_external_attribute_2_total = 0
      superior_external_attribute_3_total = 0
      superior_external_attribute_4_total = 0
      superior_external_attribute_5_total = 0
      superior_external_attribute_6_total = 0
      superior_external_attribute_7_total = 0
      superior_external_attribute_8_total = 0
      superior_external_attribute_9_total = 0

      @superior_completedexternals.each do |external|
         superior_external_attribute_1_total += external.attribute1size
         superior_external_attribute_2_total += external.attribute2size
         superior_external_attribute_3_total += external.attribute3size
         superior_external_attribute_4_total += external.attribute4size
         superior_external_attribute_5_total += external.attribute5size
         superior_external_attribute_6_total += external.attribute6size
         superior_external_attribute_7_total += external.attribute7size
         superior_external_attribute_8_total += external.attribute8size
         superior_external_attribute_9_total += external.attribute9size
      end

      if @superior_completedexternals_count > 0
        @superior_external_attribute_1_mean = superior_external_attribute_1_total / @superior_completedexternals_count
        @superior_external_attribute_2_mean = superior_external_attribute_2_total / @superior_completedexternals_count
        @superior_external_attribute_3_mean = superior_external_attribute_3_total / @superior_completedexternals_count
        @superior_external_attribute_4_mean = superior_external_attribute_4_total / @superior_completedexternals_count
        @superior_external_attribute_5_mean = superior_external_attribute_5_total / @superior_completedexternals_count
        @superior_external_attribute_6_mean = superior_external_attribute_6_total / @superior_completedexternals_count
        @superior_external_attribute_7_mean = superior_external_attribute_7_total / @superior_completedexternals_count
        @superior_external_attribute_8_mean = superior_external_attribute_8_total / @superior_completedexternals_count
        @superior_external_attribute_9_mean = superior_external_attribute_9_total / @superior_completedexternals_count
      end
    end
  end
end

