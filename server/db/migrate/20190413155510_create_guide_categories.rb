# frozen_string_literal: true

class CreateGuideCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_categories do |t|
      t.string :title, comment: "ガイドカテゴリのタイトル", null: false
      t.string :guide_category_id, comment: "ガイドカテゴリID", null: false
      t.string :channel_id, comment: "ガイドカテゴリ用チャンネルID", null: false

      t.timestamps
    end
  end
end
