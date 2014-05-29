class RemoveOrderFromPages < ActiveRecord::Migration
  def change
		remove_column :pages, :order
  end
end
