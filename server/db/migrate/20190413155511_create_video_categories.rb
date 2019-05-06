# frozen_string_literal: true

class CreateVideoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :video_categories do |t|
      t.string :title, comment: "ビデオカテゴリのタイトル"
      t.string :video_category_id, comment: "ビデオカテゴリID"

      t.timestamps
    end
  end
end
