class AddUsernameToPages < ActiveRecord::Migration
  def change
		add_column :pages, :username, :string
  end
end
