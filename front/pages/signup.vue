<template>
  <div>
    <h1 class="title">ユーザ登録</h1>
    <ValidationObserver v-slot="{ handleSubmit }">
      <form class="form-wrapper" @submit.prevent="handleSubmit(request_signup)">
        <ValidationProvider
          ref="name"
          v-slot="{ errors }"
          rules="required"
          name="名前"
        >
          <span>{{ errors[0] }}</span>
          <input
            v-model="name"
            class="form"
            type="text"
            placeholder="Your name"
          />
        </ValidationProvider>

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
          rules="required|confirmed:password"
          name="パスワード"
          class="input-form"
        >
          <span>{{ errors[0] }}</span>
          <input
            v-model="password"
            class="form"
            type="password"
            placeholder="Password"
          />
        </ValidationProvider>

        <ValidationProvider
          ref="passwordConfirmation"
          v-slot="{ errors }"
          rules="required"
          name="確認用パスワード"
          vid="password"
        >
          <span>{{ errors[0] }}</span>
          <input
            v-model="passwordConfirmation"
            type="password"
            placeholder="Password Confirm"
            class="form"
          />
        </ValidationProvider>

        <button>登録</button>
      </form>
      <h2 v-for="error in responseErrors" :key="error" class="error">
        {{ error }}
      </h2>
    </ValidationObserver>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export type FormAndErrorData = {
  name: string
  email: string
  password: string
  passwordConfirmation: string
  responseErrors: string[]
}

export default Vue.extend({
  data(): FormAndErrorData {
    return {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      responseErrors: [],
    }
  },
  methods: {
    request_signup() {
      this.errors = []
      this.$axios
        .post('auth', {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.passwordConfirmation,
        })
        .catch((error) => {
          const errorMessages = error.response.data.error
          errorMessages.forEach((message) => {
            this.responseErrors.push(message)
          })
          this.responseErrors = new Set(this.responseErrors) // 重複を排除
        })
    },
  },
  auth: false,
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
.form-wrapper > button {
  margin: 10px auto;
  width: 40%;
  font-size: 32px;
}
span {
  color: red;
  display: block;
  text-align: center;
}
.error {
  color: red;
  text-align: center;
}
</style>
