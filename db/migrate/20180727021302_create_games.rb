class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :code
      t.string :state
      t.timestamps
    end
  end
end
