# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(first_name: 'test', email: 'test@example.com', password: 'password')
user.product_lists.create([{ name: 'List 1' }, { name: 'List 2' }, { name: 'List 3' }])


list_1 = ProductList.first
list_1.items.create([{ user: user, name: 'Item 1' }, { user: user, name: 'Item 2' }, { user: user, name: 'Item 3' }])
