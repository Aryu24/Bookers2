class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
  	#プロフィール画像カラム、自己紹介を追加
    add_column :users, :introduction, :text
    add_column :users, :profile_image_id, :text
  end
end
