class RemoveDefaultFromEmailAndEncryptedPasswordInAdmins < ActiveRecord::Migration[6.1]
  def change
    change_column_default :admins, :email, nil
    change_column_default :admins, :encrypted_password, nil
  end
end
