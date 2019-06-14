class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :street
      t.string :landmark
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.timestamps
    end
  end
end
