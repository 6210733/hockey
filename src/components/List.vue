<template>


  <div class="carrousel">
    <swiper :modules="modules" :slides-per-view="1" :space-between="0" navigation :pagination="{ clickable: true }"
      :scrollbar="{ draggable: true }" @swiper="onSwiper" @slideChange="onSlideChange">
      <swiper-slide v-for="equipe in equipes" :key="equipe.id">
        <div class="slide-content">
          <h1 class="a-venir">Les équipes on action</h1>
          <img :src="getImageUrl(equipe.image_url)" :alt="equipe.nom_equipe" class="img-caroussel" />
          <h2 class="acceuil"><router-link :to="{ name: 'equipe.show', params: { id: equipe.id } }">
                        {{ equipe.nom_equipe }}
                    </router-link> </h2>
         
          <p class="pays"> {{ equipe.pays }}</p>
        </div>
      </swiper-slide>
    </swiper>
    </div>

  <div class="accueil">
   
    <div class="evenements-accueil">
      
      <div v-for="evenement in evenements" :key="evenement.evenement_id" class="evenement">
        <h3>{{ evenement.nom_evenement }}</h3>
        <p>Date: {{ evenement.date_evenement }}</p>
      </div>
    </div>
  </div>
  <div class="joueurs-images">
    <img v-for="joueur in joueurs" :key="joueur.joueur_id" :src="getPlayerImageUrl(joueur.image_joueur.trim())"
      :alt="joueur.nom_joueur" class="joueur-img" />
    </div>
    
  </template>

<script setup>
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation, Pagination, Scrollbar, A11y } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'
import 'swiper/css/scrollbar'

const modules = [Navigation, Pagination, Scrollbar, A11y]
const onSwiper = (swiper) => {
  console.log(swiper)
}
const onSlideChange = () => {
  console.log('slide change')
}


import { defineProps } from 'vue'

const props = defineProps({
  evenements: {
    type: Array,
    default: () => [],
  },
  equipes: {
    type: Array,
    default: () => [],
  },
  joueurs: {
    type: Array,
    default: () => [],
  },
})
const getImageUrl = (imageName) => {
  return `/equipe-hockey/${imageName}`
}
const getPlayerImageUrl = (imageName) => {
  return `/joueurs-hockey/${imageName}`
}


</script>


<style lang="scss">

.carrousel {
  max-width: 900px;
  margin: auto;
  margin-top: 60px;
  text-align: center;
  padding: 5px 10px;
  background-color: rgb(219, 219, 219);
  border-radius: 10px;
  color: rgb(0, 0, 0);

  a{
    text-decoration: none;
    color: #0a0a0a;

    &:hover{
      color: blue;
    }
  }

}




.joueurs-images {
  display: flex;
  justify-content: space-between;
  align-items: center;

}

.img-caroussel {
  max-width: 700px;
  width: 100%;
  /* height: 50%; */
  border-radius: 10px;
  margin-bottom: 10px;
}
p.a-venir{
  text-align: center;
 
}

.team-name {
  font-size: 18px;
  font-weight: bold;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  margin-top: 30px;
}

p.pays{
  text-align: center;
  margin-bottom: 30px;
}

.joueurs-images {
  max-width: 1200px;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  margin: 0 auto;
}

.joueur-img {
  width: calc(12.5% - 20px);
  max-width: 100px;
  height: auto;
  border-radius: 10px;
  margin: 10px;
}

.evenements {
  display: flex;
  overflow-x: auto;
  padding: 20px;
  background-image: url(../../public/coupe.jpg)
}

.evenements-accueil {
  max-width: 1000px;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  text-align: center;
  margin: 50px auto;
}

.evenement {
  width: calc(33.33% - 20px);
  max-width: 300px;
  height: 125px;
  margin: 5px;
  padding: 10px;
  border: 3px solid rgb(10, 10, 10);
  border-radius: 50% 90% / 50% 10%;
  box-shadow: 0 2px 4px rgba(104, 103, 103, 0.1);
  text-shadow: 2px 2px 4px #0a0a0a;
}



</style>
