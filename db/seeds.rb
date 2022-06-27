User.create!(
  name: 'Mostafa',
  email: 'mostafa@rails.com',
  password: '123123'
)

User.create!(
  name: 'Reza',
  email: 'reza@rails.com',
  password: '123123'
)

User.create!(
  name: 'Muneeb',
  email: 'muneeb@rails.com',
  password: '123123'
)


Group.create!(
  user: User.first,
  name: 'Bills',
  icon: 'https://images.pexels.com/photos/4025825/pexels-photo-4025825.jpeg?auto=compress&cs=tinysrgb&w=100'
)

Group.create!(
  user: User.first,
  name: 'Food',
  icon: 'https://images.pexels.com/photos/1391487/pexels-photo-1391487.jpeg?auto=compress&cs=tinysrgb&w=100'  
)

Group.create!(
  user: User.first,
  name: 'Transportation',
  icon: 'https://images.pexels.com/photos/210182/pexels-photo-210182.jpeg?auto=compress&cs=tinysrgb&w=100'
)

Group.create!(
  user: User.second,
  name: 'Bills',
  icon: 'https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?auto=compress&cs=tinysrgb&w=100'
)

Payment.create!(
  author: User.first,
  groups: [Group.first],
  name: 'Gas - January',
  amount: 12
)
