class AddHomeToPages < ActiveRecord::Migration
  def change
		add_column :pages, :home, :boolean, default: true
  end
end
