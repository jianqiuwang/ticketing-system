import { createRouter, createWebHistory } from 'vue-router'
import HomePage from './pages/HomePage.vue' 
import EventSearch from './components/EventSearch.vue'
import LoginPage from './pages/LoginPage.vue'
import SignupPage from './pages/SignupPage.vue'

const routes = [
  { path: '/', component: HomePage }, // Route for HomePage
  { path: '/search', component: EventSearch }, // Route for EventSearch component
  { path: '/login', component: LoginPage },
  { path: '/signup', component: SignupPage } 
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
