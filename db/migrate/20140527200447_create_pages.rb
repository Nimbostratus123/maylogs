class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :type
      t.string :content
      t.string :title
      t.integer :user_id

      t.timestamps
    end
		
		add_index :pages, :user_id
		
  end
end
