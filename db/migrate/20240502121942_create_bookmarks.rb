# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks, &:timestamps
  end
end
