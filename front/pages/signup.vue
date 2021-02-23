<template>
  <div class="form-wrapper">
    <input v-model="name" type="text" placeholder="Your name" />
    <input v-model="email" type="email" placeholder="Email" />
    <input v-model="password" type="password" placeholder="Password" />
    <input
      v-model="passwordConfirmation"
      type="password"
      placeholder="Password Confirm"
    />
    <button @click="request_signup">登録</button>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export type RequestParams = {
  name: string
  email: string
  password: string
  passwordConfirmation: string
}

export default Vue.extend({
  data(): RequestParams {
    return {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
    }
  },
  methods: {
    request_signup() {
      this.$axios.post('auth', {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
      })
    },
  },
})
</script>
