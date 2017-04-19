class DeleteIsAdminFromJob < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :is_admin 
  end
end
