<template>
  <div class="header">
    <button>{{ loginOrLogoutButtonName }}</button>
    <!-- <button>{{ $auth.$state }}</button> -->
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
  computed: {
    loginOrLogoutButtonName() {
      return this.$auth.$state.loggedIn ? 'ログアウト' : this.$auth.user
      //   return this.$store.state.auth.loggedIn
    },
  },
})
</script>

<style>
.header {
  top: 0;
  width: 100%;
  background-color: bisque;
}
</style>
