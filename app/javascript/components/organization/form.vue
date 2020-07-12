<template>
  <div class="px-6 py-5 has-text-left">
    <h2 class="title is-3">Organization</h2>
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
      <div class="field">
        <label for="name" class="label">Description</label>
        <div class="control">
          <textarea 
            v-model="organization.description" 
            class="textarea" 
            rows="3" 
            placeholder="Add a short description">
          </textarea>
        </div>
      </div>
      <button :disabled="disabled" class="button is-success is-fullwidth">Create organization</button>
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
        description: ''
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
