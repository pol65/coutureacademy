class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content 
      t.decimal :price 
      t.string :category
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end
