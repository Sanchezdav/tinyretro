import api from '../../api'

const defaultState = {
}

export const actions = {
  createOrganization({ commit }, organization) {
    return new Promise((resolve, reject) => {
      api
        .organization
        .create(organization)
        .then((response) => {
          resolve(response)
        })
        .catch((error) => {
          reject(error.response.data)
        })
    })
  }
}

export const mutations = {
}

export default {
  state: defaultState,
  actions,
  mutations
}
