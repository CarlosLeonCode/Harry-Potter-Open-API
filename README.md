<div align="center">

<img width="400" height="400" alt="hp-open-api" src="https://github.com/user-attachments/assets/b3fe247d-b64f-4e29-a4d3-38169d6a3e22" />

<br /> 

![railsVersion](https://img.shields.io/badge/Ruby%20on%20Rails-v7.2.2-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![rubyVersion](https://img.shields.io/badge/Ruby-v2.1.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
<br/>

<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/CarlosLeonCode/harry_potter_open_api?style=for-the-badge&color=blueviolet">
<img alt="GitHub Release Date" src="https://img.shields.io/github/release-date/CarlosLeonCode/harry_potter_open_api?style=for-the-badge&color=blueviolet">

<br />
<br />

# ⚡ Harry Potter Open API

**A RESTful OPEN API for the Wizarding World.**  
Access data about characters, creatures, schools, and houses through a simple JSON interface.

[View Documentation](#-documentation) • [Report Bug](https://github.com/CarlosLeonCode/harry_potter_open_api/issues) • [Request Feature](https://github.com/CarlosLeonCode/harry_potter_open_api/issues)

</div>

---

# 📜 Documentation

### Base URL
```http
https://harry-potter-open-api-ff4c7a51ed23.herokuapp.com
```

### Endpoints

| Resource | Method | Endpoint | Description |
| :--- | :---: | :--- | :--- |
| **Schools** | `GET` | `/api/v1/schools` | List all wizarding schools |
| **Houses** | `GET` | `/api/v1/school_houses` | List all school houses |
| **House Details** | `GET` | `/api/v1/school_houses/:id` | Get a specific house by ID |
| **Characters** | `GET` | `/api/v1/people` | List all characters |
| **Character Details** | `GET` | `/api/v1/people/:id` | Get a specific character by ID |
| **Students** | `GET` | `/api/v1/people/students` | List only students |
| **Creatures** | `GET` | `/api/v1/creatures` | List all magical creatures |
| **Creature Details** | `GET` | `/api/v1/creatures/:id` | Get a specific creature by ID |

<br />

# 🧙‍♂️ Contributing & Local Setup

We welcome all contributions: bug fixes, data contributions, and magical recommendations!

<details>
<summary><b>1. Fork & Clone</b></summary>
<br>

First, fork the project to your personal account. Then clone it:

```bash
git clone git@github.com:yourAccount/harry_potter_open_api.git
cd harry_potter_open_api
```
</details>

<details>
<summary><b>2. Dependencies & Database</b></summary>
<br>

Make sure you have the correct Ruby and Rails versions installed.

1. **Configure Database:**  
   Create a `config/database.yml` file with your local settings.  
   [Use this guide for reference](https://gist.github.com/CarlosLeonCode/d63118433566714584d7140b0c086c19).

2. **Install Gems:**
   ```bash
   bundle install
   ```

3. **Setup Database:**
   ```bash
   rails db:create
   rails db:migrate
   ```
</details>

<details>
<summary><b>3. Import Magical Data (Seeding)</b></summary>
<br>

Populate your local database using the custom Excel importer task:

```bash
bundle exec rake hp_data:build
```
> *Note: This parses the `data.xlsx` file and populates tables ensuring no duplicates.*
</details>

<details>
<summary><b>4. Run the Server</b></summary>
<br>

```bash
rails s
```
Access the API at `http://localhost:3000/api/v1/...`

</details>

<br>

# 🔮 Roadmap / TO DO

- [ ] Add **Wizard Professions** model
- [ ] Add **Spells** model
- [ ] Add **Potions** model
- [ ] Add filtering and pagination

<br>

# 👏 Credits

Special thanks to these resources for keeping the magic alive:

*   **[Harry Potter Wiki](https://harrypotter.fandom.com/wiki/Main_Page)** - For the lore and information.
*   **[Wizards Unite Hub](https://wizardsunitehub.info/database/)** - For database resources.
*   **[Szokekiss Marton](https://www.deviantart.com/szokekissmarton/gallery/61235899/all-fantastic-beasts-from-the-original-book)** - For the amazing creature illustrations.

<br>

# 📃 License

This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
