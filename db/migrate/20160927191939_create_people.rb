class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.date :date_birth
      t.string :sex
      t.string :email
      t.string :phone
      t.text :address
      t.boolean :patient
      t.boolean :student
      t.boolean :teacher
      t.boolean :employee
      t.boolean :host
      t.references :city, foreign_key: true, index: true

      t.timestamps
    end
  end
end
