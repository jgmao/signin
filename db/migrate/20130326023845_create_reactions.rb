class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.string :name
      t.string :reactionTransform
      t.string :products
      t.string :conditions
      t.integer :synCount
      t.string :doi
      t.string :user

      t.timestamps
    end
  end
end
