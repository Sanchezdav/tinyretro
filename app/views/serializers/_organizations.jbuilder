json.array! organizations do |organization|
  json.partial! 'serializers/organization', organization: organization
end
