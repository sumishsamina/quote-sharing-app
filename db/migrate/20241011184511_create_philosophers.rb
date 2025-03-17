class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :fname, null: false
      t.string :lname, null: true
      t.string :birth_year, null: true
      t.string :death_year, null: true
      t.text :biography, null: true

      t.timestamps
    end
  end
end
