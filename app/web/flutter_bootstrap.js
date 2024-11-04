{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  config: {
    entryPointBaseUrl: '/subpath/',
    assetBase: '/subpath/',
  },
  onEntrypointLoaded: async function onEntrypointLoaded(engineInitializer) {
    let engine = await engineInitializer.initializeEngine({
      multiViewEnabled: true, // Enables embedded mode.
    });
    let app = await engine.runApp();
    // Make this `app` object available to your JS app.
    app.addView({
        hostElement: document.querySelector('#flutter-element'),
      });
  }
});