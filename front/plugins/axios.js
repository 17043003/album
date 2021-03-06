export default function ({ $axios }) {
  $axios.onRequest((config) => {
    config.headers.token = localStorage.getItem('auth.token')
    config.headers.client = localStorage.getItem('auth.client')
    config.headers.uid = localStorage.getItem('auth.uid')
    return config
  })
}
