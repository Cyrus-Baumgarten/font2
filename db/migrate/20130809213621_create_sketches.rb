class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      
      t.integer :user_id
      t.integer :subject_id
      t.integer :status
      
      #listing of custom attributes
      #only attributes that need to be accessible
      t.string :attribute1
      t.string :attribute2
      t.string :attribute3
      t.string :attribute4
      t.string :attribute5
      t.string :attribute6
      t.string :attribute7
      t.string :attribute8
      t.string :attribute9
      
      #finalized test results so temporary accounts and data can be deleted  
      #Format: Test(number)Attribute(number)
      t.integer :T1A1
      t.integer :T1A2
      t.integer :T1A3
      t.integer :T1A4
      t.integer :T1A5
      t.integer :T1A6
      t.integer :T1A7
      t.integer :T1A8
      t.integer :T1A9
      
      t.integer :T2A1
      t.integer :T2A2
      t.integer :T2A3
      t.integer :T2A4
      t.integer :T2A5
      t.integer :T2A6
      t.integer :T2A7
      t.integer :T2A8
      t.integer :T2A9
      
      t.integer :T3A1
      t.integer :T3A2
      t.integer :T3A3
      t.integer :T3A4
      t.integer :T3A5
      t.integer :T3A6
      t.integer :T3A7
      t.integer :T3A8
      t.integer :T3A9
      
      t.integer :T4A1
      t.integer :T4A2
      t.integer :T4A3
      t.integer :T4A4
      t.integer :T4A5
      t.integer :T4A6
      t.integer :T4A7
      t.integer :T4A8
      t.integer :T4A9
      
      t.integer :T5A1
      t.integer :T5A2
      t.integer :T5A3
      t.integer :T5A4
      t.integer :T5A5
      t.integer :T5A6
      t.integer :T5A7
      t.integer :T5A8
      t.integer :T5A9
      
      t.integer :T6A1
      t.integer :T6A2
      t.integer :T6A3
      t.integer :T6A4
      t.integer :T6A5
      t.integer :T6A6
      t.integer :T6A7
      t.integer :T6A8
      t.integer :T6A9
      
      t.integer :T7A1
      t.integer :T7A2
      t.integer :T7A3
      t.integer :T7A4
      t.integer :T7A5
      t.integer :T7A6
      t.integer :T7A7
      t.integer :T7A8
      t.integer :T7A9
      
      t.integer :T8A1
      t.integer :T8A2
      t.integer :T8A3
      t.integer :T8A4
      t.integer :T8A5
      t.integer :T8A6
      t.integer :T8A7
      t.integer :T8A8
      t.integer :T8A9
      
      t.integer :T9A1
      t.integer :T9A2
      t.integer :T9A3
      t.integer :T9A4
      t.integer :T9A5
      t.integer :T9A6
      t.integer :T9A7
      t.integer :T9A8
      t.integer :T9A9
      
      t.integer :T10A1
      t.integer :T10A2
      t.integer :T10A3
      t.integer :T10A4
      t.integer :T10A5
      t.integer :T10A6
      t.integer :T10A7
      t.integer :T10A8
      t.integer :T10A9
      
      t.integer :T11A1
      t.integer :T11A2
      t.integer :T11A3
      t.integer :T11A4
      t.integer :T11A5
      t.integer :T11A6
      t.integer :T11A7
      t.integer :T11A8
      t.integer :T11A9
      
      t.integer :T12A1
      t.integer :T12A2
      t.integer :T12A3
      t.integer :T12A4
      t.integer :T12A5
      t.integer :T12A6
      t.integer :T12A7
      t.integer :T12A8
      t.integer :T12A9
      
      t.integer :T13A1
      t.integer :T13A2
      t.integer :T13A3
      t.integer :T13A4
      t.integer :T13A5
      t.integer :T13A6
      t.integer :T13A7
      t.integer :T13A8
      t.integer :T13A9
      
      t.integer :T14A1
      t.integer :T14A2
      t.integer :T14A3
      t.integer :T14A4
      t.integer :T14A5
      t.integer :T14A6
      t.integer :T14A7
      t.integer :T14A8
      t.integer :T14A9
      
      t.integer :T15A1
      t.integer :T15A2
      t.integer :T15A3
      t.integer :T15A4
      t.integer :T15A5
      t.integer :T15A6
      t.integer :T15A7
      t.integer :T15A8
      t.integer :T15A9

      t.timestamps
    end
  end
end
