<template>
  <div class="header">
    <LogoutButton v-if="this.$auth.$state.loggedIn" class="logout-button" />
    <NuxtLink v-else :to="currentButton().link" class="signup-signin-button">{{
      currentButton().buttonName
    }}</NuxtLink>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      signin: {
        buttonName: 'ログイン',
        link: '/signin',
      },
      signup: {
        buttonName: '新規登録',
        link: '/signup',
      },
    }
  },
  methods: {
    currentButton() {
      if (this.$route.path === this.signin.link) return this.signup
      else return this.signin
    },
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

.signup-signin-button {
  padding: 5px;
  margin: auto 40px;
  margin-left: auto;
  text-align: right;
  text-decoration: none;
  color: yellowgreen;
  background-color: rgb(231, 224, 162);
  border-radius: 3px;
  border-bottom: 4px solid #ccc100;
}

.signup-signin-button:hover {
  border-radius: 3px;
  border-bottom: 1px solid #ccc100;
}
</style>
