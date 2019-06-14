class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :division, foreign_key: true
      t.timestamps
    end
  end
end
