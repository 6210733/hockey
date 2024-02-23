<template>
    <div class="joueur-list" :class="{ wait: joueurs.length === 0 }">
        <h1>Liste des joueurs</h1>
        <div class="joueur-row">
            <div v-for="joueur in joueurs" :key="joueur.id">
                <div class="joueur-item">
                    <router-link :to="{ name: 'joueur.show', params: { id: joueur.id } }">
                        <div class="joueur-image" :style="{
                            backgroundImage: `url(/joueurs-hockey/${joueur.image_joueur})`,
                            backgroundSize: 'cover',
                            objectFit:'fill',
                            backgroundRepeat: 'no-repeat',
                            width: '250px',
                            height: '300px',
                            marginTop: '20px'
                        }"></div>
                    </router-link>
                    <h2 class="list">
                        <router-link :to="{ name: 'joueur.show', params: { id: joueur.id } }">
                            {{ joueur.nom_joueur }}
                        </router-link>
                    </h2>
                </div>
            </div>
        </div>
        <h1>Ajoutez un joueur à la liste</h1>
        <div class="ajout">
            <router-link :to="{ name: 'joueur.create' }">Ajouter</router-link>
        </div>
    </div>
</template>
  
  
  
<script setup>
import { defineProps } from 'vue'

// Définition des props en utilisant defineProps
const props = defineProps({
    joueurs: {
        type: Array,
        default: () => []
    }
})
</script>

<style lang="scss" scoped>
.joueur-list {
    width: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    flex-direction: column;

    .joueur-row {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        text-align: center;
        

        .joueur-item {
            a {
                text-decoration: none;
                color: black;

                &:hover {
                    color: darkblue;
                }
            }
        }
    }

    .joueur-image {
        margin-right: 20px;
        border-radius: 10px;
        border: 1px solid black;


        &:hover {
            transform: scale(1.05);
        }
    }

    .ajout {
        a {

            display: inline-block;
            padding: 15px 25px;
            font-size: 24px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

        .button:hover {
            background-color: #3e8e41
        }

        .button:active {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
    }

}
</style>





