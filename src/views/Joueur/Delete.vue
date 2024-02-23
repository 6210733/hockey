<template>
    <div class="component">
      <h1>Supprimer le joueur</h1>
      <p>Voulez-vous vraiment supprimer ce joueur ?</p>
      <button @click="deletejoueur">Supprimer</button>
    </div>
  </template>
  
  <script setup>
  import { useRouter } from 'vue-router';
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  
  // Initialisation du routeur
  const router = useRouter();
  // Obtention des paramètres de la route actuelle
  const routeParams = router.currentRoute.value.params;
  
  // Fonction pour supprimer le joueur
  const deletejoueur = async () => {
    try {
      // Appel à l'API pour supprimer le joueur avec l'ID de la route actuelle
      await axios.delete(`http://localhost:8000/api/joueurs/${routeParams.id}`);
      // Redirection vers la liste des chevaux après la suppression
      router.push({ name: 'joueur.index' }); 
    } catch (error) {
      console.error("Erreur lors de la suppression du joueur :", error);
    }
  };
  </script>
  
  
  <style lang="scss"></style>
  