import { mount } from '@vue/test-utils'
import LogoutButton from '@/components/LogoutButton.vue'

describe('components/LogoutButton.vue', () => {
  test('is vue instance', () => {
    const wrapper = mount(LogoutButton)
    expect(wrapper.vm).toBeTruthy()
  })
})
