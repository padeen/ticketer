unless User.exists?(email: "admin@example.com")
  User.create!(email: "admin@example.com", password: "password123", admin: true)
end