<template>
  <div class="organizations">
    <div v-if="organizations.length == 0" class="organizations-empty has-text-centered pt-6">
      <h2 class="title is-2">Create your first organization</h2>
      <a @click="showingModal = true">
        <i class="fa fa-plus mr-2"></i>
        Add here
      </a>
    </div>
    <div v-else>
      <div class="is-full-width has-text-right py-2 mb-5">
        <a @click="showingModal = true">
          <i class="fa fa-plus mr-2"></i>
          Create another organization
        </a>
      </div>
      <transition-group name="fade">
        <div v-for="(organization, index) in organizations" :key="index">
          <div class="columns">
            <div class="organization column is-half">
              <h2 class="title is-2">{{ organization.name }}</h2>
            </div>
            <div class="teams column is-half">
              <div v-for="(team, index) in organization.teams" :key="index">
                {{ team.name }}
              </div>
            </div>
          </div>
        </div>
      </transition-group>
    </div>
    <Modal :showing="showingModal" @close="showingModal = false">
      <OrganizationForm 
        v-on:addOrganization="createOrganization"
        :errors="errors"/>
    </Modal>
  </div>
</template>

<script>
import Modal from '../Modal'
import OrganizationForm from './form'

export default {
  name: 'OrganizationsList',
  components: {
    Modal,
    OrganizationForm
  },
  props: {
    organizations: Array
  },
  data () {
    return {
      showingModal: false,
      errors: []
    }
  },
  methods: {
    createOrganization(organization) {
      this.$store
        .dispatch('createOrganization', organization)
        .then((response) => {
          this.organizations.unshift(response)
          this.showingModal = false
        })
        .catch(errors => {
          console.log(errors)
          this.errors = errors
        })
    },
  }
}
</script>

<style lang="scss" scoped>
.organization {
  
}
</style>
