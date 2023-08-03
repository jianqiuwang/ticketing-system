import { createApp } from 'vue'
import App from './App.vue'
import router from './router' 
import { createApolloProvider } from '@vue/apollo-option'
import apolloClient from './apolloClient'

const apolloProvider = new createApolloProvider({
    defaultClient: apolloClient,
})

createApp(App)
    .use(router)
    .use(apolloProvider)
    .mount('#app')
