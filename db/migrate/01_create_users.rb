class CreateUsers < ActiveRecord::Migration[6.1]
    def change
      create_table :users do |t|
        t.string :email
        t.string :username
        t.datetime :created_at
        t.datetime :updated_at
      end
    end
  end
  