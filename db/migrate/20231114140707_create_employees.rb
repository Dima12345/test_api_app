class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.decimal :salary
      t.decimal :total
    end
  end
end
