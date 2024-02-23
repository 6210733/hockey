<template>
  <div class="evenement-list" :class="{ wait: evenements.length === 0 }">
    <h1>Liste des événements</h1>
    <div class="evenement-row">
      <div v-for="evenement in evenements" :key="evenement.evenement_id">
        <router-link :to="{ name: 'evenement.show', params: { id: evenement.evenement_id } }">
          *{{ evenement.evenement_nom }}*
        </router-link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

// Définition des props en utilisant defineProps
const props = defineProps({
  evenements: {
    type: Array,
    default: () => []
  }
});
</script>


<style lang="scss" scoped>

.evenement-list {
  width: 100%;
  max-width: 800px; 
  margin: 0 auto;
  padding: 20px; 
  text-align: center; 

 
  h1 {
    font-size: 24px;
    margin-top: 100px;
    margin-bottom: 100px;
    color: #333; 
  }


  .evenement-row {
    display: grid;
    grid-template-columns: repeat(2, 1fr); 
    gap: 20px; 
    margin-bottom: 10px;

    a{

      text-decoration: none;
      padding: 10px 20px;
      color: rgb(30, 31, 30);
      font-size: 18px;
      &:hover{
        color: blue;
        font-size: 20px;
      }
      
    }
  }

  .evenement-item {
    background-color: #fff; 
    padding: 15px;
    border: 1px solid #ddd; 
    border-radius: 5px;
    text-align: center;

  
    a {
      text-decoration: none;
      color: #007bff; 
      font-weight: bold;
      padding: 12px 20px;
      
    }

   
    a:hover {
      text-decoration: underline;
    }
  }
}
</style>
