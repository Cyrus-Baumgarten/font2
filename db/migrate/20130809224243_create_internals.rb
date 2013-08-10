class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.integer :sketch_id
      t.integer :tester_id
      t.integer :subject_id
      t.integer :attribute1size
      t.integer :attribute2size
      t.integer :attribute3size
      t.integer :attribute4size
      t.integer :attribute5size
      t.integer :attribute6size
      t.integer :attribute7size
      t.integer :attribute8size
      t.integer :attribute9size
      t.timestamps
    end
  end
end
