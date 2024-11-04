## Description

This repository contains a repro for https://github.com/flutter/flutter/issues/158041.

The Flutter `app/` code has already been compiled for the web and is available in
`web/public/subpath`.

To run it, do the following:

```
cd web/
npm install
npm run dev
```

You'll have an Astro site running at http://localhost:4321.

The Flutter app will load, but you'll see in the browser JS console that assets
can't be loaded.

```
GET http://localhost:4321/assets/FontManifest.json 404 (Not Found)
main.dart.js:18151 Font manifest does not exist at `assets/FontManifest.json` - ignoring.
```