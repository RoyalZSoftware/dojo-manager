# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

alex = User.create({
    first_name: "Alexander",
    last_name: "Panov",
    pronouns: 'he',
    birth_date: Date.new(2002, 6, 20),
    email: "panov@royalzsoftware.de",
    password: 'test123456',
})

karate = Course.create({
    name: "Karate - Erwachsene"
})

p karate

kickboxing = Course.create({
    name: "Kickboxen"
})

p kickboxing

karate_rel = alex.join_course(karate)
p karate_rel
kickboxing_rel = alex.join_course(kickboxing)
p kickboxing_rel

5.times do |mth|
    karate_rel.log(DateTime.new(2024, mth + 1, 12, 18, 0, 0))
    kickboxing_rel.log(DateTime.new(2024, mth + 1, 12, 19, 0, 0))
    karate_rel.log(DateTime.new(2024, mth + 1, 15, 18, 0, 0))
    karate_rel.log(DateTime.new(2024, mth + 1, 19, 18, 0, 0))
    karate_rel.log(DateTime.new(2024, mth + 1, 22, 18, 0, 0))
end
