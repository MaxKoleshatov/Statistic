class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :title

      t.references :team_1, null: false, foreign_key: { to_table: :teams }
      t.references :team_2, null: false, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
