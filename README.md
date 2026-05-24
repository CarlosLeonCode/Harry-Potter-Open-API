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

[View Documentation](https://harry-potter-open-api-ff4c7a51ed23.herokuapp.com/docs) • [Report Bug](https://github.com/CarlosLeonCode/harry_potter_open_api/issues) • [Request Feature](https://github.com/CarlosLeonCode/harry_potter_open_api/issues)

</div>

---

# 📜 Documentation

### Base URL
```http
https://harry-potter-open-api-ff4c7a51ed23.herokuapp.com
```

### Interactive Reference

- Browse the API in Scalar at [`/docs`](https://harry-potter-open-api-ff4c7a51ed23.herokuapp.com/docs).
- The OpenAPI source served by the app is available at [`/openapi.yaml`](https://harry-potter-open-api-ff4c7a51ed23.herokuapp.com/openapi.yaml).
- The checked-in OpenAPI file is now the documentation source of truth, alongside `config/routes.rb`.
- Student routes are intentionally excluded from the current docs because the nested route is marked broken in `config/routes.rb` and there is no matching `StudentsController` implementation in `app/controllers/api/v1`.

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

Docs are available locally at `http://localhost:3000/docs`.

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

# ☕ Support My Work

If this project bring you value, you can support me here:

[![☕ Support on Ko-fi](https://img.shields.io/badge/Support%20My%20Work%20on%20Ko--fi-FF5E5B?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/carlosleoncode)
