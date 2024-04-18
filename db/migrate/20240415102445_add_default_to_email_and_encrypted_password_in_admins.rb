class AddDefaultToEmailAndEncryptedPasswordInAdmins < ActiveRecord::Migration[6.1]
  def up
    change_column_default :admins, :email, 'aaa@aaa'
    change_column_default :admins, :encrypted_password, 'aaaaaa'
  end

  def down
    change_column_default :admins, :email, nil
    change_column_default :admins, :encrypted_password, nil
  end
end
