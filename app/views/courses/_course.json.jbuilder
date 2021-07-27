json.extract! course, :id, :name, :subtitle, :content, :created_at, :updated_at
json.url course_url(course, format: :json)
