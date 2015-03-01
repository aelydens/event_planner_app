def create_company(options = {})
  Company.create!({
    name: "Company name",
    size: 4
  }.merge(options))
end
