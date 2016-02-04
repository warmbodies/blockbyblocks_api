class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :bookies do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end

    add_index :bookies, :email
    add_index :bookies, :phone

    create_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :bookie
      t.datetime :time

      t.timestamps null: false
    end
  end
end
