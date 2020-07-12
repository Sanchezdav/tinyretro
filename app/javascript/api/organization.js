import api from './instance'

/**
 * Create an organization
 */
const create = (organization) => (
  api.post(Routes.api_organizations_path(), organization)
)

export default {
  create,
}
