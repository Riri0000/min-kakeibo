const app = new Vue({
	el: '#app',
  data: {
  	isOpen: false
  },
  methods: {
    toggle() {
      this.isOpen = true
    }
  }
})
