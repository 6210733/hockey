<template>
	<nav>
		<ul>
			<li><router-link :to="{name:'index'}">Accueil</router-link></li>
			<li><router-link :to="{name:'equipe.index'}">Équipes</router-link></li>
			<li><router-link :to="{name:'joueur.index'}">Joueurs</router-link></li>
			<li><router-link :to="{name:'evenement.index'}">Événements</router-link></li>
			<li><router-link :to="{ name: 'joueur.create' }">Ajouter un joueur</router-link></li>
		</ul>
	</nav>
</template>

<script setup>
	import { RouterLink } from 'vue-router'
</script>