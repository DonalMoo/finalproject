class UpdateUsers < ActiveRecord::Migration
  def change
  	@u = User.find_by(email: 'admin@email.ie')
  	#find user with admin email, if no email exists return nil and do nothing
  	if @u != nil
  		@u.update_attribute :admin, true
  	end
  end
end
