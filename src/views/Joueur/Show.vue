<template>
  <!-- Utilisation de v-if pour vérifier si joueur et equipe sont définis avant d'afficher le contenu -->
  <div class="joueur-show">
    <!-- <h1 class="stats">Statistiques du joueur cette saison</h1> -->
    <div class="joueur-info">
      <h1> {{ joueur.nom_joueur }} </h1>


      <div v-if="joueur" class="joueur-image" :style="{
        backgroundImage: 'url(/joueurs-hockey/' + joueur.image_joueur + ')',
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        width: '200px',
        height: '200px',
        borderRadius: '50%',
        margin: 'auto'
      }">

      </div>
      <div class="profile">
        <div class="stats-profile">
          <div class="stats">
            <h4>Équipe du joueur:</h4>
            <p> {{ equipe ? equipe.nom_equipe : 'Chargement...' }} </p>
          </div>
        </div>



        <div class="stats-profile">
          <div class="but">
            <h4>Buts marqués:</h4>
            {{ joueur.buts_marques }}
          </div>
        </div>




        <div class="stats-profile">
          <div class="passes">
            <h4>Passes décisives:</h4>
            {{ joueur.passes_decisives }}
          </div>
        </div>

        <div class="stats-profile">
          <div class="tirs">
            <h4>Tirs hors cadre:</h4>
            {{ joueur.tirs_hors_cadre }}

          </div>
        </div>

        <div class="stats-profile">
          <div class="intecerption">
            <h4>Interceptions:</h4>
            {{ joueur.interceptions }}
          </div>

        </div>

        <div class="stats-profile">
          <div class="fautes">
            <h4>Fautes:</h4>
            {{ joueur.fautes }}
          </div>

        </div>

      </div>

      <div class="action-buttons">
        <button class="delete-button" @click="confirmDelete">Supprimer ce joueur</button>
        <router-link class="router-link" :to="{ name: 'joueur.edit', params: { id: joueur.id } }">Modifier</router-link>
      </div>
    </div>
  </div>
</template>


<script setup>
import { ref, defineProps } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const props = defineProps({
  id: {
    type: [Number, String],
    required: true,
  },
})

const router = useRouter()
const joueur = ref(null)
const equipe = ref(null) // Ajout de la référence réactive pour l'équipe

const fetchEquipe = async (equipeId) => {
  try {
    const response = await axios.get(`http://localhost:8000/api/equipes/${equipeId}`)
    equipe.value = response.data
  } catch (error) {
    console.error('Erreur lors de la récupération des données de l\'équipe :', error)
  }
}

axios
  .get(`http://localhost:8000/api/joueurs/${props.id}`)
  .then((response) => {
    console.log(response.data)
    if (response.data) {
      joueur.value = response.data
      fetchEquipe(joueur.value.equipe_id) // Appel de fetchEquipe avec l'ID de l'équipe du joueur
    }
  })
  .catch((error) => {
    console.log(error)
  })




// Fonction pour confirmer la suppression du joueur
const confirmDelete = () => {
  const shouldDelete = window.confirm('Voulez-vous vraiment supprimer ce joueur ?')
  if (shouldDelete) {
    deletejoueur()
  }
}


// Fonction pour supprimer le joueur
const deletejoueur = async () => {
  try {
    await axios.delete(`http://localhost:8000/api/joueurs/${props.id}`)
    // Redirection vers la liste des chevaux après la suppression
    router.push({ name: 'joueur.index' })
  } catch (error) {
    console.error('Erreur lors de la suppression du joueur :', error)
  }
}
</script>
  

<style lang="scss">
.joueur-show {
  max-width: 700px;
  width: 100%;
  border-radius: 15px;
  margin: auto;
  display: flex;
  position: relative;
  margin-bottom: 400px;
  color: black;
  height: 80vh;
  margin: 100px auto 300px;

  .joueur-info {
    width: 100%;
    height: fit-content;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url(/img-profile.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    padding: 10px;
    border-radius: 15px;
    text-align: center;
    height: 800px;
 

    h1 {
      color: white;
      margin-top: 50px;
    }

    .joueur-image {

      display: flex;
      justify-content: center;
      position: relative;
      border: 2px solid black;
      position: absolute;
      top: 80px;
      left: 50%;
      transform: translate(-50%, 50%);
    }

    .profile {
      display: grid;
      grid-template-columns: repeat(2, 1fr); 
      gap: 10px;
      background-color: #c5d8e7;
      padding: 10px;
      margin-top: 210px;
      border: 1px solid rgb(0, 0, 0);
      border-radius: 15px;
      box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;

    }

    .stats-profile {
      text-align: center;
      padding: 20px 0;
      border-radius: 10px; // Ajoute des coins arrondis
    }


    .action-buttons {
      display: flex;
      justify-content: center;
      margin-top: 60px;
    }

    .delete-button,
    .router-link {
      color: #2196f3; // Couleur du texte
      border: 2px solid #2196f3; // Bordure
      border-radius: 5px;
      padding: 10px 20px;
      cursor: pointer;
      margin-right: 10px;
      font-size: 16px;
      font-weight: bold;
      text-decoration: none; // Supprime le soulignement du texte
      transition: color 0.3s, border-color 0.3s; // Ajoute une transition en douceur

      &:hover {
        color: #1976d2; // Couleur du texte au survol
        border-color: #1976d2; // Couleur de la bordure au survol
      }
    }

  }
}
</style>