<template>
  <h1>Nouvel ajout de joueur</h1>
  <div class="component">
    <JoueurForm ref="form" @submit="submitForm" />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import JoueurForm from '@/components/joueur/Form.vue';

const router = useRouter();
const joueur = ref({
  nom_joueur: '',
  equipe_id: '',
  buts_marques: '',
  passes_decisives: '',
  tirs_hors_cadre: '',
  interceptions: '',
  fautes: '',
  image_joueur: '', // Utilisez null pour le fichier
  image_profile: '',
});

const submitForm = async (formData) => {
  try {
    // Envoi des données au serveur pour créer le joueur
    const response = await axios.post('http://localhost:8000/api/joueurs', formData);


      // Redirection vers la liste des joueurs après création
      router.push({ name: 'joueur.index' });

      console.error('Erreur lors de la création du joueur : ID introuvable dans la réponse.');
   
  } catch (error) {
    console.error('Erreur lors de la création du joueur :', error);
  }
};
</script>


