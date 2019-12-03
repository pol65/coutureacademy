class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.belongs_to :lesson, index: true 
      t.belongs_to :user, index: true 

      t.timestamps
    end
  end
end
