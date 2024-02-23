<template>
  <div>
    <EvenementList :evenements="evenements" />
  </div>
</template>

<script setup>
import { ref, onBeforeMount } from 'vue';
import axios from 'axios';
import EvenementList from '@/components/evenement/List.vue';

const equipes = ref([]);
const evenements = ref([]);

onBeforeMount(async () => {
  try {
    // Récupérer les données des équipes depuis l'API
    const equipesResponse = await axios.get('http://localhost:8000/api/equipes');
    equipes.value = equipesResponse.data;

    // Récupérer les données des événements depuis l'API
    const evenementsResponse = await axios.get('http://localhost:8000/api/evenements_equipes');
    evenements.value = evenementsResponse.data;
  } catch (error) {
    console.error(error);
  }
});
</script>