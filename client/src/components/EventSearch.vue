<template>
  <div>
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
    <div class="cards">
      <div v-for="event in events" :key="event.id" class="card">
        <img :src="event.imageUrl" alt="Event Image" />
        <h3>{{ event.name }}</h3>
        <p><strong>Category:</strong> {{ event.category }}</p>
        <p v-if="event.description">{{ event.description }}</p>
        <p><strong>Venue:</strong> {{ event.venue.name }}</p>
        <p><strong>Address:</strong> {{ event.venue.address }}</p>
        <p><strong>City:</strong> {{ event.venue.city }}</p>
        <p><strong>State:</strong> {{ event.venue.state }}</p>
        <p><strong>Country:</strong> {{ event.venue.country }}</p>
        <p><strong>Date:</strong> {{ event.startingDateTime }}</p>
        <p><strong>Price:</strong>
          {{ event.minimalPrice ? `$${event.minimalPrice} - $${event.maximalPrice ? event.maximalPrice : 'N/A'}` : 'Price not available at this time' }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect } from 'vue';
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';

const searchQuery = ref('');
const category = ref('');
const events = ref([]);

const SEARCH_EVENTS_QUERY = gql`
  query SearchEvents($search: String, $category: String) {
    events(type: "events", search: $search, category: $category) {
      id
      name
      category
      description
      venue {
        name
        city
        state
        country
        address
      }
      startingDateTime
      minimalPrice
      maximalPrice
      imageUrl
    }
  }
`;

const { result, onError, refetch } = useQuery(SEARCH_EVENTS_QUERY, {
  variables: {
    search: searchQuery.value,
    category: category.value,
  },
  lazy: true,
});

watchEffect(() => {
  console.log('GraphQL result:', result.value);
  if (result?.value?.events) {
    console.log('Server response:', result.value.events);
    events.value = result.value.events;
  }

  if (result?.value?.events) {
    events.value = result.value.events.map(event => ({
      ...event,
      venue: {
        ...event.venue,
        state: event.venue.state || 'N/A', // provide a default value if state is null
      },
    }));
  }
  
});

onError((error) => {
  console.error('An error occurred:', error);
});

const searchEvents = () => {
  console.log('searchEvents called with category:', category.value, 'and search query:', searchQuery.value);
  refetch({
    search: searchQuery.value,
    category: category.value,
  });
};
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

.cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 20px;
  }

  .card {
    width: 300px;
    margin: 15px;
    border: 1px solid #ccc;
    padding: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

.card {
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background-color: #f0f0f0;
}

.card img {
    width: 100%;
    height: 300px;
    border-radius: 5px;
    object-fit: cover;
}

.card h2 {
    font-size: 20px;
    margin: 10px 0;
}

.card p {
    font-size: 14px;
    margin-bottom: 5px;
}


</style>