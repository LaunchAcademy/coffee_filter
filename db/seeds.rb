# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: "Caleb", last_name: "thill", email: "calebnthill@gmail.com", password: "testblahhh")

Shop.create({name: 'Wierd puppy', address: '250 Newbury St, Boston, MA 02116',
           description: 'Great fun hangout place for an early morning study session!', user: user})

Shop.create({name: 'Thinking Cup', address: '165 Tremont St, Boston, MA 02111',
           description: 'Amazing iced coffee and great baked goods. No WIFI though!', user: user})

Shop.create({name: 'Flat Black Coffee', address: '50 Broad St, Boston, MA 02109',
           description: 'Fun little coffee shop!', user: user})

Shop.create({name: 'Render Coffee', address: '563 Columbus Ave, Boston, MA 02118',
           description: 'Great coffe and sandwiches! In the back of the shop, there is a room that has a domed glass roof! super cool!', user: user})

Shop.create({name: "Polcari's coffee", address: '105 Salem St, Boston, MA 02113',
           description: 'Great fun hangout place for an early morning study session!', user: user})

Shop.create({name: 'Capitol Coffee House', address: '122 Bowdoin St, Boston, MA 02108',
           description: 'Super cute coffee shop! The coffee is great as well as the food!', user: user})

Shop.create({name: 'Caffe Vittoria', address: '290 Hanover St, Boston, MA 02113',
           description: 'Amazing little coffee shop in the heart of the north end!', user: user})

Shop.create({name: 'Pavement Coffeehouse', address: '1096 Boylston St, Boston, MA 02215',
           description: 'Rustic, cozy joint with tall ceilings & leather banquettes serving artisan coffee, teas & bagels.', user: user})

Shop.create({name: 'Caffe Paradiso', address: '255 Hanover St, Boston, MA 02113',
           description: 'Locals head to this traditional Italian coffeehouse for espresso, gelato, pastries & socializing.', user: user})

Shop.create({name: 'Equal Exchange Cafe', address: '226 Causeway St, Boston, MA 02114',
           description: 'Cozy coffee shop bringing together drinks sourced from a local co-op & a veggie-heavy food menu.', user: user})

Shop.create({name: '1369 Coffeehouse', address: '757 Massachusetts Ave, Cambridge, MA 02139',
           description: 'Top-notch coffee & sandwiches draw local creative types to this coffeeshop featuring a gallery!!', user: user})

Shop.create({name: 'Crema Cafe', address: '27 Brattle St, Cambridge, MA 02138',
           description: 'Super cool coffee shop in the heart of Harvard square! NO WIFI!', user: user})


