class AddDefaultUser < ActiveRecord::Migration
  def up
    user = User.create!(:name => "auser", :password =>"123")
  end

  def down
    user = User.find_by_login( 'auser' )
    user.destroy
  end
end
