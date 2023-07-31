import { createRouter, createWebHistory } from 'vue-router'
import HomePage from './pages/HomePage.vue' 
import EventSearch from './components/EventSearch.vue' // import EventSearch component

const routes = [
  { path: '/', component: HomePage }, // Route for HomePage
  { path: '/search', component: EventSearch }, // Route for EventSearch component
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
