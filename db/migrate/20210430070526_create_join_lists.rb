class CreateJoinLists < ActiveRecord::Migration[6.0]
  def change
    create_table :join_lists do |t|

      t.timestamps
    end
  end
end
