class CreateCourses < ActiveRecord::Migration[5.0]
  def change

    create_table :groups do |t|
      t.string :name
      t.string :profile
      t.string :banner
      t.references :user

      t.timestamps
    end
    
    create_table :students do |t|
      t.references :user
      t.references :group

      t.timestamps
    end

    create_table :group_courses do |t|
      t.references :course
      t.references :group

      t.timestamps
    end

    create_table :courses do |t|
      t.string :name
      t.text :content

      t.timestamps
    end

    create_table :course_weeks do |t|
      t.references :week
      t.references :course

      t.timestamps
    end

    create_table :weeks do |t|
      t.string :name
      t.text :content

      t.timestamps
    end


    create_table :week_topics do |t|
      t.references :topic
      t.references :week

      t.timestamps
    end

    create_table :topics do |t|
      t.string :name
      t.date :date
      t.text :content
      t.text :resources

      t.timestamps
    end

  end
end
