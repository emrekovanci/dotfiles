### How ClangD Works
- https://github.com/clangd/clangd/issues/364#issuecomment-623417783
- https://github.com/clangd/clangd/discussions/1601

### Semantic Highlighting

https://clangd.llvm.org/features#semantic-highlighting

```json
"editor.semanticTokenColorCustomizations": {
  "rules": {
    "*.defaultLibrary": {
      "fontStyle": "underline"
    }
  }
}
```

### Failed to compile *.cpp, index may be incomplete

- default

  ```powershell
  clangd --check=<path_to_cpp> --log=verbose > clangd-log.log 2>&1
  ```

- with `check-locations`

  ```powershell
  clangd --check=<path_to_cpp> --check-locations=false --log=verbose > clangd-log.log 2>&1
  ```

### Trace
 ```json
"clangd.trace": "${workspaceFolder}/trace.json"
 ```
