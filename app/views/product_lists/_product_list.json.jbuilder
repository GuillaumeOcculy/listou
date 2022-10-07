json.extract! product_list, :id, :user_id, :name, :slug, :favorited, :created_at, :updated_at
json.url product_list_url(product_list, format: :json)
