json.extract! product_item, :id, :product_list_id, :user_id, :name, :slug, :status, :position, :category, :created_at, :updated_at
json.url product_item_url(product_item, format: :json)
