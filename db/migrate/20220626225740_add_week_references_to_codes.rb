class AddWeekReferencesToCodes < ActiveRecord::Migration[7.0]
  def change
    add_reference :codes, :week, null: true, foreign_key: true
  end
end
