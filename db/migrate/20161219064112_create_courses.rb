class CreateCourses < ActiveRecord::Migration[5.0]
  def change

    create_table :cohorts do |c|
      c.string :name
      c.date :time_period

      c.timestamps
    end

    create_table :cohort_groups do |cc|
      cc.references :cohort
      cc.references :group

      cc.timestamps
    end

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

    create_table :course_topics do |ct|
      ct.references :topic
      ct.references :course

      ct.timestamps
    end

    create_table :topics do |t|
      t.string :name

      t.timestamps
    end

    create_table :topic_lessons do |tl|
      tl.references :topic
      tl.references :lesson

      tl.timestamps
    end

    create_table :lessons do |l|
      l.string :name

      l.timestamps
    end

    create_table :weeks do |w|

      w.timestamps
    end

  end
end
