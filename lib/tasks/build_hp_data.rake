# frozen_string_literal: true

namespace :hp_data do

  FILE_PATH = "#{Rails.root}/public/data/data.xlsx"
  OUT = {
    ok: ':entity created 🤓',
    err: ':entity already exist 😅'
  }

  desc "Build database information"
  task build: :environment do
    @workbook = RubyXL::Parser.parse(FILE_PATH)
  
    create_genres
    create_schools
    create_school_houses
    create_people
    create_creatures
  end

  def get_worksheet(name)
    @workbook[name]
  end

  def get_cols_rows(worksheet)
    {
      cols: worksheet.sheet_data[0].size,
      rows: worksheet.sheet_data.size
    }
  end

  def transaction 
    ActiveRecord::Base.transaction { yield }
  end

  def column_is_foreign_ref?(col_name, foreigns)
    foreigns.each do |i|
      values = i.split('@')
      reference, attribute = values.first, values.second
      
      if col_name.include? reference
        return {
          status:     true,
          table_name: reference.pluralize,
          attribute:  attribute
        } 
      end
    end
    return { status: false }
  end

  def fetch_foreign_ref(table_name:, attribute:, condition:)
    query = "SELECT id FROM #{ table_name } WHERE #{ attribute } LIKE '%#{ condition }%' LIMIT 1"
    response = ActiveRecord::Base.connection.execute(query)

    return response.values.first.first if response.values.size > 0
    raise Errors::DataBuilder.new("Row with value #{ condition } at column #{ table_name.singularize }_id does not have a valid reference value.")
  end

  def row_skeleton(cols:, worksheet:, keys:, foreigns:)
    row = Hash.new

    cols.times do |ind|
      col_name = keys[ind].value

      unless foreigns.nil?
        res = column_is_foreign_ref?(col_name, foreigns)

        if(res[:status])
          unless(worksheet[ind].nil?)
            value = fetch_foreign_ref(
                      table_name: res[:table_name], 
                      condition:  worksheet[ind].nil? ? nil : worksheet[ind].value,
                      attribute:  res[:attribute]
                    )
          else
            value = nil
          end
        else
          value = worksheet[ind].nil? ? '' : worksheet[ind].value
        end
      else
        value = worksheet[ind].nil? ? '' : worksheet[ind].value
      end

      row[col_name] = value
    end
    row
  end

  def build_group_of_data(cols_rows, worksheet, foreigns = nil)
    data = Array.new
    first_row_keys = worksheet[0]

    cols_rows[:rows].times do |ind| 
      next if ind == 0

      row = worksheet[ind]
      next if row.nil?

      is_empty_row = row.cells.all? do |cell| 
        cell.nil? || cell.value.to_s.strip.empty?
      end

      next if is_empty_row

      data.push row_skeleton(
        cols:       cols_rows[:cols], 
        worksheet:  row, 
        keys:       first_row_keys,
        foreigns:   foreigns
      )
    end 
    data
  end

  # --

  def create_genres
    worksheet = get_worksheet 'genres'
    cols_rows = get_cols_rows worksheet

    is_empty = transaction { Genre.all.empty? }

    if is_empty
      data = build_group_of_data(cols_rows, worksheet)
      
      transaction { Genre.create! data }

      puts OUT[:ok].gsub(':entity', "Genres with #{data.size} records were")
    else 
      puts OUT[:err].gsub(':entity', 'Genres')
    end

  end

  def create_schools
    worksheet = get_worksheet 'schools'
    cols_rows = get_cols_rows worksheet

    is_empty = transaction { School.all.empty? }
    
    if is_empty
      data = build_group_of_data(cols_rows, worksheet)
      transaction { School.create! data }

      puts OUT[:ok].gsub(':entity', "Schools with #{data.size} records were")
    else 
      puts OUT[:err].gsub(':entity', 'Schools')
    end
  end

  def create_school_houses
    worksheet = get_worksheet 'school_houses'
    cols_rows = get_cols_rows worksheet

    is_empty = transaction { SchoolHouse.all.empty? }

    if is_empty
      data = build_group_of_data(cols_rows, worksheet, ['school@name'])
      transaction { SchoolHouse.create! data }
      
      puts OUT[:ok].gsub(':entity', "School houses with #{data.size} records were")
    else 
      puts OUT[:err].gsub(':entity', 'School houses')
    end
  end

  def create_people 
    worksheet = get_worksheet 'people'
    cols_rows = get_cols_rows worksheet

    is_empty = transaction { Person.all.empty? }

    if is_empty
      data = build_group_of_data(cols_rows, worksheet, ['genre@name', 'school_house@name'])
      
      transaction { Person.create! data }
      
      puts OUT[:ok].gsub(':entity', "People with #{data.size} records were")
    else 
      puts OUT[:err].gsub(':entity', 'People')
    end
  end

  def create_creatures
    worksheet = get_worksheet 'creatures'
    cols_rows = get_cols_rows worksheet

    is_empty = transaction { Creature.all.empty? }

    if is_empty
      data = build_group_of_data(cols_rows, worksheet)
      
      transaction { Creature.create! data }
      
      puts OUT[:ok].gsub(':entity', "Creatures with #{data.size} records were")
    else 
      puts OUT[:err].gsub(':entity', 'Creatures')
    end
  end

end
