class AddDefaultAdminUser < ActiveRecord::Migration
  def up
    user = User.create!(:name => "admin", :password =>"123")
    user.toggle!(:admin)
  end

  def down
    user = User.find_by_login( 'admin' )
    user.destroy
  end
end
