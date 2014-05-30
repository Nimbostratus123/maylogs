class AddHomeToPagesAgain < ActiveRecord::Migration
  def change
		add_column :pages, :home, :boolean, default: false
  end
end
