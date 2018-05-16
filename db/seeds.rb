
User.create(username: "Rob", email: "rob@mail.com", password: "billbill")
User.create(username: "Bill", email: "bill@mail.com", password: "billbill")
User.create(username: "Mara", email: "mara@mail.com", password: "maramara")
User.create(username: "Kenya", email: "kenya@mail.com", password: "kenyakenya")

Thing.create(date: "Monday", title: "Collected signatures", description: "Cynthia is running for office", user_id: 1)
Thing.create(date: "Tuesday", title: "Worked at food coop", description: "sustainable food", user_id: 1)
Thing.create(date: "Wednesday", title: "Went to rally downtown", description: "Against gun violence", user_id: 2)
Thing.create(date: "Thursday", title: "helped neighbor", description: "He's getting older, needed some gardening help", user_id: 2)
Thing.create(date: "Friday", title: "collected some funds for a neighbor", description: "Her husband's in the hospital", user_id: 3)
Thing.create(date: "Saturday", title: "Planning meeting", description: "all about elections", user_id: 3)

Future.create(title: "Attend March", user_id: "1")
Future.create(title: "Learn more about gun issue", user_id: "1")
Future.create(title: "Neighborhood cleanup next week", user_id: "2")
Future.create(title: "support local shops", user_id: "2")
Future.create(title: "Vote next Tuesday", user_id: "3")
Future.create(title: "Drop off food at food pantry", user_id: "3")





