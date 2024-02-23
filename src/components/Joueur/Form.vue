<template>
    <div>
      <form class="form-joueur" @submit.prevent="evt.submit">
        <div class="form-row">
          <label for="nom_joueur">Nom du joueur</label>
          <input type="text" id="nom_joueur" name="nom_joueur" v-model="joueur.nom_joueur" required />
        </div>
        <div class="form-row">
          <label for="equipe_id">Équipe</label>
          <!-- Utilisation de la liste des équipes récupérée -->
          <select id="equipe_id" name="equipe_id" v-model="joueur.equipe_id" required>
            <option value="" disabled>Sélectionnez une équipe</option>
            <option v-for="equipe in equipes" :key="equipe.id" :value="equipe.id">{{ equipe.nom_equipe }}</option>
          </select>
        </div>
        <div class="form-row">
          <label for="buts_marques">Buts marqués</label>
          <input type="text" id="buts_marques" name="buts_marques" v-model="joueur.buts_marques" required />
        </div>
        <div class="form-row">
          <label for="passes_decisives">Passes décisives</label>
          <input type="text" id="passes_decisives" name="passes_decisives" v-model="joueur.passes_decisives" required />
        </div>
        <div class="form-row">
          <label for="tirs_hors_cadre">Tirs hors cadre</label>
          <input type="text" id="tirs_hors_cadre" name="tirs_hors_cadre" v-model="joueur.tirs_hors_cadre" required />
        </div>
        <div class="form-row">
          <label for="interceptions">Interceptions</label>
          <input type="text" id="interceptions" name="interceptions" v-model="joueur.interceptions" required />
        </div>
        <div class="form-row">
          <label for="fautes">Fautes</label>
          <input type="text" id="fautes" name="fautes" v-model="joueur.fautes" required />
        </div>
        <div class="form-row">
          <label for="image_joueur">Image du joueur</label>
          <input type="texte" id="image_joueur" name="image_joueur" v-model="joueur.image_joueur" required/>
        </div>
        <div class="form-row">
          <label for="image_profile">Image du joueur</label>
          <input type="file" id="image_profile" name="image_jouimage_profile" @change="evt.handleImageUpload" />
        </div>
        <!-- <div class="form-row">
          <label for="image_joueur">Image du joueur</label>
          <input type="file" id="image_joueur" name="image_joueur" @change="evt.handleImageUpload" />
        </div> -->
        <div class="form-row">
          <!-- <button type="submit">Envoyer</button> -->
          <button type="submit">{{ joueur.id ? 'Mettre à jour' : 'Créer' }}</button>
        </div>
      </form>
    </div>
  </template>
  
  <script setup>
  import { defineProps, defineEmits, ref } from 'vue';
  import axios from 'axios';
  
  const props = defineProps({
    joueur: {
      type: Object,
      default: () => ({}),
    },
  });
  
  const emit = defineEmits(['submit']);
  
  const evt = {
	submit: () => {
		emit('submit', new FormData(document.forms[0]));
	}
};
  
  const joueur = ref(props.joueur);
  
  // Liste des équipes récupérée depuis l'API
  const equipes = ref([]);
  
  axios
    .get('http://localhost:8000/api/equipes') // Assurez-vous que l'URL correspond à votre API
    .then((response) => {
      equipes.value = response.data;
    })
    .catch((error) => {
      console.error('Erreur lors de la récupération des équipes :', error);
    });
  </script>
  
  <style lang="scss">

.form-joueur {
  max-width: 600px;
  margin: 0 auto;
  padding: 60px;
  border: 1px solid #ccc;
  border-radius: 10px;
  background-color: #f7f7f7;
  font-family: Arial, sans-serif;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.9);
  background: rgb(210,205,255);
background: linear-gradient(90deg, rgba(210,205,255,1) 9%, rgba(15,4,215,1) 35%, rgba(7,2,102,1) 83%);


}
h1{
  text-align: center;
  margin-bottom: 40px;
}

.form-row {
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
}


label {
  font-weight: bold;
  margin-bottom: 5px;
}


input[type="text"],
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

button[type="submit"] {
  background-color: #2196f3;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.3s ease;

  &:hover {
    background-color: #1976d2;
  }
}


  </style>
  