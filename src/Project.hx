package;

import haxe.ui.core.Screen;
import haxe.ui.Toolkit;
import ceramic.Entity;
import ceramic.Color;
import ceramic.InitSettings;

class Project extends Entity {
  function new(settings: InitSettings) {
    super();

    settings.antialiasing = 2;
    settings.background = Color.BLACK;
    settings.targetWidth = 640;
    settings.targetHeight = 480;
    settings.scaling = FIT_RESIZE;
    settings.resizable = true;

    app.onceReady(this, ready);
  }

  function ready() {
    // Set MainScene as the current scene (see MainScene.hx)
    var scene = new MainScene();
    app.scenes.main = scene;
    Toolkit.init();
    Toolkit.theme = 'dark';
    var mainView = new MainView();
    scene.mainView = mainView;
    Screen.instance.addComponent(mainView);
  }
}
