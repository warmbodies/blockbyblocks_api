class AddOccurredToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :occurred, :boolean
  end
end
