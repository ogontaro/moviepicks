# frozen_string_literal: true

class CreateVideoCategoriesVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :video_categories_videos do |t|
      t.references :video_categories, index: true, foreign_key: true
      t.references :videos, index: true, foreign_key: true

      t.timestamps
    end
  end
end
