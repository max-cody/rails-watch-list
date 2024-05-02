# frozen_string_literal: true

class UpdateTables < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :title, :string
    add_column :movies, :overview, :text
    add_column :movies, :poster_url, :string
    add_column :movies, :rating, :float

    add_column :lists, :name, :string

    add_column :bookmarks, :comment, :text
  end
end
