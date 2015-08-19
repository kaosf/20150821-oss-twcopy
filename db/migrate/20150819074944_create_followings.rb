class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :from_user, index: true, foreign_key: true, null: false
      t.references :to_user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
