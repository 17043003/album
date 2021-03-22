<template>
  <div>
    <h1 class="title">ログイン</h1>
    <ValidationObserver v-slot="{ handleSubmit }">
      <form class="form-wrapper" @submit.prevent="handleSubmit(request_signin)">
        <ValidationProvider
          ref="email"
          v-slot="{ errors }"
          rules="required|email"
          name="メールアドレス"
        >
          <span>{{ errors[0] }}</span>

          <input
            v-model="email"
            class="form"
            type="email"
            placeholder="Email"
          />
        </ValidationProvider>
        <ValidationProvider
          ref="password"
          v-slot="{ errors }"
          rules="required"
          name="パスワード"
        >
          <span>{{ errors[0] }}</span>

          <input
            v-model="password"
            class="form"
            type="password"
            placeholder="Password"
          />
        </ValidationProvider>
        <button>登録</button>
      </form>
    </ValidationObserver>
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
            this.$auth.$storage.setLocalStorage('token', response.headers.token)
            this.$auth.$storage.setLocalStorage('uid', response.headers.uid)
            this.$auth.$storage.setLocalStorage(
              'client',
              response.headers.client
            )
            this.$auth.setUserToken(response.headers.token, null)

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
.form {
  margin: 5px auto;
  width: 60%;
  font-size: 24px;
}
span {
  display: block;
  text-align: center;
}
.form-wrapper > span {
  margin-bottom: 30px;
}

.form-wrapper > span > span {
  color: red;
}

button {
  margin: 10px auto;
  width: 40%;
  font-size: 32px;
}
</style>
