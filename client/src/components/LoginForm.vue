<template>
    <form class="login-form" @submit.prevent="login">
      <h1 class="form-title">Login</h1>
      <input class="form-input" v-model="email" type="email" placeholder="Enter Email" />
      <input class="form-input" v-model="password" type="password" placeholder="Enter Password" />
      <button class="form-button" type="submit">Login</button>
    </form>
  </template>
  
  <script>
  import axios from 'axios';

  export default {
    name: 'LoginForm',
    data() {
      return {
        email: '',
        password: '',
        errorMessage: '',
      };
    },
    methods: {
      login() {
       
        const url = 'http://localhost:3000/login';
  
        const payload = {
          email: this.email,
          password: this.password,
        };
  
        axios
          .post(url, payload, { withCredentials: true })
          .then((response) => {
            console.log('Login successful:', response.data);
            this.successMessage = 'Login successful! Redirecting to home page...';
            this.$store.commit('SET_LOGIN_STATE', true);
            setTimeout(() => {
              this.$router.push('/'); // Redirect to home page
            }, 2000);
          })
          .catch((error) => {
            // Handle error
            console.error('Login error:', error);
            this.errorMessage = 'Login failed. Please check your email and password.';
          });
      },
    },
  };
  </script>
  
  <style scoped>
  .login-form {
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
  