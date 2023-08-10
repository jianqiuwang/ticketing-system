<template>
    <form class="signup-form" @submit.prevent="signup">
      <h1 class="form-title">Signup</h1>
      <input class="form-input" v-model="email" type="email" placeholder="Enter Email" />
      <input class="form-input" v-model="password" type="password" placeholder="Enter Password" />
      <button class="form-button" type="submit">Signup</button>
    </form>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    name: 'SignupForm',
    data() {
      return {
        email: '',
        password: '',
        errorMessage: '',
      };
    },
    methods: {
      signup() {
        const url = 'http://localhost:3000/signup';
        const payload = {
          email: this.email,
          password: this.password,
        };
  
        axios
          .post(url, payload)
          .then((response) => {
            // Handle successful signup
            console.log('Signup successful:', response.data);
            this.successMessage = 'Signup successful! Redirecting to login...'; 
            setTimeout(() => {
              this.$router.push('/login');
            }, 2000)
          })
          .catch((error) => {
            // Handle error
            console.error('Signup error:', error);
            this.errorMessage = 'Signup failed. Please check your information and try again.';
          });
      },
    },
  };
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
  