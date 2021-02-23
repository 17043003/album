<template>
  <div>
    <h1 class="title">ユーザ登録</h1>
    <div class="form-wrapper">
      <input v-model="name" class="form" type="text" placeholder="Your name" />
      <input v-model="email" class="form" type="email" placeholder="Email" />
      <input
        v-model="password"
        class="form"
        type="password"
        placeholder="Password"
      />
      <input
        v-model="passwordConfirmation"
        type="password"
        placeholder="Password Confirm"
        class="form"
      />
      <button @click="request_signup">登録</button>
    </div>
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

<style>
h1.title {
  text-align: center;
}

.form-wrapper {
  display: flex;
  flex-direction: column;
  width: 100%;
  margin: auto;
}
.form-wrapper > .form {
  margin: 5px auto;
  width: 60%;
  font-size: 24px;
}
.form-wrapper > button {
  margin: 10px auto;
  width: 40%;
  font-size: 32px;
}
</style>
