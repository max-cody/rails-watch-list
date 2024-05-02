# frozen_string_literal: true

class AddForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :movie_id, :integer
    add_column :bookmarks, :list_id, :integer
    add_foreign_key 'bookmarks', 'lists'
    add_foreign_key 'bookmarks', 'movies'
  end
end
