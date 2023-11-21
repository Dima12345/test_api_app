class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.integer :month
      t.decimal :rnd_percentage, default: 0
      t.decimal :total, default: 0
      t.references :owner, polymorphic: true, null: false
      t.belongs_to :project
    end

    add_index :assignments, [:owner_id, :owner_type, :project_id]
  end
end
