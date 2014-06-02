class ChangePagesContentToText < ActiveRecord::Migration
  def change
  	change_column :pages, :content, :text, limit: nil
  end
end
