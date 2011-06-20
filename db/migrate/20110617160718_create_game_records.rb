class CreateGameRecords < ActiveRecord::Migration
  def self.up
    create_table :game_records do |t|
      t.text :game_object

      t.timestamps
    end
  end

  def self.down
    drop_table :game_records
  end
end
