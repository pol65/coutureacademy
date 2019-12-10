class AddSummaryToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :summary, :text
  end
end
