<template>
  <div id="app">
    <AppNavbar :user="user" @logout="logout" />
    <router-view :is-logged-in="isLoggedIn" />
  </div>
</template>


<script>
import axios from 'axios';
import AppNavbar from './components/AppNavbar.vue';
import { useRouter } from 'vue-router';
import { computed } from 'vue';
import { useStore } from 'vuex';

export default {
  name: 'App',
  components: {
    AppNavbar,
  },
  setup() {
    const store = useStore();
    const isLoggedIn = computed(() => store.getters.isLoggedIn);
    const router = useRouter();

    const logout = () => {
      axios.delete('http://localhost:3000/logout', { withCredentials: true })
        .then(() => {
          store.commit('SET_LOGIN_STATE', false);
          router.push('/login'); 
        })
        .catch(error => {
          console.error('Logout failed', error);
        });
    };

    return { isLoggedIn, logout };
  },
};
</script>
