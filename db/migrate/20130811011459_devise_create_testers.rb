class DeviseCreateTesters < ActiveRecord::Migration
  def self.up
    create_table(:testers) do |t|
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
      t.string :relationship
    end

    add_index :testers, :email,                :unique => false
    add_index :testers, :reset_password_token, :unique => true
    # add_index :testers, :confirmation_token,   :unique => true
    # add_index :testers, :unlock_token,         :unique => true
    # add_index :testers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :testers
  end
end
