class AddRahulToUsers < ActiveRecord::Migration
  def self.up
    unless User.find_by_login('rahul')
      User.create(:login => 'rahul', :email => 'rahul@vohra.org.uk', :name => "Rahul Vohra", :password => 'password', :password_confirmation => 'password', :admin => true)
    end
  end
end
