class CreateCourses < ActiveRecord::Migration[5.0]
  def change

    create_table :groups do |c|
      c.string :name
      c.string :profile
      c.string :banner

      c.timestamps
    end
    
    create_table :students do |s|
      s.references :user
      s.references :group

      s.timestamps
    end

    create_table :group_courses do |cc|
      cc.references :course
      cc.references :group

      cc.timestamps
    end

    create_table :courses do |v|
      v.string :name

      v.timestamps
    end

    create_table :course_weeks do |ct|
      ct.references :week
      ct.references :course

      ct.timestamps
    end

    create_table :weeks do |w|
      w.string :name

      w.timestamps
    end


    create_table :week_topics do |tl|
      tl.references :topic
      tl.references :week

      tl.timestamps
    end

    create_table :topics do |t|
      t.string :name
      t.date :date

      t.timestamps
    end

  end
end
