class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :string
      t.string :body
      t.string :text
      t.string :date
      t.string :datetime

      t.timestamps
    end
  end
end
