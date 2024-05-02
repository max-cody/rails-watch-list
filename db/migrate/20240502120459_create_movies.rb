# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies, &:timestamps
  end
end
