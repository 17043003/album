<template>
  <div class="header">
    <LogoutButton v-if="this.$auth.$state.loggedIn" class="logout-button" />
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      buttonName: 'ログイン',
    }
  },
})
</script>

<style>
.header {
  top: 0;
  width: 100%;
  background-color: bisque;
  display: flex;
}

.logout-button {
  justify-content: flex-end;
  margin: 15px 0 15px auto;
}
</style>
