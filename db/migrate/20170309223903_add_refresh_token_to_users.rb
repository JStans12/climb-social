class AddRefreshTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore'
    add_column :users, :refresh_token, :hstore, default: '', null: false
  end
end
