<template>
  <form class="event-search-form" @submit.prevent="searchEvents">
    <button class="form-button" type="submit">Search</button>
    <select class="form-select" v-model="category">
      <option disabled value="">Please select a category</option>
      <option>Music</option>
      <option>Sport</option>
      <option>Art</option>
    </select>
    <input class="form-input" v-model="searchQuery" type="text" placeholder="Enter Name or City" />
    <h1 class="form-title">Search Events by Name or City</h1>
  </form>
</template>



<script>
export default {
  name: 'EventSearch', // change the name here
  data() {
    return {
      searchQuery: '',
      category: ''
    }
  },
  methods: {
    searchEvents() {
      // Logic to search events based on `this.searchQuery` and `this.category`
      // You might need to make API call to your server or third-party API
    }
  }
}
</script>

<style scoped>
.event-search-form {
  display: flex;
  flex-direction: column-reverse;
  align-items: center;
  gap: 20px;
}

.form-title {
  font-size: 1.5em;
  color: #333;
}

.form-select,
.form-input {
  padding: 10px;
  font-size: 1em;
  width: 50%;
  box-sizing: border-box;
}

.form-button {
  padding: 10px 20px;
  background-color: #007BFF;
  color: #FFF;
  border: none;
  cursor: pointer;
}

.form-button:hover {
  background-color: #0056b3;
}
</style>