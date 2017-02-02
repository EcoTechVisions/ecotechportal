class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |c|
  		c.string :name
  		c.integer :owner_id, index: true, foreign_key: :user_id
  		c.string :approved

      c.timestamps
    end

    create_table :profiles do |p|
      p.references :profileable
      p.date :founded
  		p.string :skills
  		p.string :languages
  		p.string :about
  		p.text :bio

  		p.string :avatar
  		p.string :banner
  		p.string :theme_1
  		p.string :theme_2

  		p.string :email
  		p.string :phone_number
  		p.string :website

  		p.string :address_1
  		p.string :address_2
  		p.string :city
  		p.string :state
  		p.string :country
  		p.string :zipcode

  		p.string :industry
  		p.string :category
  		p.string :subcategory, array: true
  		p.string :slug
  		p.string :tags, array: true
  		p.string :refnumber, unique: true
  		p.string :privacy

      p.timestamps
    end

    add_index :profiles, :tags, using: 'gin'

    create_table :members do |m|
      m.references :company
      m.references :user
      m.string :user_role
      m.boolean :approved

      m.timestamps
    end

    create_table :socials do |s|
      s.references :socialable, polymorphic: true, index: true
      s.integer :social_media
  	  s.string :social_link
      
      s.timestamps
    end

    create_table :favorites do |f|
      f.references :favorable, polymorphic: true, index: true
      f.references :user

      f.timestamps
    end
    
  end
end
