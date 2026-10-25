# Instructions Copilot - Projet HTML/CSS pur

## Contexte
- Site en HTML/CSS pur (JavaScript vanilla uniquement si necessaire). Pas de framework, pas de Tailwind, pas de bibliotheque CSS ajoutee sans demande explicite.
- Le design (maquettes HTML/CSS) est cree par Gemini. Ton role : l'integrer fidelement, pas le redesigner.
- Reponds en francais. Commentaires de code courts et en francais.

## Regle n°1 : fidelite au design
- Quand je fournis du HTML/CSS issu de Gemini, copie-le A L'IDENTIQUE.
- Ne modifie, n'arrondis et ne "simplifie" aucune valeur : couleurs, tailles, espacements, ombres, degrades, bordures, rayons, polices, transitions, animations.
- Ne supprime aucun element, classe, attribut ou lien (polices Google Fonts, icones, etc.).
- Ne rajoute aucun style decoratif non demande.
- Si une valeur manque ou est ambigue, demande-moi avant d'inventer.

## Integration
- Integre section par section (header, hero, cartes, footer...), pas toute la page d'un coup.
- Deplace le CSS du bloc <style> vers le fichier CSS du projet (style.css), sans changer son contenu.
- Si une classe ou un selecteur entre en conflit avec l'existant (body, h1, a, reset, .container...), prefixe les nouvelles classes (ex. .hero-...) plutot que de modifier le design.
- Conserve les liens externes (polices, icones) dans le <head>, sans doublons.
- Ne touche pas aux sections existantes qui ne sont pas concernees.

## CSS
- Utilise les variables CSS definies dans :root (couleurs, polices, espacements). N'invente pas de nouvelles valeurs en dur : ajoute une variable dans :root si necessaire et signale-le.
- Pas de !important sauf necessite justifiee.
- Approche mobile-first, avec media queries coherentes avec celles de la maquette.
- Unites : reprends celles de la maquette (rem, px, %, etc.).
- Une seule source de verite par style : pas de style inline si la maquette utilise des classes.

## HTML
- HTML5 semantique (header, nav, main, section, article, footer).
- Attribut alt sur toutes les images, hierarchie de titres coherente (un seul h1).
- Boutons <button>, liens <a> : pas de div cliquable.
- Indentation de 2 espaces, noms de classes en kebab-case.

## Accessibilite et responsive
- Contrastes lisibles, etats :hover, :focus-visible et :active presents sur les elements interactifs (si la maquette les definit, les reprendre tels quels).
- Verifier l'affichage mobile (360 px), tablette (768 px) et desktop (1280 px).

## Verification apres chaque modification
1. Indique la liste des fichiers modifies.
2. Signale tout ecart entre ton rendu et la maquette fournie.
3. Si je joins une capture de la maquette et une capture du site, compare-les et corrige uniquement les ecarts (espacements, polices, couleurs).
4. Ne reformule pas le code existant "pour l'ameliorer" sans que je le demande.
