class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      
      t.integer :user_id
      t.integer :subject_id
      
      #listing of custom attributes
      #only attributes need to be accessible
      t.string :attribute1
      t.string :attribute2
      t.string :attribute3
      t.string :attribute4
      t.string :attribute5
      t.string :attribute6
      t.string :attribute7
      t.string :attribute8
      t.string :attribute9

      t.timestamps
    end
  end
end
