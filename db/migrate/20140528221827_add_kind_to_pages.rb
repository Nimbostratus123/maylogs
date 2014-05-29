class AddKindToPages < ActiveRecord::Migration
  def change
		add_column :pages, :kind, :string
  end
end
