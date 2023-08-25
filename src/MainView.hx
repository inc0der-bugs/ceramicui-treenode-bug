package;

import haxe.ui.events.UIEvent;
import haxe.ui.core.Screen;
import haxe.ui.containers.menus.Menu;
import haxe.ui.events.MouseEvent;
import haxe.ui.components.Button;
import haxe.ui.containers.menus.MenuItem;
import haxe.ui.containers.VBox;

@:build(haxe.ui.ComponentBuilder.build('../../assets/main-view.xml'))
class MainView extends VBox {
  public var button: Button;
  public var widthOnClick: Float;

  public function new() {
    super();
    var root1 = tv1.addNode({ text: "root A", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
    root1.expanded = true;
    // tv1.registerEvent(UIEvent.CHANGE, onNodeClick);
    var nodes = [];

    for (index in 0...10) {
      var node = root1.addNode({ text: 'Child A-$index', id: index });
      node.expanded = true;
      nodes.push(node);
    }

    for (index in 7...nodes.length) {
      var parentNode = nodes[index];
      parentNode.expanded = true;
      parentNode.addNode({ text: 'Child' });
    }

    for (node in nodes)
      node.onRightClick = onNodeRightClick;
    for (node in nodes)
      node.onClick = onNodeClick;
  }

  function onNodeRightClick(e) {
    if (tv1.selectedNode != null)
      trace(tv1.selectedNode.text);
  }

  function onNodeClick(e) {
    if (tv1.selectedNode != null)
      trace(tv1.selectedNode.text);
  }
}

@:xml('
<menu>
    <menu-item text="Cut" icon="icons/actions/cut.png" />
    <menu-item text="Copy" icon="icons/actions/copy.png" />
    <menu-item text="Paste" icon="icons/actions/paste.png" />
    <menu-separator />
    <menu-item text="Delete" icon="icons/actions/delete.png" />
</menu>
')
class CutCopyPasteMenu extends Menu {}
