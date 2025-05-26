# Extension Change

## Ltex

This extension will load ltex-ls failed. Edit `%USERPROFILE%\.vscode\extensions\valentjn.vscode-ltex-13.1.0\dist` to make sure ltex-ls be load successfully:

```diff
--- a/extension.js.old
+++ b/extension.js
@@ -13516,6 +13516,7 @@ class DependencyManager {
             const executableOptions = {
                 encoding: 'utf-8',
                 timeout: 15000,
+                shell: true
             };
             if (executable.options != null) {
                 executableOptions.cwd = executable.options.cwd;
@@ -13615,6 +13616,7 @@ class DependencyManager {
         const executableOptions = {
             encoding: 'utf-8',
             timeout: 15000,
+            shell: true
         };
         const childProcess = ((process.platform == 'win32')
             ? ChildProcess.spawnSync('wmic', ['process', 'list', 'FULL'], executableOptions)
@@ -24684,7 +24686,9 @@ class LanguageClient extends commonClient_1.CommonLanguageClient {
                     if (node.args) {
                         node.args.forEach(element => args.push(element));
                     }
-                    const execOptions = Object.create(null);
+                    const execOptions = {
+                        shell: true
+                    };
                     execOptions.cwd = serverWorkingDir;
                     execOptions.env = getEnvironment(options.env, false);
                     const runtime = this._getRuntimePath(node.runtime, serverWorkingDir);
@@ -24817,6 +24821,7 @@ class LanguageClient extends commonClient_1.CommonLanguageClient {
                 let args = command.args || [];
                 let options = Object.assign({}, command.options);
                 options.cwd = options.cwd || serverWorkingDir;
+                options.shell = true;
                 let serverProcess = cp.spawn(command.command, args, options);
                 if (!serverProcess || !serverProcess.pid) {
                     return Promise.reject(`Launching server using command ${command.command} failed.`);
```

Source: [vscode-ltex issue #884]

## PowerMode

The combo style of this extension is wrong. It should be showed at the right of screen, but it is showed at the left of screen. Edit `%USERPROFILE%\.vscode\extensions\hoovercj.vscode-power-mode-3.0.2\out\src\combo\editor-combo-meter.js` to make sure the combo style is correct:

```diff
--- "a/editor-combo-meter.js.old"
+++ "b/editor-combo-meter.js"
@@ -213,8 +213,10 @@ EditorComboMeter.DEFAULT_CSS = EditorComboMeter.objectToCssString({
     // NOTE: This positions the element off the screen when there is horizontal scroll
     // so this feature works best when "word wrap" is enabled.
     // Using "5vw" instead did not limit the position to the viewable width.
-    right: "5%",
-    top: "20px",
+    // right: "5%",
+    left: "calc(100vw - 25rem)",
+    // top: "20px",
+    top: "7rem",
     ['font-family']: "monospace",
     ['font-weight']: "900",
```

Source: [powermode issue #114]

[vscode-ltex issue #884]: https://github.com/valentjn/vscode-ltex/issues/884
[powermode issue #114]: https://github.com/hoovercj/vscode-power-mode/pull/114