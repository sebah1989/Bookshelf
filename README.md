### Usage

#### PostgreSQL setup

Connect to database using your Superuser role (ex. 'postgres')

```bash
  $ psql -U postgres
```

Create user and setup password

```
  postgres=# CREATE USER sebastian WITH PASSWORD 'seba';
```

Create development database and assign its owner

```
  postgres=# CREATE DATABASE bookshelf_development WITH OWNER sebastian;
```

Create test database and assign its owner

```
  postgres=# CREATE DATABASE bookshelf_test WITH OWNER sebastian;
```

Run migrations:

```bash
  $ rake db:migrate
```

Your database should already be configured. You're now ready to run application.

#### Secret Token

1. `$ rake secret`

2. Rename file .env.example to .env and enter your Secret Token
