# MoonBit Type Alias and Derive Trait Issue Reproduction

## Problem Description

There is an issue in MoonBit where when accessing types from other packages via type aliases (`typealias`), traits automatically implemented with `derive(Show)` on the original type cannot be used.

## How to Reproduce

```bash
moon run src/main.mbt
```

## Expected Error

```
Error: [4037]
   ╭─[ /home/coura/ghq/github.com/cou723/lyric/moonbit-derive-issue/src/main.mbt:6:27 ]
   │
 6 │   println("Data: " + data.to_string())  // ← This should cause an error
   │                           ────┬────  
   │                               ╰────── Cannot call method of type @cou723/derive-issue/lib.MyData: package cou723/derive-issue/lib is not imported.
───╯
```

## Problem Details

1. **lib/data.mbt**: `MyData` type is defined with `derive(Show)`
2. **wrapper/wrapper.mbt**: Creates a type alias with `typealias @lib.MyData as MyData`
3. **src/main.mbt**: Calling `.to_string()` on data obtained via wrapper causes an error

## Directory Structure

```
moonbit-derive-issue/
├── moon.mod.json
├── lib/
│   ├── moon.pkg.json
│   └── data.mbt              # MyData type with derive(Show)
├── wrapper/
│   ├── moon.pkg.json
│   └── wrapper.mbt           # Re-exports MyData with typealias  
└── src/
    ├── moon.pkg.json
    └── main.mbt              # Error when using Show via wrapper
```

## Question

Is this behavior correct as a MoonBit specification? Shouldn't derived traits of the original type be accessible even through type aliases?