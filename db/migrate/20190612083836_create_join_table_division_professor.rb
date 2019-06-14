class CreateJoinTableDivisionProfessor < ActiveRecord::Migration[5.2]
  def change
    create_join_table :divisions, :professors do |t|
       t.index [:division_id, :professor_id]
      # t.index [:professor_id, :division_id]
    end
  end
end
