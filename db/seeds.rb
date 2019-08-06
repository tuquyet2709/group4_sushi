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

15.times do |n|