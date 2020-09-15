<template>
  <div class="px-6 py-5 has-text-left">
    <h3 class="title is-3">Organization</h3>
    <ul class="errors" v-if="errors.length > 0">
      <li class="errors__item" v-for="(error, index) in errors" :key="index">
        {{ error }}
      </li>
    </ul>
    <form @submit.prevent="createOrgnization">
      <div class="field">
        <label for="name" class="label">* Name</label>
        <div class="control">
          <input
            v-model="organization.name"
            type="text"
            name="name"
            id="name"
            class="input"
            @keyup='validateInput()'>
        </div>
      </div>
      <h5 class="title is-5 mt-5">Teams</h5>
      <hr />
      <div v-for="(team, index) in organization.teams_attributes" :key="index">
        <div v-if="team._destroy == '1'">
          {{ team.name }} will be removed. <button v-on:click="undoRemove(index)">Undo</button>
        </div>
        <div v-else>
          <div class="field">
            <label for="name" class="label">* Team name</label>
            <input type="text" id="team_name" class="input mb-1" v-model="team.name" />
            <a @click="removeTeam(index)" class="has-text-danger">Remove</a>
          </div>
        </div>
        <hr />
      </div>
      <div class="field mt-5">
        <a @click="addTeam">
          <i class="fa fa-plus mr-2"></i>
          Add another team
        </a>
      </div>
      <div class="field mt-5">
        <button :disabled="disabled" class="button is-success is-fullwidth">Create organization</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'OrganizationForm',
  data() {
    return {
      organization:{
        name: '',
        description: null,
        teams_attributes: [
          { id: null, name: '', description: null, _destroy: null }
        ]
      },
      disabled: true,
    }
  },
  props: {
    errors: Array
  },
  methods: {
    createOrgnization() {
      this.$emit('addOrganization', this.organization)
    },
    validateInput() {
      if (this.organization.name.length > 2) {
        this.disabled = false
      } else {
        this.disabled = true
      }
    },
    addTeam: function() {
      this.organization.teams_attributes.push({
        id: null,
        name: '',
        description: null,
        _destroy: null
      })
    },
    removeTeam: function(index) {
      let team = this.organization.teams_attributes[index]

      if (team.id == null) {
        this.organization.teams_attributes.splice(index, 1)
      } else {
        this.organization.teams_attributes[index]._destroy = "1"
      }
    },
    undoRemove: function(index) {
      this.organization.teams_attributes[index]._destroy = null
    },
  },
}
</script>

<style lang="scss" scoped>
.errors {
  border-left: 3px solid #f44336;
  color: #f44336;
  margin: 0 0 20px 0;

  &__item {
    list-style: none;
    margin-bottom: 0;
  }
}
</style>
