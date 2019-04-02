json.array! @pages do |page|
  json.(page, :url, :content, :links)
end
