
<template>
    <nav class="navbar">
      <div class="container">
        <div>
          <router-link to="/" class="navbar-brand">EventHive</router-link>
        </div>
        <div>
          <router-link to="/" class="navbar-item">Home</router-link>
          <router-link to="/login" class="navbar-item">Login</router-link>
          <router-link to="/signup" class="navbar-item">Signup</router-link>
          <a v-if="isLoggedIn" @click="logout" class="navbar-item">Logout</a>
        </div>
      </div>
    </nav>
  </template>

  <script>
  import { computed } from 'vue';
  import { useStore } from 'vuex';
  
  export default {
    name: "AppNavbar",
    emits: ['logout'], 
    setup(_, { emit }) { 
      const store = useStore();
      const isLoggedIn = computed(() => store.getters.isLoggedIn); // Read from Vuex
  
      const logout = () => {
        emit('logout'); // Emit the logout event to the parent component
      };
  
      return { isLoggedIn, logout };
    },
  };
  </script>


  <style>
  .navbar {
    background-color: #007BFF;
    padding: 1em;
  }
  
  .container {
    display: flex;
    justify-content: space-between;
    width: 90%;
    margin: auto;
  }
  
  .navbar-brand {
    color: #fff;
    font-size: 1.5em;
    text-decoration: none;
  }
  
  .navbar-item {
    color: #fff;
    margin-right: 1em;
    text-decoration: none;
  }
  
  .navbar-item:hover {
    color: #ddd;
  }
  </style>
  