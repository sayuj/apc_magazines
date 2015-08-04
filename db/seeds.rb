# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(
    email: 'user1@test.com',
    password: 'user1@apc',
    password_confirmation: 'user1@apc'
)
user2 = User.create(
    email: 'user2@test.com',
    password: 'user2@apc',
    password_confirmation: 'user2@apc'
)

magazine1 = Magazine.create(name: 'Magazine1')

magazine1.articles.create(
    [
        {
            title: 'Test article',
            body: 'This is a test article to test this application!',
            author: user1
        },
        {
            title: 'Test article2',
            body: 'This is another test article to test this application! :)',
            author: user2
        },

    ]
)
