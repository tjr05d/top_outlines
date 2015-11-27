json.array!(@outlines) do |outline|
  json.extract! outline, :id, :title, :description, :course_id, :user_id
  json.url outline_url(outline, format: :json)
end
