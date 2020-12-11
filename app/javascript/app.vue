<template>
  <v-app id="app">
    <v-btn>Vuetifyのボタン</v-btn>
    <div>
      <p>{{ message }}</p>
    </div>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
