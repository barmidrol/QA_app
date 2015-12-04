class AddColumnsToquestionsAndAnswers < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
    end
  end
end
