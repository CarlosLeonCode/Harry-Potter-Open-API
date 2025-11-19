<div align="center">
  
<img width="1024" height="1024" alt="hp" src="https://github.com/user-attachments/assets/adf96291-0086-491c-8741-06832029344d" />

<br /> 

[![railsVersion](https://img.shields.io/badge/Ruby%20on%20Rails-v6.1.4-red?style=for-the-badge)](https://weblog.rubyonrails.org/2021/6/24/Rails-6-1-4-has-been-released/)
[![rubyVersion](https://img.shields.io/badge/Ruby-v2.7.1-red?style=for-the-badge)](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/)
<br/>


<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/CarlosLeonCode/harry_potter_open_api?style=for-the-badge">
<img alt="GitHub Release Date" src="https://img.shields.io/github/release-date/CarlosLeonCode/harry_potter_open_api?style=for-the-badge">
<br /> 

A RESTful OPEN API for Harry Potter World

</div>

<br /> 


# Setup project at local and make contributions 🤓

<details>
<summary>Fork project</summary>

- Fork project in to your personal account and create a new branch with issue name, for example:

> issue_1_new_characters

<br>
</details>

<details>
<summary>Clone project</summary>

- Now you should clone the project from forked version in your account. It'll look like this:

```bash
git clone git@github.com:yourAccount/harry_potter_open_api.git
```

<br>
</details>

<details>
<summary>Local setup</summary>

- Create **database.yml** file setup with your local database configuration. You can use next [guide](https://gist.github.com/CarlosLeonCode/d63118433566714584d7140b0c086c19)

- Install gems

```bash
bundle install
```

- Create the database with the following command in the terminal:

```bash
rails db:create
```

- Run migrations:

```bash
rails db:migrate
```

- Build data run the next command

```bash
rails hp_build:data

```
🙌 Now you can work and make your contribution!

- Run the server

```bash
rails server
# or 
rails s
```

All contributions are welcome: bug fixes, data contributions, recommendations.
<br>
</details>

<br>
<br>

# TO DO 👀

## Models 
- Wizard Professions
- Spells
- Potions

<br>

# 🗒 Documentation

## Endpoints

Path> `harry-potter-open-api-ff4c7a51ed23.herokuapp.com/`

> Schools -> api/v1/schools

> School houses -> api/v1/school_houses

> School house -> api/v1/school_houses/1

> Characters -> api/v1/people

> Character -> api/v1/people/1

> Students -> api/v1/people/students

> Creatures -> api/v1/creatures

> Creature -> api/v1/creatures/1


<br>

# 👏 Credits

Many thanks to:

- [Harry Potter Wiki](https://harrypotter.fandom.com/wiki/Main_Page) for all the information published about Harry Potter World.
- [Wizards Unite Hub](https://wizardsunitehub.info/database/) for resources published.
- [Szokekiss Marton](https://www.deviantart.com/szokekissmarton/gallery/61235899/all-fantastic-beasts-from-the-original-book) for the illustrations of the creatures.

<br>

## 📃 License

This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
