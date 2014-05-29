class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :kind
      t.string :content
      t.string :title
      t.integer :user_id
			t.integer :order

      t.timestamps
    end
		
		add_index :pages, :user_id
		
  end
end
