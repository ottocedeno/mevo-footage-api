class CreateCameras < ActiveRecord::Migration[6.0]
  def change
    create_table :cameras do |t|
      t.string :model

      t.timestamps
    end
  end
end
