class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :username
      t.text :content
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
