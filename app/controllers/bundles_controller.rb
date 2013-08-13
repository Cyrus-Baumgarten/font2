class BundlesController < ApplicationController
  def new
    @subject = current_subject
    @sketch = @subject.sketch
    @user = @sketch.user
  end

  def make
    @subject = current_subject
    @sketch = @subject.sketch
    @user = @sketch.user
    #loops fifteen times to create up to 15 different testers, internals, and externals and associates them to eachother
    (1..15).each do |index|
      #turns loop index into symbol to it can access params hash
      name_string = "name#{index}"
      email_string = "email#{index}"
      name = name_string.to_sym
      email = email_string.to_sym
      code = generator
      unless params[:bundle][email].empty? || params[:bundle][name].empty?
        #creates a new devise tester model
        @tester = Tester.new
        @tester.name = params[:bundle][name]
        @tester.email = params[:bundle][email]
        @tester.code = code
        @tester.password = code
        @tester.password_confirmation = code
        if index <= 5
          @tester.relationship = "subordinate"
        elsif index > 5 && index <= 10
          @tester.relationship = "peer"
        else
          @tester.relationship = "superior"
        end
        #if tester is valid then it will create a new external and internal, making sure the bundler doesn't create a test without a user
        #then creates a new internal test and associates the sketch, tester and subject
        @internal = Internal.new
        @internal.subject = @subject
        @internal.tester = @tester
        @internal.sketch = @sketch
        @internal.number = index
        @internal.finalized = false
        @internal.save
        #and does the same for the external
        @external = External.new
        @external.subject = @subject
        @external.tester = @tester
        @external.sketch = @sketch
        @external.number = index
        @external.finalized = false
        @external.save
      end
    end
    
    redirect_to internals_path
    
  end  
  
end
