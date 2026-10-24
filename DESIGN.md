# 🎨 Système de Design - MémoSquare

Ce document définit les standards visuels et interactifs pour l'application **MémoSquare**. 
**Pour les assistants IA (Copilot, Cursor, etc.) :** Utilisez strictement ces valeurs, classes Tailwind et variables CSS pour générer de nouveaux composants. N'inventez pas de nouvelles couleurs ou espacements.

---

## 1. Philosophie & Thèmes

MémoSquare utilise une approche bicolore gérée par des variables CSS à la racine du projet. L'application possède deux thèmes stricts :
*   **Midnight Dark (Défaut) :** Un thème sombre profond orienté productivité (fonds bleu-gris très foncés).
*   **Notion Style (Attribut `data-theme="notion"`) :** Un thème clair épuré (fond blanc pur, sidebar beige/gris très clair, textes très foncés).

---

## 2. Palette de Couleurs (Variables CSS)

Les couleurs s'appuient sur la palette par défaut de Tailwind CSS, mais sont mappées sur des variables sémantiques pour gérer le switch de thème.

### Couleurs de Marque (Teal)
*   **Primary :** `#0d9488` (Teal-600)
*   **Primary Hover :** `#14b8a6` (Teal-500)
*   *Note pour le logo (Origami) : Utilise Teal-300, Teal-400, Teal-600, Teal-700 pour l'effet de profondeur.*

### Thème par défaut (Midnight Dark)
```css
:root {
  --color-bg: #0b1121;          /* Arrière-plan général */
  --color-sidebar: #111827;     /* Navigation gauche */
  --color-surface: #1f2937;     /* Panneau d'édition (droite) */
  --color-card: #1f2937;        /* Cartes du dashboard */
  --color-border: #374151;      /* Lignes et séparateurs (Slate-700) */
  --color-text: #f3f4f6;        /* Texte principal (Gris très clair) */
  --color-muted: #9ca3af;       /* Texte secondaire & Icônes (Gris moyen) */
  --color-primary: #0d9488;     /* Accentuation principale */
  --color-primary-hover: #14b8a6;
  --color-hover: #374151;       /* Survol générique (boutons icones, items menus) */
}
```

### Thème alternatif (Notion Style)
```css
[data-theme="notion"] {
  --color-bg: #ffffff;          /* Arrière-plan général */
  --color-sidebar: #f7f7f5;     /* Navigation gauche (Beige/gris Notion) */
  --color-surface: #ffffff;     /* Panneau d'édition */
  --color-card: #ffffff;        /* Cartes du dashboard */
  --color-border: #e9e9e7;      /* Bordures très douces */
  --color-text: #37352f;        /* Texte principal (Gris-noir Notion) */
  --color-muted: #787774;       /* Texte secondaire & Icônes */
  --color-primary: #0f766e;     /* Teal-700 (plus foncé pour contraste) */
  --color-primary-hover: #115e59;
  --color-hover: #efefef;       /* Survol générique */
}
```

---

## 3. Échelle Typographique

La police unique du projet est **Inter** (sans-serif).

### Poids (Font Weights)
*   `font-normal` (400) : Paragraphes, corps de texte.
*   `font-medium` (500) : Boutons, navigation sidebar, sous-titres.
*   `font-bold` (700) : Titres H1/H2, titres des cartes.
*   `font-black` (900) : Uniquement pour le texte du logo (memosquare).

### Tailles (Font Sizes - Tailwind scale)
*   `text-xs` (0.75rem / 12px) : Tags, dates, indicateur de stockage, tooltips.
*   `text-sm` (0.875rem / 14px) : Aperçu des notes, menus secondaires.
*   `text-base` (1rem / 16px) : Corps de texte de l'éditeur (défaut).
*   `text-lg` (1.125rem / 18px) : Titres de section (ex: "Notes Récentes").
*   `text-xl` (1.25rem / 20px) : Titres H2 / H3 dans l'éditeur.
*   `text-2xl` (1.5rem / 24px) : Titre principal des pages (ex: "Tableau de bord").
*   `text-3xl` (1.875rem / 30px) : Titre H1 dans l'éditeur de notes.

---

## 4. Grille d'Espacement & Architecture (Base 8px)

Le layout utilise la grille par défaut de Tailwind CSS basée sur des multiples de 4px, avec une forte préférence pour le système **Base 8px**.

*   `1` = 4px (Utilisé pour les petits gaps, ex: `gap-1` barre d'outils)
*   `2` = 8px (Paddings internes boutons icones, `p-2`)
*   `3` = 12px (Paddings items sidebar, `px-3`, `gap-3`)
*   `4` = 16px (Paddings standards cartes/panneaux, `p-4`, `mb-4`)
*   `6` = 24px (Gaps de la grille du dashboard, `gap-6`)
*   `8` = 32px (Paddings de section majeurs, `p-8`)
*   `16` = 64px (Hauteur des headers, `h-16`)

### Layout Principal
*   **Sidebar gauche :** Largeur fixe `w-64` (256px), flex-shrink-0.
*   **Main (Dashboard) :** Flex-1, overflow-y-auto.
*   **Sidebar droite (Éditeur) :** Largeur fixe `w-96` (384px), shadow-2xl.

---

## 5. États des Composants (UI States)

### Bouton d'Action Primaire (CTA)
*   **Défaut :** `bg-app-primary text-white font-medium rounded-xl shadow-sm`
*   **Hover :** `hover:bg-app-primary-hover`
*   **Focus :** `focus:outline-none focus:ring-2 focus:ring-app-primary focus:ring-offset-2` (offset adapté au background).
*   **Transition :** `transition-colors theme-transition`

### Boutons Sidebar & Barre d'outils (Icon + Texte / Icon Only)
*   **Défaut :** `text-app-muted rounded-lg`
*   **Hover :** `hover:bg-app-hover hover:text-app-text`
*   **Actif (Sélectionné) :** `text-app-text bg-app-hover font-medium` (Sidebar) ou `text-app-primary bg-app-hover` (Éditeur).
*   **Transition :** `transition-colors`

### Cartes (Dashboard)
*   **Défaut :** `bg-app-card border border-app-border rounded-xl p-5 shadow-sm`
*   **Hover :** `hover:border-app-muted hover:shadow-md cursor-pointer transition-all`
*   **Actif / Sélectionné :** `border-2 border-app-primary` (remplace la bordure standard).

### Radius (Arrondis)
*   `rounded` (4px) : Badges, petits tags.
*   `rounded-md` / `rounded-lg` (6px / 8px) : Boutons, items de menu, barre de recherche.
*   `rounded-xl` (12px) : Cartes de notes, dossiers, CTA principaux.
*   `rounded-full` (9999px) : Avatars, Floating Action Button (FAB).

---

## 6. Iconographie (SVG)
*   Toujours utiliser la classe `stroke-current` et éviter les attributs de couleurs en dur dans le SVG (sauf pour le logo).
*   Taille standard des icônes de navigation/action : `w-5 h-5`.
*   Épaisseur de trait (stroke-width) : `2` pour la majorité, `2.5` pour le CTA "+" ou les icônes très épurées.
*   `stroke-linecap="round"` et `stroke-linejoin="round"` obligatoires.