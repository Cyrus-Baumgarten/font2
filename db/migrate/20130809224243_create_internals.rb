class CreateInternals < ActiveRecord::Migration
  def change
    create_table :internals do |t|
      t.integer :sketch_id
      t.integer :tester_id
      t.integer :subject_id
      t.integer :number
      t.boolean :finalized, default: false
      t.integer :attribute1size, default: 5
      t.integer :attribute2size, default: 5
      t.integer :attribute3size, default: 5
      t.integer :attribute4size, default: 5
      t.integer :attribute5size, default: 5
      t.integer :attribute6size, default: 5
      t.integer :attribute7size, default: 5
      t.integer :attribute8size, default: 5
      t.integer :attribute9size, default: 5
      t.timestamps
    end
  end
end
