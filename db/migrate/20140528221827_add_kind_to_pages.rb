class AddKindToPages < ActiveRecord::Migration
  def change
		add_column :pages, :kind, :string unless Page.new.respond_to?(:kind)
  end
end
