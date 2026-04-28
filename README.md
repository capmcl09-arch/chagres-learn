# Geography HQ

Flutter Web site for Geography HQ, the educational apparatus of the Chagres Initiative. The first version focuses on geography as exploration and discovery, participatory research mapping, field geography, and beginner-friendly explanations of how PRM works.

## Local Development

```bash
flutter pub get
flutter run -d chrome
```

## Build

```bash
flutter build web --release --base-href /
```

The site is configured for the custom domain:

```text
learn.chagresinitiative.org
```

GitHub Pages deployment is handled by `.github/workflows/deploy.yml`.