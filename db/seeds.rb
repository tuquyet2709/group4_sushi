# Admin.create!(email: "admin@gmail.com",
#              password:              "123456",
#              password_confirmation: "123456")
program_languages = ["C", "C++", "Java", "Ruby", "Python", "Javascript",
                     "Nodejs", "R", "PHP"]

10.times do |n|
  email = "student-#{n+1}@gmail.com"
  name = "student-#{n+1}"
  password = "123456"
  phone = (0...9).map { rand(10)}.join
  age = "1#{n}"
  school = "school-#{n+1}"
  program_language = program_languages.sample(1 + rand(program_languages.count)).join(", ")
  pr_content = "I'm a good student, hire me!"
  avg_score = rand(5) + 1
  Student.create!(email: email,
                  name: name,
                  password:              password,
                  password_confirmation: password,
                  phone: phone,
                  age: age,
                  program_language: program_language,
                  pr_content: pr_content,
                  avg_score: avg_score
                )
end

addresses = ["Ha noi", "Ho Chi Minh", "Tokyo", "Saitama", "Osaka"]
10.times do |n|
  email = "company-#{n+1}@gmail.com"
  name = "company-#{n+1}"
  password = "123456"
  address = addresses.sample
  pr_content = "Our company have mission to bring future to the world"
  phone = (0...9).map { rand(10)}.join
  Company.create!(email: email,
                  name: name,
                  password:              password,
                  password_confirmation: password,
                  address: address,
                  pr_content: pr_content,
                  phone: phone
  )
end

work_titles = ["Java Devoloper", "AI engineer", "Backend Developer", "Fontend Developer",
               "Bussiness Analytic", "Chef", "Senior PHP Developer", "Ruby & Rails Developer",
               "Senior Data Scientist", "AI R&D", "Senior Blockchain Developer"]

40.times do |n|
  company_id = rand(10) + 1
  title = work_titles.sample
  dateline = rand(1.year.ago..Time.now).to_date
  salary = rand(1000..3000)/100*100
  tag = "Rails"
  work_location = addresses.sample
  content = "Work content"
  status = true
  process_status = true
  Work.create!(company_id: company_id,
               title: title,
               dateline: dateline,
               salary: salary,
               tag: tag,
               work_location: work_location,
               content: content,
               status: status,
               process_status: process_status)
end

40.times do |n|
  process_status = rand(2)
  work_id = rand(40) + 1
  student_id = rand(10) + 1
  StudentWorkStatus.create!(process_status: process_status,
                            work_id: work_id,
                            student_id: student_id)
end

40.times do |n|
  company_id = rand(10) + 1
  student_id = rand(10) + 1
  work_id = rand(40) + 1
  score = rand(5) + 1
  StudentRating.create!(company_id: company_id,
                         student_id: student_id,
                         work_id: work_id,
                         score: score)
end