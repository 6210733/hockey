<script setup>
import { RouterView } from 'vue-router'
import MainNav from './components/Nav.vue'
</script>

<template>
    <header>
        <div>
            <router-link :to="{ name: 'index' }">

                <img src="/icononly_transparent_nobuffer.png" alt="Logo" class="logo"
                    style="width: 100px;  border-radius: 10px;" />


            </router-link>
            <h1>La ligue des Champions Hockey</h1>
        </div>


    </header>
    <main-nav />
    <RouterView />
    <footer>
        <div>
            <router-link :to="{ name: 'index' }">
                <img src="/icononly_transparent_nobuffer.png" alt="Logo" class="logo"
                    style="width: 100px;  border-radius: 10px;" />
            </router-link>
        <ul>
			<li><router-link :to="{name:'index'}">Accueil</router-link></li>
			<li><router-link :to="{name:'equipe.index'}">Équipes</router-link></li>
			<li><router-link :to="{name:'joueur.index'}">Joueurs</router-link></li>
			<li><router-link :to="{name:'evenement.index'}">Événements</router-link></li>
			<li><router-link :to="{ name: 'joueur.create' }">Ajouter</router-link></li>
		</ul>
            <p>&copy; Since 2023</p>
        </div>
    </footer>
</template>
