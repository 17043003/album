<template>
  <div>
    <h1>MyPage</h1>
    <div v-if="$auth.loggedIn">
      <img
        v-if="user.data.image"
        :src="user.data.image"
        alt="Your icon image"
      />
      <img
        v-else
        src="~/assets/default_icon.svg"
        alt="Your icon image"
        width="128px"
        height="128px"
      />
      <h2>Your Name : {{ user.data.name }}</h2>
      <h2>E-mail : {{ user.data.email }}</h2>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  async asyncData({ $axios }): Promise<void> {
    return await $axios.get('acount').then((response) => {
      return { user: response.data }
    })
  },
})
</script>
