class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :from_user, index: true, foreign_key: true
      t.references :to_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
