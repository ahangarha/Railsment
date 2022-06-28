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
  name: 'Gas - November 2021',
  amount: 12,
  created_at: '2021-12-15 19:57:12'
)

Payment.create!(
  author: User.first,
  groups: [Group.first],
  name: 'Electrcity - January',
  amount: 23.3,
  created_at: '2022-02-21 13:11:57'
)

Payment.create!(
  author: User.first,
  groups: [Group.first],
  name: 'Gas - March',
  amount: 8.5,
  created_at: '2022-04-10 08:10:32'
)
