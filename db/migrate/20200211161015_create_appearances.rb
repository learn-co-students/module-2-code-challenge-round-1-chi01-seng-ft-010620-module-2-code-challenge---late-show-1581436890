class CreateAppearances < ActiveRecord::Migration[5.1]
  def change
    create_table :appearances do |t|
      t.integer :guest_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
