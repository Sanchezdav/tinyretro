json.id organization.id
json.name organization.name
json.description organization.description
json.slug organization.slug
json.url organization_path(organization)
json.teams organization.teams do |team|
  json.partial! 'serializers/team', team: team
end
