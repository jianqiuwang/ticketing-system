import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import { ApolloClient, InMemoryCache } from '@apollo/client/core';
import { createApolloProvider } from '@vue/apollo-option'; 
import { provideApolloClient } from '@vue/apollo-composable';

const apolloClient = new ApolloClient({
  uri: 'http://localhost:3000/graphql',
  cache: new InMemoryCache(),
  method: 'POST'
});

const apolloProvider = createApolloProvider({
  defaultClient: apolloClient,
});

provideApolloClient(apolloClient);


const app = createApp(App);
app.use(router);
app.use(apolloProvider);
app.mount('#app');
