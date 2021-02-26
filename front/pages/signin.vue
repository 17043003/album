<template>
  <div>
    <h1 class="title">ログイン</h1>
    <div class="form-wrapper">
      <input v-model="email" class="form" type="email" placeholder="Email" />
      <input
        v-model="password"
        class="form"
        type="password"
        placeholder="Password"
      />
      <button @click="request_signin">登録</button>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export type LoginParams = {
  email: string
  password: string
}

export default Vue.extend({
  data(): LoginParams {
    return {
      email: '',
      password: '',
    }
  },
  methods: {
    async request_signin() {
      await this.$auth
        .loginWith('local', {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then(
          (response) => {
            localStorage.setItem(
              'access-token',
              response.headers['access-token']
            )
            localStorage.setItem('client', response.headers.client)
            localStorage.setItem('uid', response.headers.uid)
            localStorage.setItem('token-type', response.headers['token-type'])
            return response
          },
          (error) => {
            return error
          }
        )
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
