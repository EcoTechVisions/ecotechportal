class CreateRequests < ActiveRecord::Migration[5.0]
  
  def change

    create_table :requests do |r|
      r.string :title
      r.text :message
      r.string :directed_to

      r.timestamps
    end

  end

end