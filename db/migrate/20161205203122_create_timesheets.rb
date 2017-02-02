class CreateTimesheets < ActiveRecord::Migration[5.0]
  def change
    create_table :timesheets do |t|
      t.date :from
      t.date :to
      t.references :user
      t.boolean :timesheet_status

      t.timestamps
    end
  end
end
