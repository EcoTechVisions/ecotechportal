class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |c|
      c.string :approved
      
      c.string :name
      c.references :user
      
      c.string :address_1
      c.string :address_2
      c.string :city
      c.string :state
      c.string :country
      c.string :zipcode
      
      c.string :phone_number
      c.string :email
      c.string :website

      c.string :legal
      c.string :dba
      c.string :brand
      c.string :subsidiaries


      c.string :chairman
      c.string :president
      c.string :ceo
      c.string :cfo
      c.string :coo
      c.string :num_members
      # OWNERS???
      
      # c.date :founded
      # c.date :year_prd_introduced
      # c.text :stage
      # c.text :progress
      # c.text :milestones
      # c.text :dev_indicators
      # c.text :dev_indicators

      c.string :industry
      c.string :category
      c.string :subcategory, array: true
      c.string :tags, array: true
      c.string :slug
      c.string :refnumber, unique: true
      c.string :privacy
      
      c.string :avatar
      c.string :banner
      c.string :theme_1
      c.string :theme_2

      c.timestamps
    end

    add_index :companies, :tags, using: 'gin'



    create_table :questionnaires do |q|
      q.string :title
      q.string :category

      q.timestamps
    end

    create_table :questions do |q|
      q.string :question
      q.string :question_type
      q.references :questionnaire

      q.timestamps
    end

    create_table :answers do |a|
      a.string :answer
      a.references :question
      a.references :company

      a.timestamps
    end





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
