===== Project Overview =====

Goal: To create a Sinatra-based project management system.

----- Models -----
1. Users
2. Projects
3. Tasks
4. Categories
5. UserTasks
6. UserProjects

*** 1. Users ***

  a)  email
  b)  first_name
  c)  last_name
  d)  password

  has many projects
  has many tasks

*** 2. Projects ***

  a)  name
  b)  description
  c)  status
  d)  project manager
  e)  category

  has many users
  has many tasks

*** 3. Tasks ***

  a)  name
  b)  due date
  c)  project
  d)  category

  belongs to project
  has many users
  has many categories

*** 4. Categories ***

  a)  name
  b)  type (project or task)

  has many projects
  has many tasks

*** 5. TaskUsers ***

  a)  task_id
  b)  user_id

*** 6. UserProjects ***

  a)  user_id
  b)  project_id

*** 7. 

=============================
TODO:
=============================

- Add in Client Model