<template>
    <div>
      <h1>Signup Page</h1>
      <SignupForm/>
    </div>
</template>

<script>
  import SignupForm from '../components/SignupForm.vue'

export default {
  name: 'SignupPage',
  components:{
    SignupForm
  }
}
</script>
