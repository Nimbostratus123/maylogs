class RemoveHomeFromPages < ActiveRecord::Migration
  def change
		remove_column :pages, :home
	end
end
