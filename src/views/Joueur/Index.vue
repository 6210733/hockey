<template>
  <div>
    <JoueurList :joueurs="joueurs" :equipes="equipes" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import JoueurList from '@/components/joueur/List.vue';

const joueurs = ref([]);
const equipes = ref([]);

onMounted(async () => {
  try {
    // Récupérer les données des joueurs depuis l'API
    const joueursResponse = await axios.get('http://localhost:8000/api/joueurs');
    joueurs.value = joueursResponse.data;

    // Récupérer les données des équipes depuis l'API
    const equipesResponse = await axios.get('http://localhost:8000/api/equipes');
    equipes.value = equipesResponse.data;
  } catch (error) {
    console.error(error);
  }
});
</script>
