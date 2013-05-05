class AddEmailOptions < ActiveRecord::Migration
  def self.create_option(name, value)
    unless Option.find_by_name(name)
      Option.create(:value => value) do |option|
        option.name = name
        option.save!
      end
    end
  end

  def self.delete_option(name)
    if option = Option.find_by_name(name)
      option.destroy
    end
  end
  
  def self.up
    create_option("email_subject", "Invitation to Red Gate Bug Hunt")
    create_option("email_body_template", "Hi there!")
  end

  def self.down
    delete_option("email_body_template")
    delete_option("email_subject")
  end
end
