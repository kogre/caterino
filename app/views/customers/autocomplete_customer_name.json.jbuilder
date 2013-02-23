json.array! @customers do |customer|
  json.id customer.id
  json.label customer.name
  json.value customer.name
  json.tid customer.tid
end

