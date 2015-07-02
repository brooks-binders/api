class CreateLinksJoinTable < ActiveRecord::Migration
  def change
    create_join_table :links, :binders do |t|
      # t.index [:link_id, :binder_id]
      t.index [:binder_id, :link_id], unique: true
    end
  end
end
