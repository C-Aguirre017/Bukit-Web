class AddInformationToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :information, :text
  end
end
