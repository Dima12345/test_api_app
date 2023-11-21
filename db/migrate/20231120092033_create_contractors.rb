class CreateContractors < ActiveRecord::Migration[6.1]
  def change
    create_table :contractors do |t|
      t.string :name
      t.decimal :total
      t.decimal :salary

      t.timestamps
    end
  end
end
