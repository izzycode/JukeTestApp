class CreatePlayQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :play_queues do |t|
      t.integer :length
      t.string :name

      t.timestamps
    end
  end
end
