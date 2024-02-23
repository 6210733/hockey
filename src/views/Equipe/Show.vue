<template>
  <div v-if="equipe" class="equipe-show">
    <h1>{{ equipe.nom_equipe }}</h1>
    <div class="equipe-info">
      <div
        class="equipe-image"
        v-if="equipe.image_url"
        :style="{ backgroundImage: 'url(/equipe-hockey/' + equipe.image_url + ')' }"
      ></div>
      <h2>Statistiques de l'équipe:</h2>
      <ul>
        <li>Nombre de victoires: {{ equipe.nombre_victoires }}</li>
        <li>Nombre de défaites: {{ equipe.nombre_defaites }}</li>
        <li>Nombre de matchs nuls: {{ equipe.nombre_matchs_nuls }}</li>
      </ul>
      <h2>Joueurs de l'équipe:</h2>
      <ul v-if="joueurs">
        <li v-for="joueur in filteredJoueurs" :key="joueur.id">
          <div class="joueur-info">
            <img class="joueur-image" :src="`/img/joueurs/${joueur.id}/512x512.webp`" :alt="''" />
            <span>{{ joueur.nom_joueur }}</span>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<!-- Le reste du code reste inchangé -->



<script setup>
import { ref, defineProps, onBeforeMount, computed } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const props = defineProps({
  id: {
    type: [Number, String],
    required: true,
  },
})

const router = useRouter()
const equipe = ref(null)
const joueurs = ref([])

onBeforeMount(async () => {
  try {
    // Récupération des données de l'équipe depuis l'API
    const equipeResponse = await axios.get(`http://localhost:8000/api/equipes/${props.id}`)
    if (equipeResponse.data) {
      equipe.value = equipeResponse.data
      // Récupérer tous les joueurs depuis l'API
      await fetchAllJoueurs()
    }
  } catch (error) {
    console.error('Erreur lors de la récupération des données de l\'équipe :', error)
  }
})

// Récupérer tous les joueurs depuis l'API
const fetchAllJoueurs = async () => {
  try {
    const joueursResponse = await axios.get(`http://localhost:8000/api/joueurs`)
    joueurs.value = joueursResponse.data
  } catch (error) {
    console.error('Erreur lors de la récupération des joueurs :', error)
  }
}

// Utilisez une propriété calculée pour filtrer les joueurs par équipe
const filteredJoueurs = computed(() => {
  if (joueurs.value && equipe.value) {
    return joueurs.value.filter(joueur => joueur.equipe_id === equipe.value.id)
  }
  return []
})
</script>

<style lang="scss" scoped>
/* Styles for the equipe-show container */
.equipe-show {
  padding: 20px;
  border: 1px solid #ccc;
  background-color: #f7f7f7;
  margin: 20px;
  max-width: 800px;
  width: 100%;
  margin: auto;
  background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 11%, rgba(0,212,255,1) 74%);

}
h1{
  text-align: center;
}


.equipe-info {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.equipe-image {
  width: 300px;
  height: 300px;
  background-size: cover;
  background-position: center;
  border-radius: 50%;
  margin-bottom: 10px;
  margin-top: 20px;
  border: 1px solid black;
}


h1 {
  font-size: 24px;
  margin: 5px 0;
}


ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  font-size: 18px;
  margin: 5px 0;
}


.joueur-info {
  display: flex;
  align-items: center;
}


.joueur-image {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  margin-right: 10px;
  object-fit: cover;
  border: 1px solid black;

}


span {
  font-size: 18px;
  margin: 5px 0;
}

</style>
