# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists, &:timestamps
  end
end
