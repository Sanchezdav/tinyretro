<template>
  <div class="organizations">
    <div v-if="organizations.length == 0" class="organizations-empty has-text-centered pt-6">
      <h2 class="title is-2">Create your first organization</h2>
      <a @click="showingModal = true">
        <i class="fa fa-plus mr-2"></i>
        Add here
      </a>
      <Modal :showing="showingModal" @close="showingModal = false">
        <OrganizationForm 
          v-on:addOrganization="createOrganization"
          :errors="errors"/>
      </Modal>
    </div>
    <div v-else>
      <transition-group name="fade">
        <div v-for="(organization, index) in organizations" :key="index">
          <h1>{{ organization.name }}</h1>
        </div>
      </transition-group>
    </div>
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
