<template>
	<div class="component">
	  <h1>Modifier un joueur</h1>
	  <joueurForm v-if="joueur" ref="form" :joueur="joueur" @submit="evt.submit" />
	</div>
  </template>
  
  <script setup>
  import { ref, defineProps, onBeforeMount } from 'vue';
  import { useRouter } from 'vue-router';
  import axios from 'axios';
  import joueurForm from '@/components/joueur/Form.vue'; // Assurez-vous que le chemin vers le composant Form.vue est correct
  const router = useRouter();
  
  // Définition des propriétés reçues (ici, l'ID du joueur)
  const props = defineProps({
	id: {
	  type: [Number, String],
	  required: true,
	},
  });
  
  // Utilisation de la référence pour stocker les données du joueur
  const joueur = ref(null);
  
  // Récupération des données du joueur depuis l'API
  onBeforeMount(async () => {
	try {
	  const response = await axios.get(`http://localhost:8000/api/joueurs/${props.id}`);
	  joueur.value = response.data;
	} catch (error) {
	  console.error('Erreur lors de la récupération des données du joueur :', error);
	}
  });
  
  // Référence pour le formulaire
  const form = ref();
  
  // Événements du formulaire
  const evt = {
	submit: async () => {
	//   form.value.$el.classList.add('wait'); // Ajoute une classe pour indiquer une attente
	  const formData = new FormData(document.forms[0]);
	  try {
		const response = await axios.post(`http://localhost:8000/api/joueurs/${joueur.value.id}`, formData);
		router.push({ name: 'joueur.index' });
	  } catch (error) {
		console.error('Erreur lors de la soumission du formulaire :', error);
	  }
	},
  };
  </script>
  
  <style lang="scss"></style>