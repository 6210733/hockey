<template>
  <div>
    <EquipeList :equipes="equipes" />
 
    <EvenementList :evenements="evenements" />
 
    <JoueurList :joueurs="joueurs" />
    
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import EquipeList from '@/components/List.vue';
import JoueurList from '@/components/List.vue';
import EvenementList from '@/components/List.vue';

const equipes = ref([]);
const joueurs = ref([]);
const evenements = ref([]);

onMounted(async () => {
  try {
    const equipesResponse = await axios.get('http://localhost:8000/api/equipes');
    equipes.value = equipesResponse.data;

    const joueursResponse = await axios.get('http://localhost:8000/api/joueurs');
    joueurs.value = joueursResponse.data;

    const evenementsResponse = await axios.get('http://localhost:8000/api/evenements');
    evenements.value = evenementsResponse.data;
  } catch (error) {
    console.error(error);
  }
});
</script>


  
