# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create({name: 'Output in Ruby', comment: '"puts" writes to the screen with a carriage return at the end.
"print" does the same thing without the carriage return.
"printf" formats variables like in C and Java 5.'})