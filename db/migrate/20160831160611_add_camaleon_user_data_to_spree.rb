class AddCamaleonUserDataToSpree < ActiveRecord::Migration
  def change
    Spree::User.includes(:spree_roles).where(spree_roles: {name: 'admin'}).each do |s_user|
      s_user.update_column(:role, 'admin')
    end
    remove_column Cama::User.table_name, :username
  end
end
