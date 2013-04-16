json.array! @customers do |customer|
  json.id customer.id
  json.label [customer.tid, customer.name].join(" ")
  json.value [customer.tid, customer.name].join(" ")
  json.tid customer.tid
end

