<template>
    <form class="signup-form" @submit.prevent="signup">
      <h1 class="form-title">Signup</h1>
      <input class="form-input" v-model="email" type="email" placeholder="Enter Email" />
      <input class="form-input" v-model="password" type="password" placeholder="Enter Password" />
      <button class="form-button" type="submit">Signup</button>
    </form>
  </template>
  
  <script>
  export default {
    name: 'SignupForm', 
    data() {
      return {
        email: '',
        password: ''
      }
    },
    methods: {
      signup() {
        // TODO: Implement signup logic
      }
    }
  }
  </script>
  
  <style scoped>
  .signup-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
  }
  
  .form-title {
    font-size: 1.5em;
    color: #333;
  }
  
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
  