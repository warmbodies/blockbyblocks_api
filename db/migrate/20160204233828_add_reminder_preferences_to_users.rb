class AddReminderPreferencesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remind_via_email, :boolean
    add_column :users, :remind_via_phone, :boolean
  end
end
