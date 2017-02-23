class CreateRequests < ActiveRecord::Migration[5.0]
  
  def change

    create_table :tickets do |t|
      t.string :title
      t.text :message
      t.string :directed_to

      t.timestamps
    end

    create_table :ticket_assignements do |t|
      t.references :ticket
      t.references :user

      t.timestamps
    end

    create_table :jobs do |t|
      t.string :title
      t.text :message
      t.string :link
      t.string :contact
      t.string :contact_email
      t.string :rate
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    create_table :events do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :cost
      t.string :image
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    create_table :event_connection do |t|
      t.references :eventable, polymorphic: true, index: true
      t.references :event

      t.timestamps
    end

    create_table :posts do |t|
      t.references :postable
      t.string :title
      t.text :body

      t.timestamps
    end

    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.references :user
      t.text :body

      t.timestamps
    end


  end

end