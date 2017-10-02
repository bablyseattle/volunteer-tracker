# Volunteer Tracker

#### _Epicodus Project_

#### By Bably Kumari

## Description

_A Ruby application that tracks projects and the volunteers working on them. It allow user to create, edit, and delete projects._

## Setup/Installation Requirements

* _Clone directory from github using git_

* __NOTE: These instructions assume you already have Ruby and Sinatra installed.__

### Installing the necessary database:

* _Do you have postgres and psql installed? [Download](https://www.postgresql.org/download/)_

* _In your terminal enter:_ ``` $postgres```

* _Now enter_ ```$psql```

* _Create the needed database by entering_ ```$CREATE DATABASE volunteer_tracker;```

* _Connect to new database by entering_ ```$c\ volunteer_tracker```

* _Enter the following:_

```CREATE TABLE projects (id serial PRIMARY KEY, title varchar);```

_The terminal should echo back CREATE TABLE. Then enter:_

```CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);```

* _In terminal, navigate into main project directory folder_

* _Run:_ ```$ruby app.rb```

* _In web browser of choice copy and paste the following into the address field :_ ```http://localhost:4567/```


## Support and contact details

_Please contact Bably Kumari (mailto:bablyhyd@gmail.com) for questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra
* Postgres

### License

Copyright (c) 2017 **Bably Kumari**

*This software is licensed under the MIT license.*