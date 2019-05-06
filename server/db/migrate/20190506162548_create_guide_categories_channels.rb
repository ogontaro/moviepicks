# frozen_string_literal: true

class CreateGuideCategoriesChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_categories_channels do |t|
      t.references :guide_categories, index: true, foreign_key: true
      t.references :channels, index: true, foreign_key: true

      t.timestamps
    end
  end
end
