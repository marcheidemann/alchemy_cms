class CreateAlchemyContainers < ActiveRecord::Migration
  def change
    create_table :alchemy_containers do |t|
      t.string :name
      t.integer :page_id
      t.integer :cell_id
      t.integer :position
      t.boolean :folded, :default => false
      t.boolean :public, :default => true

      t.timestamps
      t.userstamps
    end
    add_index :alchemy_containers, :page_id, :unique => true
  end
end
