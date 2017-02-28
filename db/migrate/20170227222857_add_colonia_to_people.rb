class AddColoniaToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :neighborhood, :string
    add_column :people, :zip_code, :integer
  end
end
