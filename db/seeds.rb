User.create!(
	email: "test@test.com",
	password: "testtest",
	password_confirmation: "testtest",
	username: "Foobar",
)

User.create!(
	email: "test1@test.com",
	password: "testtest",
	password_confirmation: "testtest",
	username: "JohnDoe"
)

User.create!(
	email: "test2@test.com",
	password: "testtest",
	password_confirmation: "testtest",
	username: "BigBoy"
)

8.times do |blog|
	Blog.create!(
		title: "My blog post #{blog + 1}",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sollicitudin velit facilisis elementum sagittis. Ut lacinia sed magna vitae molestie. Nunc velit odio, sagittis vitae tincidunt ac, convallis vitae metus. Ut elementum pharetra quam. Aenean vestibulum risus metus, pellentesque dictum orci accumsan ut. Sed a blandit nisi. Cras in rutrum sem. Integer rutrum vitae libero ut aliquet. Nullam nec feugiat sapien. Nulla pharetra rhoncus orci. Sed vitae nisi ex.

		Nullam ut consequat quam. In commodo, neque at varius vulputate, lorem lectus rutrum ex, quis scelerisque odio erat vel risus. Nunc malesuada dictum mauris ut pellentesque. Nunc sed vulputate ante, eu bibendum neque. Curabitur eleifend ligula neque, sit amet dignissim ex cursus ac. Duis posuere magna at odio viverra tincidunt. Etiam consectetur augue eget lorem facilisis commodo. Donec scelerisque nulla a tellus vulputate varius. Ut commodo enim a porta sollicitudin. Vestibulum eget magna tincidunt, tempor nisi a, dignissim augue.

		Proin nisi lectus, elementum id consequat congue, pulvinar sed elit. Suspendisse venenatis laoreet nibh ut tincidunt. Mauris et consequat ex, cursus bibendum libero. Suspendisse in sem purus. Praesent fringilla, dolor et pulvinar lacinia, sapien eros tempus quam, ac pellentesque tellus diam nec nisi. Proin fermentum velit elit, eget scelerisque tellus lobortis ac. Pellentesque malesuada scelerisque tristique. Pellentesque lacinia odio ut mi fringilla, quis lobortis leo suscipit. Cras semper diam eget tellus placerat hendrerit a vitae urna. Phasellus quam risus, condimentum vitae sagittis vel, finibus id lacus. Quisque dignissim tristique nisi, vitae semper metus mattis at. Ut at dolor sit amet tellus cursus rhoncus. Fusce cursus massa at augue luctus consequat. Aliquam vitae ex felis. Pellentesque finibus bibendum malesuada. Fusce vel mollis erat.",
		private: false,
		main_image: Placeholder.image_generator(600, 400),
		thumb_image: Placeholder.image_generator(350, 200)
	)
end

Role.create!(
	user_id: User.first.id,
	description: "owner",
	blog_id: Blog.first.id
)

Role.create!(
	user_id: User.find(2).id,
	description: "owner",
	blog_id: Blog.find(2).id
)

6.times do |blog|
	Role.create!(
		user_id: User.find_by_id(3).id,
		blog_id: Blog.find_by_id(blog + 3).id,
		description: "owner"
	)
end