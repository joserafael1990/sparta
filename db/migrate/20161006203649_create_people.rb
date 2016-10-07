class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.date :birth_date
      t.string :sex
      t.string :email
      t.string :job_title
      t.text :address
      t.string :delagation
      t.boolean :employee
      t.boolean :patient
      t.boolean :student
      t.boolean :instructor
      t.boolean :host
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
