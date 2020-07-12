<template>
  <Transition name="fade">
    <div 
      v-if="showing" 
      class="modal" 
      @click.self="close">
      <div class="modal__container">
        <div class="has-text-right">
          <a
            aria-label="close"
            class="is-size-2 my-2 mx-4" 
            @click.prevent="close"
          >
            ×
          </a>
        </div>
        <hr class="is-marginless" />
        <div class="p-5">
          <slot />
        </div>
      </div>
    </div>
  </Transition>
</template>

<script>
export default {
  name: 'Modal',
  props: {
    showing: {
      required: true,
      type: Boolean
    }
  },
  methods: {
    close() {
      this.$emit('close');
    }
  },
}
</script>

<style lang="scss" scoped>
.modal {
  align-items: center;
  background-color: rgba(0, 0, 0, 0.75);
  bottom: 0;
  display: flex;
  height: 100vh;
  justify-content: center;
  left: 0;
  position: fixed;
  right: 0;
  top: 0;
  width: 100%;
  z-index: 9999999999999;

  &__container {
    background-color: white;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
    border-radius: 0.5rem;
    width: 60%;
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: all 0.4s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
