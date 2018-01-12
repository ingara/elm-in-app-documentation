# Elm in-app documentaion example

This is an example of having in-app documentation for your own Elm code.

## Getting started

1. Install Elm and [elm-live](https://github.com/architectcodes/elm-live): `npm install -g elm elm-live`

Then either

1. `./start.sh` (or `./start.cmd` if on Windows)

or

1. `elm-package install`
1. `elm-live src/Main.elm --open --pushstate --dir=static --docs=static/docs.json --output=static/elm.js`

## Adding a new module

1. Add the module name to `exposed-modules` in `elm-package.json`
1. Add branches for previews in `Preview.elm`
