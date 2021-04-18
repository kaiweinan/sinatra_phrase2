class CreateAppointments < ActiveRecord::Migration[6.1]
    def change
      create_table :appointments do |t|
        t.string :name
        t.string :technician
        t.timestamp :appointment
        t.belongs_to :user
        t.datetime :created_at
        t.datetime :updated_at
      end
    end
  end
  