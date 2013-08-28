# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
courses = Course.all
courses.each do |e|
	e.destroy
end
course = Course.create({name: 'Output in Ruby', comment: '* "puts" writes to the screen with a carriage return at the end.
* "print" does the same thing without the carriage return.
* "printf" formats variables like in C and Java 5.
* * *'
})
course.codes.create({content: '`puts "hi ruby"`', finished: false})
course.codes.create({content: '`print "hi ruby"`', finished: false})

course = Course.create({name: "Functions", comment: "1.Our first Ruby function"})
course.codes.create({content: "`def welcome(name)`", finished: false, comment: ""})
course.codes.create({content: "`puts 'howdy'`", finished: false, comment: "# inside double quotes, #{ } will evaluate the variable"})
course.codes.create({content: "`end`", finished: false, comment: ""})
course.codes.create({content: "`welcome('nana')`", finished: false, comment: "# traditional parens"})