<template>
  <div v-if="evenement" class="evenement-show">
    <div class="evenement-info">
      <h2> {{ evenement.nom_evenement }}</h2>
      <h2 class="match"> Le: {{ evenement.date_evenement }}</h2>
      <h2 >Les équipes qui jouent</h2>
      <div class="equipe-container">
        <div v-for="(equipe, index) in filteredequipes" :key="equipe.id" class="equipe">
          <div class="equipe-background" :style="`background-image: url(/equipe-hockey/${equipe.image_url})`">
            <span>{{ equipe.nom_equipe }}</span>
          </div>
          <span v-if="index < filteredequipes.length - 1" class="vs">VS</span>
        </div>
      </div>
    </div>
  </div>
</template>



<script setup>
import { ref, defineProps, onBeforeMount, computed } from 'vue'
import axios from 'axios'
// import { useRouter } from 'vue-router'

const props = defineProps({
  id: {
    type: [Number, String],
    required: true
  }
})

// const router = useRouter()
const evenement = ref(null)
const equipes = ref([])

onBeforeMount(async () => {
  try {
    // Récupération des données de l'événement depuis l'API
    const evenementResponse = await axios.get(`http://localhost:8000/api/evenements/${props.id}`)
    if (evenementResponse.data) {
      evenement.value = evenementResponse.data
      // Récupérer toutes les équipes depuis l'API
      await fetchToutesEquipes()
    }
  } catch (error) {
    console.error('Erreur lors de la récupération des données de l\'événement :', error)
  }
})

// Récupérer toutes les équipes depuis l'API
const fetchToutesEquipes = async () => {
  try {
    const equipesResponse = await axios.get(`http://localhost:8000/api/equipes`)
    equipes.value = equipesResponse.data
  } catch (error) {
    console.error('Erreur lors de la récupération des équipes :', error)
  }
}

// Utilisez une propriété calculée pour filtrer les équipes par événement
const filteredequipes = computed(() => {
  if (equipes.value && evenement.value) {
    return equipes.value.filter(equipe => equipe.id === evenement.value.equipe_hote_id || equipe.id === evenement.value.equipe_adverse_id)
  }
  return []
})
</script>


<style lang="scss" scoped>
.evenement-show {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}


.equipe-container {
  display: flex; 
  align-items: center; 
}

.equipe {
  display: flex;
  align-items: center;
}

h2.match{
  margin-bottom: 100px;
}
.equipe-background {
  width: 200px; 
  height: 200px; 
  background-size: cover;
  background-repeat: no-repeat;
  border-radius: 5%;
  margin-right: 10px; 
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: rgb(243, 49, 49);
  font-size: 20px;
  font-weight: bold;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 1);
  cursor: pointer;
  transition: transform 0.3s ease;


  &:hover {
    transform: scale(1.05);
  }
}

.vs {
  font-size: 24px; 
  margin: 0 10px; 
  color: #007bff;
}
</style>

