// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

"use strict";

// Helpers
function control() { return host.namespace.Debugger.Utility.Control; }
function vars() { return host.namespace.Debugger.State.UserVariables; }
function print(str) { host.diagnostics.debugLog(str); }
function printAddr(str) { print(str.toString(16)); }
function printLn(str) { print(str + "\n"); }
function printObj(obj) { for (var prop in obj) { printLn(prop + ": " + obj[prop]); } }
function IsNullPtr(ptr) { return !ptr || ptr.address == 0; }
function IsEqualPtr(ptr1, ptr2) { return ptr1.address == ptr2.address; }

// Extract actual pointer from raw_ptr or WeakPtr wrappers.
function PtrUnpack(obj) {
  if (!obj) {
    return obj;
  }
  if (obj.targetType.toString().startsWith("base::raw_ptr")) {
    return obj.wrapped_ptr_;
  }
  if (obj.targetType.toString().startsWith("base::WeakPtr")) {
    return obj.ptr_;
  }
  return obj;
}

function createPointer(addr, module, type) {
  var ptr;
  try {
    ptr = host.createPointerObject(addr, module, type);
    return ptr;
  } catch (e) {
    ptr = null
  }
  // There is some flakiness with createPointerObject, retry.
  try {
    ptr = host.createPointerObject(addr, module, type);
    return ptr;
  } catch (e) {
    ptr = null
  }
  // Ignore the module for non component build.
  try {
    ptr = host.createPointerObject(addr, "msedge", type);
    return ptr;
  } catch (e) {
    ptr = null;
  }
  return ptr;
}

function isNotNull(x) {
  return x != null;
}

class StlString {
  //std::basic_string<wchar_t,std::char_traits<wchar_t>,std::allocator<wchar_t> >
  constructor(strAddress) {
    this.str = createPointer(
      strAddress,
      "msedge",
      "std::basic_string<wchar_t,std::char_traits<wchar_t>,std::allocator<wchar_t> >*");
  }

  toString() {
    if (this.str._Mypair._Myval2._Myres < 16) {
      var name = host.memory.readString(this.str.address);
      return '"' + name + '"';
    } else {
      var name = host.memory.readString(this.str._Mypair._Myval2._Bx._Ptr.address);
      return '"' + name + '"';
    }
  }
}

class ClassProperty {
  constructor(node) {
    this.raw = node.Value;
    this.Name = host.memory.readString(node.Value.__cc_.second.name);
    this.__value = node.Value.__cc_.second.value;

    // Apply special typing for known keys.
    switch (this.Name) {
      case "kNameKey":
        try {
          var str = host.memory.readString(this.__value);
          this.Value = str;
        } catch (err) { }
        break;
      case "kChildWindowVisibilityChangesAnimatedKey":
        this.Value = Boolean(this.__value);
        break;
      case "kDesktopNativeWidgetAuraKey":
      case "kNativeWidgetPrivateKey":
        var widget = createPointer(this.__value, "msedge", "views::DesktopNativeWidgetAura*")
        this.Value = new Widget(widget, "widget");
        break;
      default:
        this.Value = "0x" + this.__value.toString(16);
    }
  }

  toString() {
    return this.Name + "  :  " + this.Value;
  }
}

class StlTreeNode {
  constructor(module, type, node, parentStlTreeNode = null) {
    //printLn("Creating StlTreeNode: node="+node.targetLocation);
    this.Node = createPointer(
      node.address,
      module,
      type);

    if (!this.Node.__left_.isNull) {
      this.Left = new StlTreeNode(module, type, this.Node.__left_, this);
    }

    if (!this.Node.__right_.isNull) {
      this.Right = new StlTreeNode(module, type, this.Node.__right_, this);
    }

    this.Parent = parentStlTreeNode;
    this.Value = this.Node.__value_;
  }

  toString() {
    return "Node=" + this.Node.targetLocation;
  }

  equals(stlTreeNode) {
    return stlTreeNode && this.Node.address == stlTreeNode.Node.address;
  }
}

class StlTree {
  constructor(module, type, tree) {
    this.tree = tree;

    this.Size = this.tree.__pair3_.__value_;

    // This is the top of the tree. It is not the first node (that's the left-most).
    // this.root = new StlRootTreeNode(tree.__pair1_.__value_.__left_);
    if (this.Size > 0) {
      this.RootNode = new StlTreeNode(module, 
                      type, 
                      this.tree.__pair1_.__value_.__left_);
      this.Type = this.tree.__pair1_.__value_.__left_.targetType;
    }
  }

  dfs(node, arr) {
    if (node) {
      if (node.Left) {
        this.dfs(node.Left, arr);
      }
      arr.push(node);
      if (node.Right) {
        this.dfs(node.Right, arr);
      }
    }
  }

  asArray() {
    var arr = new Array();
    this.dfs(this.RootNode, arr);
    return arr;
  }
}

class StlMap {
  constructor(prop_map) {
    this.map = prop_map;
    this.__tree = new StlTree("ui_base", 
    "std::__Cr::__tree_node<std::__Cr::__value_type<const void *,ui::PropertyHandler::Value>,void *>*",
       this.map.__tree_);
    this.Properties = this.__tree.asArray().map(p => new ClassProperty(p));
    this.Size = this.__tree.Size;
  }

  *[Symbol.iterator]() {
    for (var prop of this.Properties) {
      yield prop;
    }
  }

  // Prints the kNameKey value from the properties map.
  toString() {
    for (var prop of this.Properties) {
      if (prop.Name == "kNameKey") {
        return "Size: " + this.Size + " " + prop.toString();
      }
    }
    if (this.Size == 0) {
      return "<empty>";
    } else {
      return "Size: " + this.Size;
    }
  }
}

class UiLayerTreeNode {
  constructor(uiLayer, level) {
    this.layer = uiLayer;
    this.__level = level;
  }
  toString() {
    return "  ".repeat(this.__level) + "Layer " + this.layer.name_ +
      " " + " Type: " + this.layer.type_ +
      " " + this.layer.bounds_ +
      " Visible: " + this.layer.visible_;
  }
}

class UiLayerTree {
  constructor(uiLayer) {
    this.layer = uiLayer.runtimeTypedObject;
    this.__children = [];
    this.populateChildren(this.layer);
  }
  populateChildren(uiLayer, level = 0) {
    for (let layer of uiLayer.children_) {
      let new_layer = layer.runtimeTypedObject;
      this.__children.push(new UiLayerTreeNode(new_layer, level));
      this.populateChildren(new_layer, level + 1);
    }
  }
  *[Symbol.iterator]() {
    for (let layer of this.__children) {
      yield layer;
    }
  }
}

class ViewTreeNode {
  constructor(view, level) {
    this.view = view;
    this.__level = level;
  }
  toString() {
    return "  ".repeat(this.__level) + "View " + this.view.targetType +
      " " + this.view.bounds_ +
      " Visible: " + this.view.visible_;
  }
}

class ViewTree {
  constructor(view) {
    this.view = view.dereference().runtimeTypedObject;
    this.__children = [];
    this.populateChildren(this.view);
  }
  populateChildren(view, level = 0) {
    for (let child of view.children_) {
      let new_child = child.runtimeTypedObject;
      this.__children.push(new ViewTreeNode(new_child, level));
      this.populateChildren(new_child, level + 1);
    }
  }
  *[Symbol.iterator]() {
    for (let child of this.__children) {
      yield child;
    }
  }
}

class UiLayer {
  constructor(uiLayer) {
    this.layer = uiLayer.runtimeTypedObject;
    this.Name = this.layer.name_;
  }

  get Parent() {
    if (!this.layer.parent_.isNull) {
      return new UiLayer(PtrUnpack(this.layer.parent_));
    }
  }

  get Delegate() {
    if (!this.layer.delegate_.isNull) {
      if (this.layer.delegate_.runtimeTypedObject.targetType == "aura::Window") {
        return new AuraWindow(this.layer.delegate_);
      } else {
        return new View(this.layer.delegate_);
      }
    }
  }

  *[Symbol.iterator]() {
    for (var layer of this.layer.children_) {
      yield new UiLayer(PtrUnpack(layer));
    }
  }

  toString() {
    printLn("Layer: " + this.Name);
    var str = "Layer " + this.layer.name_ + " " + this.layer.bounds_;
    if (this.Delegate) {
      str += " Parent(" + this.Delegate.Parent + ")";
    }
    return str;
  }
}

class View {
  constructor(view) {
    this.view = view.runtimeTypedObject;

    this.Address = this.view.address;
    this.Id = this.view.id_;
    this.Bounds = this.view.bounds_;
    this.Visible = Boolean(this.view.visible_);
  }

  get PropertyMap() {
    if (!this.view.runtimeTypedObject.prop_map_.isNull) {
      return new StlMap(this.view.runtimeTypedObject.prop_map_);
    }
  }

  get Parent() {
    if (!PtrUnpack(this.view.parent_).isNull) {
      return new View(PtrUnpack(this.view.parent_));
    }
  }

  *[Symbol.iterator]() {
    for (var child of this.view.children_) {
      yield new View(child);
    }
  }

  toString() {
    return "View: " + this.view.targetType;
  }
}

class Compositor {
  constructor(compositor) {
    this.compositor = compositor;
  }

  get RootLayer() {
    return new UiLayer(PtrUnpack(this.compositor.root_layer_))
  }
}

class Widget {
  constructor(widget) {
    this.widget = widget.runtimeTypedObject;
    // this.PropertyMap = new StlMap(this.widget.prop_map_);
  }

  get Name() {
    return this.widget.name_;
  }

  get RootView() {
    var rootview = PtrUnpack(PtrUnpack(this.widget.browser_frame_).dereference().root_view_);
    return new View(rootview);
  }

  toString() {
    return "Widget: " + this.Name;
  }
}

class AuraWindow {
  constructor(window,level = 0) {
    this.window = window.runtimeTypedObject;
    this.PropertyMap = new StlMap(this.window.prop_map_);
    this.__level = level;
    var widget = this.findNativeWidget();
    this.Name = "Unknown";
    if (widget != null) {
      this.Widget = widget;
      this.Name  = this.Widget.Name;
    } else {
      for (var prop of this.PropertyMap.Properties) {
        if (prop.Name == "kNameKey") {
          this.Name = prop.Value;
        }
      }
    }
  }

  *[Symbol.iterator]() {
    for (var child of this.window.children_) {
      yield new AuraWindow(PtrUnpack(child));

    }
  }

  findNativeWidget() {
    for (var prop of this.PropertyMap.Properties) {
      if (prop.Name == "kNativeWidgetPrivateKey" || prop.Name == "kDesktopNativeWidgetAuraKey") {
        return prop.Value; // This should be a Widget already.
      }
    }
    return null;
  }

  toString() {
    return "  ".repeat(this.__level) + "Aura Window: " + this.Name + " " + this.window.type_ + " visible: " + this.window.visible_ + " " + this.window.bounds_;
  }
}

class AuraWindowTree {
  constructor(window) {
    this.window = window.runtimeTypedObject;
    this.__children = [];
    this.populateChildren(this.window);
  }
  populateChildren(window, level = 0) {
    for (let child of window.children_) {
      let new_child = PtrUnpack(child).runtimeTypedObject;
      this.__children.push(new AuraWindow(new_child, level));
      this.populateChildren(new_child, level + 1);
    }
  }
  *[Symbol.iterator]() {
    for (var child of this.__children) {
      yield child;
    }
  }
}

class EdgeCommandLine {
  constructor() {
    this.__commandLine = host.namespace.Debugger.LastEvent.Process.Attributes.CommandLine;
  }

  getCommandLinePart(part) {
    var commandLine = this.__commandLine;
    var partStartOffset = commandLine.indexOf("--" + part + "=");
    if(partStartOffset == -1) {
      return "";
    }

    commandLine = commandLine.substring(partStartOffset + part.length + 3);

    var partEndOffset = commandLine.indexOf(" ");
    commandLine = commandLine.substring(0, partEndOffset);

    return commandLine.trim();
  }

  get FullCommandLine() {
    return this.__commandLine;
  }

  get ProcessName() {
    var processPathStartOffset = 1;
    var processPathEndOffset = this.__commandLine.indexOf("\"", processPathStartOffset);
    var processPath = this.__commandLine.substring(processPathStartOffset, processPathEndOffset);
    var processNameStartOffset = processPath.lastIndexOf("\\");
    return processPath.substring(processNameStartOffset + 1).trim();
  }

  isEdgeProcess() {
    return this.ProcessName.startsWith("msedge");
  }

  get ProcessType() {
    var processTypeArg = this.getCommandLinePart("type");
    if(processTypeArg != "") {
      return processTypeArg;
    } else {
      if(this.isEdgeProcess())
        return "browser";
      else
        return "";
    }
  }

  get ProcessSubType() {
    var processType = this.ProcessType;
    var processSubTypeArgument = "";
    switch(processType) {
      case "renderer":
        processSubTypeArgument = "renderer-sub-type";
      case "utility":
        processSubTypeArgument = "utility-sub-type";
    }

    var processSubType = "";
    if(processSubTypeArgument != "") {
      processSubType = this.getCommandLinePart(processSubTypeArgument);
    }

    return processSubType;
  }

  get Language() {
    return this.getCommandLinePart("lang");
  }

  get SandboxType() {
    return this.getCommandLinePart("service-sandbox-type");
  }
}

class KeepAliveRegistry {
  constructor(keepAliveRegistry) {
    this.__keepAliveRegistry = keepAliveRegistry;
  }

  get KeepAliveRegistry() {
    return this.__keepAliveRegistry;
  }

  get keep_alive_details_() {
    return this.__keepAliveRegistry.keep_alive_details_;
  }

  get registered_keep_alives_() {
    return this.__keepAliveRegistry.registered_keep_alives_;
  }

  get restart_allowed_keep_alives_() {
    return this.__keepAliveRegistry.restart_allowed_keep_alives_;
  }

  get is_shutting_down_() {
    return this.__keepAliveRegistry.is_shutting_down_;
  }

  get is_restarting_() {
    return this.__keepAliveRegistry.is_restarting_;
  }

  get on_shutdown_starting_() {
    return this.__keepAliveRegistry.on_shutdown_starting_;
  }

  get user_controlled_keepalive_count_() {
    return this.__keepAliveRegistry.user_controlled_keepalive_count_;
  }
}

function ensureKeepAliveRegistry() {
  if (vars().keepAliveRegistry == undefined) {
    var getInstanceOutput = control().ExecuteCommand("x /0 msedge!KeepAliveRegistry::GetInstance");
    if (getInstanceOutput.Count() >= 1) {
      var address = getInstanceOutput[0].trim();
      var typecastOutput = control().ExecuteCommand("dx -r1 ((msedge!base::Singleton<KeepAliveRegistry,base::DefaultSingletonTraits<KeepAliveRegistry>,KeepAliveRegistry> *)0x" + address + ")");
      if(typecastOutput.Count() == 2) {
        var addressStartIndex = typecastOutput[1].indexOf("[");
        var addressEndIndex = typecastOutput[1].indexOf("]");
        if(addressStartIndex < addressEndIndex) {
          var typecastAddress = typecastOutput[1].substring(addressStartIndex + 2, addressEndIndex);
          var singletonAddressOutput = control().ExecuteCommand("dp " + typecastAddress + " L1");
          if(singletonAddressOutput.Count() == 1) {
            var singletonAddressStart = singletonAddressOutput[0].indexOf(" ");
            var singletonAddress = singletonAddressOutput[0].substring(singletonAddressStart).trim();
            var singletonAddressAsNumber = host.parseInt64(singletonAddress, 16);
            if(singletonAddressAsNumber > 0) {
              var keepAliveRegistryPtr = createPointer(singletonAddressAsNumber, "msedge", "KeepAliveRegistry*");
              vars().keepAliveRegistry = keepAliveRegistryPtr.dereference();
            } else {
              printLn("KeepAliveRegistry singleton address is NULL. Is this a browser process? KeepAliveRegistry is only valid on browser processes.");
            }
          } else {
            printLn("Failed to get KeepAliveRegistry singleton address: " + singletonAddressOutput);
          }
        } else {
          printLn("Invalid output from typecast for KeepAliveRegistry instance: " + typeCastOutput[1]);
        }
      } else {
        printLn("Typecast for KeepAliveRegistry instance failed: " + typeCastOutput[0]);
      }
    } else {
      print("Cannot find KeepAliveRegistry instance address, a common reason is load msedge.dll symbol timeout. Try !reload -f msedge.dll? \n");
    }
  }
}

class BrowserProcess {
  constructor(browserProcess) {
    this.__browserProcess = browserProcess;
  }

  get BrowserProcessImpl() {
    return this.__browserProcess;
  }

  get profile_manager_ () {
    return this.__browserProcess.profile_manager_;
  }

  get background_mode_manager_ () {
    return this.__browserProcess.background_mode_manager_;
  }

  get startup_boost_manager_ () {
    return this.__browserProcess.startup_boost_manager_;
  }

  get locale_ () {
    return this.__browserProcess.locale_;
  }
}

function ensureBrowserProcess() {
  if(vars().browserProcess == undefined) {
    var getBrowserProcessAddress = control().ExecuteCommand("x msedge!g_browser_process");
    if (getBrowserProcessAddress.Count() == 1) {
      var browserProcessAddressStartOffset = getBrowserProcessAddress[0].indexOf("=");
      var browserProcessAddress = getBrowserProcessAddress[0].substring(browserProcessAddressStartOffset + 1).trim();
      var browserProcessAddressAsNumber = host.parseInt64(browserProcessAddress, 16);
      if(browserProcessAddressAsNumber > 0) {
        var browserProcessPtr = createPointer(browserProcessAddressAsNumber, "msedge", "BrowserProcessImpl*");
        vars().browserProcess = browserProcessPtr.dereference();
      } else {
        printLn("Browser Process object address is NULL. Is this a browser process?");
      }
    } else {
      print("Cannot find Browser Process object address, a common reason is load msedge.dll symbol timeout. Try !reload -f msedge.dll? \n");
    }
  }
}

class Browser {
  constructor(browser) {
    // Add 'raw' pointer
    this.raw = PtrUnpack(browser);

    // Add the BrowserView 'rootView' pointer
    this.rootView = createPointer(PtrUnpack(this.raw.window_).address, "msedge", "BrowserView*");
    this.frame = PtrUnpack(this.rootView.frame_);
    this.native_widget = this.__native_widget = PtrUnpack(PtrUnpack(this.rootView.frame_).native_widget_).runtimeTypedObject;
    this.native_widget_type = (this.__native_widget.runtimeTypedObject.targetType);
    if (!PtrUnpack(this.__native_widget.desktop_window_tree_host_)) return;
    this.desktop_window_tree_host = this.__desktop_window_tree_host = PtrUnpack(this.__native_widget.desktop_window_tree_host_).runtimeTypedObject;
    this.Compositor = new Compositor(PtrUnpack(this.__desktop_window_tree_host.compositor_).value());
  }

  get AuraWindow() {
    if (!this.__desktop_window_tree_host) return null;
    return new AuraWindow(PtrUnpack(this.__desktop_window_tree_host.window_));
  }

  get AuraWindowTree() {
    if (!this.__desktop_window_tree_host) return null;
    return new AuraWindowTree(PtrUnpack(this.__desktop_window_tree_host.window_));
  }

  toString() {
    var hwnd = PtrUnpack(PtrUnpack(PtrUnpack(this.Compositor).compositor).widget_).address;
    var output = host.namespace.Debugger.Utility.Control.ExecuteCommand("!shlexts.hwnd " + hwnd.toString(16));
    return "Browser Window: " + output[0].toString();
  }
}
class BrowserList {
  constructor(browserList) {
    this.__browserList = browserList;
  }

  *[Symbol.iterator]() {
    for (var browser of this.__browserList.browsers_) {
      yield new Browser(browser);
    }
  }
}

class WebContent{
  constructor(addr){
    this.raw = addr;
    this.__controller = addr.runtimeTypedObject.primary_frame_tree_.navigator_.controller_;
    this.__lastentry = this.__controller.last_committed_entry_index_;
    this.url = this.__controller.entries_[this.__lastentry].__ptr_.__value_.frame_tree_.__ptr_.__value_.frame_entry.ptr_.url_;
  }
  toString()
  {
    return this.url;
  }
}
class TabModel {
  constructor(tabModel) {
    this.__content = tabModel.__ptr_.__value_.dereference().contents_.__ptr_.__value_.dereference();
    this.webContent = new WebContent(this.__content);
  }
  toString()
  {
    return "Tab: " + this.webContent.toString();
  }
}
class TabStrips {
  constructor(browser) {
    // Add 'raw' pointer
    this.raw = PtrUnpack(browser);
    this.__contents_data = this.raw.dereference().tab_strip_model_.__ptr_.__value_.dereference().contents_data_;
  }
  *[Symbol.iterator]() {
      for (var model of this.__contents_data) {
        yield new TabModel(model);
      }
    }
}
class BrowserTabs {
  constructor(browserList) {
    this.__browserList = browserList;
  }

  *[Symbol.iterator]() {
    for (var browser of this.__browserList.browsers_) {
      yield new TabStrips(browser);
    }
  }
}

function ensureBrowserList() {
  if (vars().browserList == undefined) {
    var output = control().ExecuteCommand("x /0 msedge!BrowserList::instance_");
    if (output.Count() == 1) {
      var address = output[0].trim();
      var addressAsNumber = host.parseInt64(address, 16);
      // store as customer variable
      vars().browserListAddress = addressAsNumber;
      var browserListPtrPtr = createPointer(addressAsNumber, "msedge", "BrowserList**");
      var browserList = browserListPtrPtr.dereference().dereference();
      vars().browserList = browserList;
    } else {
      print("Cannot find browserList Address, a common reason is load msedge.dll symbol timeout. Try !reload -f msedge.dll? \n");
    }
  }
}

class CharAllocator {
  constructor(charAllocator, type) {
    this.__charAllocator = charAllocator;
    this.__storage_size = this.__charAllocator.storage_.size();
    this.__type = type;
  }

  get Size() {
    return this.__charAllocator.size_;
  }

  // Explanation for how char allocator works:
  // https://source.chromium.org/chromium/chromium/src/+/main:cc/base/list_container_helper.cc
  // CharAllocator has a vector of pointers to InnerList.
  //
  // InnerList
  // Each inner list is a flat array of elements where elements are sized to be the max size of
  // the most derived type that is being stored in the CharAllocator.
  // That max size is stored both in the inner list and char allocator as element_size_.
  // Each inner list has a capacity and a size.
  //
  // To iterate over a CharAllocator all we need to do is to step over in each inner list by
  // element size and once we run out of size elements in the inner list,
  // move to the next inner list.
  //
  // Limitations: There is alignment that also needs to be taken into account, that this code
  // does not but does seem to not matter for our purposes. Alignment was 8 under the debugger.
  *[Symbol.iterator]() {
    let storage_index = 0;
    let current_storage_capacity = this.__charAllocator.storage_[storage_index].size;
    let ptr = createPointer(this.__charAllocator.storage_[storage_index].data.address, "msedge", "void**");
    let current_storage_base = ptr.dereference().address;
    let current_storage_index = 0;
    for (let i = 0; i < this.__charAllocator.size_; i++) {
      let address = current_storage_base + current_storage_index * this.__charAllocator.element_size_;
      let quad = createPointer(address, "cc", this.__type);
      if ("viz::DrawQuad*" == this.__type) {
        // Print this hint about the quad to easily find the quad of interest.
        print("Quad: " + quad.material.toString() + " rect: " + quad.rect.toString());
      }
      yield quad;
      current_storage_index++;
      if (current_storage_index >= current_storage_capacity) {
        storage_index++;
        if (storage_index < this.__storage_size) {
          current_storage_capacity = this.__charAllocator.storage_[storage_index].size;
          ptr = createPointer(this.__charAllocator.storage_[storage_index].data.address, "msedge", "void**");
          current_storage_base = ptr.dereference().address;
          current_storage_index = 0;
        }
      }
    }
  }

  toString() {
    return this.__type + " size: " + this.__charAllocator.size_;
  }
}

class RenderPass {
  constructor(addr) {
    this.__render_pass = addr.__ptr_.__value_.dereference();
    this.quad_list = new CharAllocator(this.__render_pass.quad_list.helper_.data_.__ptr_.__value_.dereference(), "viz::DrawQuad*");
    this.shared_quad_state_list = new CharAllocator(this.__render_pass.shared_quad_state_list.helper_.data_.__ptr_.__value_.dereference(), "viz::SharedQuadState*");
  }

  toString() {
    return "RenderPass with " + this.quad_list.Size + " quads";
  }
}

class CompositorFrame{
  constructor(addr){
    this.__render_pass_count = addr.render_pass_list.size();
    this.__frame = addr;
  }

  *[Symbol.iterator]() {
    for (let i = 0; i < this.__render_pass_count; i++) {
      yield new RenderPass(this.__frame.render_pass_list[i]);
    }
  }
}

function ensureFeatureList() {
  if(vars().featureList == undefined) {
    var getFeatureListAddress = control().ExecuteCommand("x msedge!base::`anonymous namespace'::g_feature_list_instance");
    if (getFeatureListAddress.Count() == 1) {
      var featureListAddressStartOffset = getFeatureListAddress[0].indexOf("=");
      var fetureListAddress = getFeatureListAddress[0].substring(featureListAddressStartOffset + 1).trim();
      var featureListAddressAsNumber = host.parseInt64(fetureListAddress, 16);
      if(featureListAddressAsNumber > 0) {
        var featureListPtr = createPointer(featureListAddressAsNumber, "msedge", "base::FeatureList*");
        vars().featureList = featureListPtr.dereference();
      }
    } 
    if (vars().featureList == undefined) {
      print("Cannot find feature list address, a common reason is load msedge.dll symbol timeout. Try !reload -f msedge.dll? \n");
    }
  }
}

class FirstRunStatus {
  constructor(node) {
    this.raw = node.Value;
    this.Name = node.Value.__cc_.first;
    this.value = node.Value.__cc_.second.enabled;
  }

  toString() {
    return this.Name + "  :  " + this.value;
  }
}

class Override {
  constructor(override) {
    this.raw = override;
  }
  
  toString() {
    return "Name:" + this.raw.first;
  }
}
class FeatureList{
  constructor(featureList){
    this.featureList = featureList;
    this.overrides = featureList.overrides_.body_;
    this.__first_run_features = new StlTree("ui_base", 
          "std::__Cr::__tree_node<std::__Cr::__value_type<std::__Cr::basic_string<char,std::__Cr::char_traits<char>,std::__Cr::allocator<char> >,base::FeatureList::FirstRunFeatureState>,void *> *",
          featureList.first_run_features_state_.__tree_);
    this.firstrunfeature = this.__first_run_features.asArray().map(p => new FirstRunStatus(p));
  }

  toString() {
    return this.firstrunfeature;
  }

  *[Symbol.iterator]() {
    for (let override of this.overrides) {
      yield new Override(override);
    }
  }
}

function isProcessType(type) {
  var edgeCommandLine = new EdgeCommandLine();
  return edgeCommandLine.ProcessType == type;
}

function dumpBrowserWindows() {
  ensureBrowserList();
  return new BrowserList(vars().browserList);
}

function dumpBrowserTabs() {
  ensureBrowserList();
  return new BrowserTabs(vars().browserList);
}

function dumpString(strAddress) {
  return new StlString(strAddress);
}

function dumpView(addr) {
  return new View(createPointer(addr, "views", "views::View*"));
}

function dumpWidget(addr) {
  return new Widget(createPointer(addr, "views", "views::Widget*"));
}

function dumpLayer(addr) {
  return new UiLayer(createPointer(addr, "compositor", "ui::Layer*"));
}

function dumpLayerTree(addr) {
  return new UiLayerTree(createPointer(addr, "compositor", "ui::Layer*"));
}

function dumpViewTree(addr) {
  return new ViewTree(createPointer(addr, "views", "views::View*"));
}

function dumpWebContent(addr) {
  return new WebContent(createPointer(addr, "content", "content::WebContentsImpl*"));
}

function dumpQuadListCharAllocator(addr) {
  return new CharAllocator(createPointer(addr, "cc", "cc::ListContainerHelper::CharAllocator*"), "viz::DrawQuad*");
}

function dumpSharedQuadStateCharAllocator(addr) {
  return new CharAllocator(createPointer(addr, "cc", "cc::ListContainerHelper::CharAllocator*"), "viz::SharedQuadState*");
}

function dumpAggregatedFrame(addr) {
  return new CompositorFrame(createPointer(addr, "cc", "viz::AggregatedFrame*"));
}

function dumpCommandLineDetails() {
  return new EdgeCommandLine();
}

function dumpFeatureList() {
  ensureFeatureList();
  return new FeatureList(vars().featureList);
}

// BROWSER process commands
function dumpKeepAliveDetails() {
  if(!isProcessType("browser"))
    printLn("WARNING: This command is only valid on BROWSER process.");

  ensureKeepAliveRegistry();
  return new KeepAliveRegistry(vars().keepAliveRegistry);
}

function dumpBrowserProcessDetails() {
  if(!isProcessType("browser"))
    printLn("WARNING: This command is only valid on BROWSER process.");

  ensureBrowserProcess();
  return new BrowserProcess(vars().browserProcess);
}

function getShutdownDetails() {
  if(!isProcessType("browser"))
    printLn("WARNING: This command is only valid on BROWSER process.");

    var getBrowserShutdownTryingToQuit = control().ExecuteCommand("x msedge!browser_shutdown::`anonymous namespace'::g_trying_to_quit");
    printLn("Trying to quit: " + getBrowserShutdownTryingToQuit[0]);

    var getBrowserShutdownShutdownType = control().ExecuteCommand("x msedge!browser_shutdown::`anonymous namespace'::g_shutdown_type");
    printLn("Shutdown Type:  " + getBrowserShutdownShutdownType[0]);
}

// GPU process commands
function dumpGraphicsDeviceResourceDetails() {
  if(!isProcessType("gpu-process"))
    printLn("WARNING: This command is only valid on GPU process.");

  var d3ddevicelist = host.namespace.Debugger.State.FunctionAliases.d3ddevicelist();
  var resources = d3ddevicelist.First().Children.Filters().Resources;
  return resources;
}

function invokeScript() {
  printLn("Welcome to MsEdge.js debugger extension...");
  printLn("Commands:");
  printLn("  !dumpAggregatedFrame addr               dumps a viz::AggregatedFrame* at addr");
  printLn("  !dumpBrowserProcessDetails              dumps details of the BrowserProcess object");
  printLn("  !dumpBrowserTabs                        dumps tabs in browser windows");
  printLn("  !dumpBrowserWindows                     dumps all browser windows");
  printLn("  !dumpCommandLineDetails                 dumps details of command line");
  printLn("  !dumpFeatureList                        dumps details of feature list");
  printLn("  !dumpGraphicsDeviceResourceDetails      get details of the allocated graphics device resources");
  printLn("  !dumpKeepAliveDetails                   dumps details of registered keep-alives");
  printLn("  !dumpLayer addr                         dumps a ui::Layer* at addr");
  printLn("  !dumpLayerTree addr                     dumps a ui::Layer* tree at addr");
  printLn("  !dumpQuadListCharAllocator addr         dumps a cc::ListContainerHelper::CharAllocator* of qudas at addr");
  printLn("  !dumpSharedQuadStateCharAllocator addr  dumps a cc::ListContainerHelper::CharAllocator* of shared quad states at addr");
  printLn("  !dumpString addr                        dumps a string at addr");
  printLn("  !dumpView addr                          dumps a views::View* at addr");
  printLn("  !dumpViewTree addr                      dumps a views::View* tree at addr");
  printLn("  !dumpWebContent addr                    dumps a content::WebContents at addr");
  printLn("  !dumpWidget addr                        dumps a views::Widget* at addr");
  printLn("  !getShutdownDetails                     get details about the browser shutdown state");
  printLn("More help:");
  printLn("  https://microsoft.visualstudio.com/Edge/_wiki/wikis/Edge.wiki/47099/Msedge.js-WinDbg-Debugger-Extension")
  printLn("Ready!");
}

function initializeScript() {
  return [
    new host.apiVersionSupport(1, 3),
    new host.functionAlias(dumpAggregatedFrame, "dumpAggregatedFrame"),
    new host.functionAlias(dumpBrowserProcessDetails, "dumpBrowserProcessDetails"),
    new host.functionAlias(dumpBrowserTabs, "dumpBrowserTabs"),
    new host.functionAlias(dumpBrowserWindows, "dumpBrowserWindows"),
    new host.functionAlias(dumpCommandLineDetails, "dumpCommandLineDetails"),
    new host.functionAlias(dumpFeatureList, "dumpFeatureList"),
    new host.functionAlias(dumpGraphicsDeviceResourceDetails, "dumpGraphicsDeviceResourceDetails"),
    new host.functionAlias(dumpKeepAliveDetails, "dumpKeepAliveDetails"),
    new host.functionAlias(dumpLayer, "dumpLayer"),
    new host.functionAlias(dumpLayerTree, "dumpLayerTree"),
    new host.functionAlias(dumpQuadListCharAllocator, "dumpQuadListCharAllocator"),
    new host.functionAlias(dumpSharedQuadStateCharAllocator, "dumpSharedQuadStateCharAllocator"),
    new host.functionAlias(dumpString, "dumpString"),
    new host.functionAlias(dumpView, "dumpView"),
    new host.functionAlias(dumpViewTree, "dumpViewTree"),
    new host.functionAlias(dumpWidget, "dumpWidget"),
    new host.functionAlias(dumpWidget, "dumpWebContent"),
    new host.functionAlias(getShutdownDetails, "getShutdownDetails"),
   
  ];
}
