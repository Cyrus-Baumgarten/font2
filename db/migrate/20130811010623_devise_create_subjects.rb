class DeviseCreateSubjects < ActiveRecord::Migration
  def self.up
    create_table(:subjects) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
      t.string :name
      t.string :code
    end

    add_index :subjects, :email,                :unique => false
    add_index :subjects, :reset_password_token, :unique => true
    # add_index :subjects, :confirmation_token,   :unique => true
    # add_index :subjects, :unlock_token,         :unique => true
    # add_index :subjects, :authentication_token, :unique => true
  end

  def self.down
    drop_table :subjects
  end
end
