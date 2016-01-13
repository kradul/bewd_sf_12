puts 'Adding seed stories...'
story1 = Story.create title: "Open-plan offices make employees less productive, less happy, and more sick",
             link: 'http://qz.com/85400/moving-to-open-plan-offices-makes-employees-less-productive-less-happy-and-more-likely-to-get-sick/#',
             upvotes: 1

story2 = Story.create title: 'ydiff: Structural Comparison of Programs',
             link: 'http://yinwang0.wordpress.com/2012/01/03/ydiff/',
             upvotes: 1

story3 = Story.create title: 'I Built This AK-47. It\'s Legal and Totally Untraceable.',
             link: 'http://www.motherjones.com/politics/2013/05/ak-47-semi-automatic-rifle-building-party',
             upvotes: 1

puts 'Done adding stories'

puts 'Adding seed categories...'

productivity = Category.create title: "Productivity"
politics = Category.create title: "Politics"
office = Category.create title: "Office"
business = Category.create title: "Business"
dev = Category.create title: "Dev"

puts 'Done adding categories'

puts 'Adding category/story connections'

story1.categories = [productivity, business, office]
story1.save()

story2.categories = [politics]
story2.save()

story3.categories = [productivity, dev]
story3.save()

puts 'Done adding category/story connections'



