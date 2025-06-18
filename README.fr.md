# 42-env [🇫🇷](#) | [🇺🇸](README.md)


**Une reproduction fidèle de l'environnement de développement de l'école 42 dans un conteneur.**

*42-env fournit un environnement de développement standardisé qui correspond à la configuration de l'école 42 Paris, assurant une cohérence entre différentes machines hôtes.*

## Prérequis

- Docker installé sur votre système
- VS Code avec l'extension Dev Containers (pour l'intégration VS Code)
- [XQuartz](https://formulae.brew.sh/cask/xquartz#default) (pour les utilisateurs macOS/Apple Silicon exécutant des applications graphiques)

## Options d'installation

### Option 1 : Conteneur de développement VS Code

La façon la plus simple d'utiliser 42-env est via la fonctionnalité Dev Containers de VS Code :

1. Clonez ce dépôt :
   ```bash
   git clone git@github.com:shiftwavedev/42-env.git
   ```

2. Copiez le répertoire .devcontainer dans votre projet :
   ```bash
   cp -r 42-env/.devcontainer /chemin/vers/votre_projet/
   ```

3. Ouvrez votre projet dans VS Code
   
4. Lorsque vous y êtes invité, sélectionnez "Réouvrir dans un conteneur" ou utilisez la Palette de commandes (F1 ou ⌘⇧P sur Mac) :
   - Tapez "Dev Containers: Reopen in Container"

VS Code va construire le conteneur et ouvrir votre projet avec tous les outils et paramètres de l'environnement 42 prêts à l'emploi.

<details>
<summary><strong>💻 Exécuter des applications GUI dans VS Code</strong></summary>
<br>

Pour les projets nécessitant MLX ou d'autres applications graphiques :

1. Installez XQuartz sur votre système hôte (si vous utilisez macOS) :
   ```bash
   brew install --cask xquartz
   ```

2. Avant de démarrer votre session VS Code, ouvrez un terminal et exécutez :
   ```bash
   xhost +localhost
   ```

3. Dans le fichier `.devcontainer/devcontainer.json`, assurez-vous que ces paramètres sont présents :
   ```json
   "containerEnv": {
     "DISPLAY": "host.docker.internal:0"
   }
   ```

4. Quand vous avez terminé votre session, vous pouvez restaurer les paramètres de sécurité avec :
   ```bash
   xhost -localhost
   ```
</details>

### Option 2 : Terminal/Ligne de commande

Si vous préférez travailler dans un terminal :

1. Clonez ce dépôt :
   ```bash
   git clone git@github.com:shiftwavedev/42-env.git
   ```

2. Construisez l'image Docker :
   ```bash
   docker build -t 42-env 42-env/.devcontainer/
   ```

3. Exécutez un conteneur avec votre projet monté :
   ```bash
   docker run -ti -v /chemin/vers/votre_projet:/app 42-env
   ```

   Tous les outils 42 (gcc, norminette, etc.) sont disponibles dans votre PATH.

<details>
<summary><strong>💻 Exécuter des applications GUI depuis le terminal</strong></summary>
<br>

Pour utiliser MLX ou d'autres applications graphiques depuis un conteneur lancé via terminal :

1. Installez XQuartz sur votre système hôte (si vous utilisez macOS) :
   ```bash
   brew install --cask xquartz
   ```

2. Avant de démarrer votre conteneur, ouvrez un terminal et exécutez :
   ```bash
   xhost +localhost
   ```

3. Lancez le conteneur avec la variable d'environnement DISPLAY :
   ```bash
   docker run -ti -e DISPLAY=host.docker.internal:0 -v /chemin/vers/votre_projet:/app 42-env
   ```

4. Quand vous avez terminé, vous pouvez restaurer les paramètres de sécurité avec :
   ```bash
   xhost -localhost
   ```
</details>

## Licence

Ce projet est distribué sous la [Licence MIT](LICENSE).