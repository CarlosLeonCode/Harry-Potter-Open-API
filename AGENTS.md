# AGENTS.md

## Stack
- Single Rails API app.
- Use Ruby `3.1.2` (`.ruby-version`) and Bundler `2.5.22` (`Gemfile.lock`). macOS system Ruby/Bundler fails here before the app boots; switch to the project Ruby first.
- Prefer project binstubs (`bin/rails`, `bin/rake`) once the correct Ruby is active.
- There is no repo-local lint/typecheck toolchain to run; verification is Rails commands plus RSpec.

## Setup
- `bin/setup` is the canonical bootstrap, but it assumes `config/database.yml` already exists. That file is not checked in.
- PostgreSQL is the only DB (`pg` gem; `db/schema.rb` enables `plpgsql`). After schema changes, use `bin/rails db:prepare`.
- Focused test run: `bundle exec rspec spec/path/to/file_spec.rb`.

## Data Loading
- `bundle exec rake hp_data:build` imports `public/data/data.xlsx` into `Genre`, `School`, `SchoolHouse`, `Person`, and `Creature`.
- That importer skips each table if it already has rows, so rerunning it does not refresh existing data.
- `bin/rails db:seed` separately loads `db/seeds/*.rb` in lexical order (`001_...`, `002_...`). Keep filenames ordered if you add new seed files.

## Code Map
- Trust `config/routes.rb` over the README: the README endpoint list is stale.
- API entrypoints live in `app/controllers/api/v1`.
- All JSON rendering goes through `app/controllers/concerns/response.rb`; shared API error handling lives in `app/controllers/concerns/exceptions.rb`.
- Response payloads are defined in `app/serializers/*` with `JSONAPI::Serializer`; controller/model changes often require serializer updates too.
- Scalar docs live at `public/docs/index.html` and load `public/openapi.yaml`; keep that spec in sync with routes, serializers, and shared error responses.
- Current domain models are `School`, `SchoolHouse`, `Genre`, `Person`, and `Creature`. There is no current `Wizard` or `Student` model in `app/models`.

## Gotchas
- "Students" are derived from `Person.students`, which filters the misspelled `ocupation` column. Do not rename or "fix" that spelling without a real migration and data update.
- `config/routes.rb` already marks the nested `people/students` route as broken. If you touch student endpoints, update routes, docs, and specs together.
- Many request/model specs are stale scaffold leftovers or still reference removed `Wizard`/`Student` resources. Validate behavior against routes/models before trusting those specs.
- The only GitHub Actions workflow is a tag-triggered release. It is not a reliable safety net right now: the test step is commented out, and the Postgres service password does not match the workflow `DATABASE_URL` password.
