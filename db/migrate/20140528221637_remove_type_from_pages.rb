class RemoveTypeFromPages < ActiveRecord::Migration
  def change
		remove_column :pages, :type if Page.new.respond_to?(:type)
  end
end
