class CreateRenameUserIdToAuthorIdInComments < ActiveRecord::Migration[7.1]
  def change
    create_table :rename_user_id_to_author_id_in_comments do |t|
      rename_column :comments, :user_id, :author_id
      t.timestamps
    end
  end
end
