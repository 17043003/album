<template>
  <a class="logout-button" @click="logout">ログアウト</a>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  methods: {
    logout() {
      if (confirm('ログアウトしますか？') === true) {
        this.$auth.logout()
        this.$auth.$storage.removeLocalStorage('token')
        this.$auth.$storage.removeLocalStorage('client')
        this.$auth.$storage.removeLocalStorage('uid')
      }
    },
  },
})
</script>

<style>
a.logout-button {
  background-color: rgb(231, 224, 162);
  text-align: center;
  padding: 10px;
  border-radius: 3px;
  border-bottom: 4px solid #ccc100;
}

a.logout-button:hover {
  padding: 10px;
  padding-top: 12px;
  border-radius: 3px;
  border-bottom: 1px solid #ccc100;
  cursor: pointer;
  transition: 0.15s;
}
</style>
