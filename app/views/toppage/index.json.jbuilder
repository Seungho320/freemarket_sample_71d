json.array! @categories do |category|
  json.id category.id
  json.name category.name
  json.sub category.sub
  json.sub_sub category.sub_sub
end 