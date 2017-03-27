class AddMembershipToPeople < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :membership, :integer 
  end
end
