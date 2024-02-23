<template>
  <div class="equipe-list" :class="{ wait: equipes.length === 0 }">
    <h1>Toutes les équipes</h1>
    <div class="equipe-row">
      <div v-for="equipe in equipes" :key="equipe.id">
        <div class="equipe-item">
          <router-link :to="{ name: 'equipe.show', params: { id: equipe.id } }">
            <div class="equipe-image" :style="{
              backgroundImage: `url(/equipe-hockey/${equipe.image_url})`,
              backgroundSize: 'cover',
              backgroundRepeat: 'no-repeat',
              width: '380px',
              height: '400px',
              borderRadius: '5%',
              marginTop: '20px'
            }">
            </div>
          </router-link>
          <h2 class="list">
            <router-link :to="{ name: 'equipe.show', params: { id: equipe.id } }">
              {{ equipe.nom_equipe }}
            </router-link>
          </h2>
        </div>
      </div>
    </div>
  </div>
</template>
  
<script setup>
import { defineProps } from 'vue'

// Définition des props en utilisant defineProps
const props = defineProps({
  equipes: {
    type: Array,
    default: () => [],
  },
})
</script>
  
<style lang="scss" scoped>
.equipe-list {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: auto;
  flex-direction: column;
  
  .equipe-row {
    display: flex;

    flex-wrap: wrap;
    justify-content: center;
    text-align: center;

    .equipe-item {
      a {
        text-decoration: none;
        color: black;

        &:hover {
          color: darkblue;
        }
      }
    }
  }

  .equipe-image {
    margin-right: 20px;
    border: 1px solid rgb(0, 0, 0);
    

    &:hover {
      transform: scale(1.05);
    }
  }
}
</style>
  