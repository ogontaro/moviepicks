# frozen_string_literal: true

class CreateVideoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :video_categories do |t|
      t.string :title, comment: "ビデオカテゴリのタイトル", null: false
      t.string :video_category_id, comment: "ビデオカテゴリID", null: false

      t.timestamps
    end
  end
end
