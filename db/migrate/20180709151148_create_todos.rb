class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :created_by
      t.references :todo, foreign_key: true

      t.timestamps null: false
    end
  end
end
