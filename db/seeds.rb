users = [
  {
    id: 1,
    email: 'eric@ericbaker.me',
    first_name: 'Eric',
    last_name: 'Baker',
    password: 'password'
  },
  {
    id: 2,
    email: 'user@spms.com',
    first_name: 'SPMS',
    last_name: 'User',
    password: 'userpassword'
  }
]

users.each do |user|
  User.create(user)
end

projects = [
  {
    id: 1,
    name: 'First Project',
    description: 'The first project in the SPMS.',
    status: 'Beginning Stages',
    user_id: 2,
    category_id: 1
  },
  {
    id: 2,
    name: 'Sinatra Project Management System',
    description: 'My first screw up with Sinatra...',
    status: 'Planning',
    user_id: 1,
    category_id: 2
  }
]

projects.each do |project|
  Project.create(project)
end

tasks = [
  {
    id: 1,
    name: 'Get Started',
    due_date: '2016-04-28 01:33:48 -0400',
    project_id: 1,
    category_id: 3
  }
]

tasks.each do |task|
  Task.create(task)
end

categories = [
  {
    id: 1,
    name: 'Testing',
    type: 'Project'
  },
  {
    id: 2,
    name: 'Assessment',
    type: 'Project'
  }
]

categories.each do |category|
  Category.create(category)
end