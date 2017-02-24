# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ first_name:'Al', last_name:'Delcy', username:'aldelcy', email:'aldelcy@ecotechvisions.com', password:'test1234', password_confirmation:'test1234', role: 0, approved: true},
			 { first_name:'Bob', last_name:'Delcy', username:'bobdelcy', email:'bobdelcy@ecotechvisions.com', password:'test1234', password_confirmation:'test1234', role: 1, approved: true},
			 { first_name:'Jane', last_name:'Delcy', username:'janedelcy', email:'janedelcy@ecotechvisions.com', password:'test1234', password_confirmation:'test1234', role: 2, approved: true}])

Questionnaire.create(title:"Developmental Stage", category:'company')
Question.create([{ question:"Year the Company was founded &amp; Incorporated:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Year Product(s)/service(s) Introduced:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Stage of Formation or Immediate Goals:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Progress of Current Plans:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Past Milestones and Successes: (if applicable)", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Other Developmental Indicators:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"What Type of office equipment, material(s), and/or machinery will be used?", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Will you have special building needs? (i.e. high voltage electricity, soundproofing, water, etc.)", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Will you be using toxic chemicals? If yes, please explain.", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Will you be generating industrial waste? If yes, please explain.", question_type:"text", questionnaire_id: Questionnaire.last.id}])

Questionnaire.create(title:"Job Creation", category:'company')
Question.create([{ question:"Number of Employees at start-up (Not Including Owners/Partners):", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Current Number of Employees (Not Including Owners/Partners):", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Employee Growth Projection from Today:", question_type:"multiple input", questionnaire_id: Questionnaire.last.id}])

Questionnaire.create(title:"Financial Status", category:'company')
Question.create([{ question:"Last Year’s Total Sales:", question_type:"number", questionnaire_id: Questionnaire.last.id},
				 { question:"Last Year’s Total Profit:", question_type:"number", questionnaire_id: Questionnaire.last.id},
				 { question:"Amount of Funds Sought:", question_type:"number", questionnaire_id: Questionnaire.last.id},
				 { question:"Basic Use of Funds Sought:", question_type:"number", questionnaire_id: Questionnaire.last.id}])

Questionnaire.create(title:"Patents and Licenses", category:'company')
Question.create([{ question:"Patents held/pending:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Trademarks held/pending:", question_type:"text", questionnaire_id: Questionnaire.last.id},
				 { question:"Licenses held/pending:", question_type:"text", questionnaire_id: Questionnaire.last.id}])


Course.create(name:"Digital Citizen Bootcamp")
Week.create([{ name:"Week 1: Community"},
			 { name:"Week 2: Tools"},
			 { name:"Week 3: Process"},
			 { name:"Week 4: Present"},
			 { name:"Week 5: Build"},
			 { name:"Week 6: Market"},
			 { name:"Week 7: Social Media"},
			 { name:"Week 8: Pitch"}])

Associations::CourseWeek.create([{ course_id:1, week_id:1},
				   { course_id:1, week_id:2},
				   { course_id:1, week_id:3},
				   { course_id:1, week_id:4},
				   { course_id:1, week_id:5},
				   { course_id:1, week_id:6},
				   { course_id:1, week_id:7},
				   { course_id:1, week_id:8}])

Topic.create([{ name:"Orientation" }, { name:"Official Day 1" }])
Associations::WeekTopic.create([{ topic_id:1, week_id:1}, { topic_id:2, week_id:1}])

Group.create(name:'Cohort 3')
Associations::Student.create([{ group_id:1, user_id:1}])
Associations::GroupCourse.create([{ group_id:1, course_id:1}])

Ticket.create([{title:'Ticket 1', body:'This is a test ticket to test stuff that tickets do'},
			   {title:'Ticket 2', body:'This is a test ticket 2 to test stuff that tickets 2 do'}])
Associations::TicketAssignement.create([{ticket_id:1, user_id:1, role:0},
										{ticket_id:1, user_id:2, role:1},
										{ticket_id:1, user_id:3, role:1, viewed:true},
										{ticket_id:2, user_id:2, role:0},
										{ticket_id:2, user_id:1, role:1}])