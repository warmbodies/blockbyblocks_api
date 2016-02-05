class AddNotesToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :user_note, :string
    add_column :appointments, :bookie_note, :string
  end
end
