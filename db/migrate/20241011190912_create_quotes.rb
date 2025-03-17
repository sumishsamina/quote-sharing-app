class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :quote_text, null: false
      t.string :quote_year, null: true
      t.text :quote_comment, null: true
      t.boolean :ispublic, default: false
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
