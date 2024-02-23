import { createRouter, createWebHistory } from 'vue-router';
import IndexView from '../views/Index.vue';
import EquipeIndexView from '../views/Equipe/Index.vue'; 
import EquipeShow from '../views/Equipe/Show.vue';
import JoueurIndexView from '../views/Joueur/Index.vue'; 
import JoueurShow from '../views/Joueur/Show.vue';
import EvenementIndex from '../views/Evenement/Index.vue'; 
import EvenementShow from '../views/Evenement/Show.vue';
import JoueurCreate from '../views/Joueur/Create.vue';
import JoueurDelete from '../views/Joueur/Delete.vue';
import JoueurEdit from '../views/Joueur/Edit.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'index',
      component: IndexView,
      props: true
    },
    {
      path: '/equipe',
      name: 'equipe.index',
      component: EquipeIndexView,
      props: true
    },
    {
      path: '/equipe/:id',
      name: 'equipe.show',
      component: EquipeShow,
      props: true
    },
    {
      path: '/evenement',
      name: 'evenement.index',
      component: EvenementIndex,
      props: true
    },
    {
      path: '/evenements/:id',
      name: 'evenement.show',
      component: EvenementShow,
      props: true
      

    },


    {
      path: '/joueur',
      name: 'joueur.index',
      component: JoueurIndexView,
      props: true
    },
    {
      path: '/joueur/create', // Ajout du chemin complet ici
      name: 'joueur.create',
      component: JoueurCreate,
      props: true
    },
    {
      path: '/joueur/:id',
      name: 'joueur.show',
      component: JoueurShow,
      props: true
    },
    {
      path: '/:id/delete',
      name: 'joueur.delete',
      component: JoueurDelete,
      props: true
    },
    {
      path: '/:id/edit',
      name: 'joueur.edit',
      component: JoueurEdit,
      props: true
    },
  ]
});

export default router;
