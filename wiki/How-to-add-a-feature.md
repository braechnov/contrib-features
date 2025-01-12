### :rocket: Create / Copy an existing feature-definition.json file

Input for feature generation is a [`feature-definition.json`](https://github.com/devcontainers-contrib/features/wiki/feature-definition) file. See [feature-definition folder](https://github.com/devcontainers-contrib/features/tree/main/feature_definitions) for examples. 

Although you can write one from scratch, usually its easier find an existing feature definition which is installed in a similar manner to your own, and copy it as a baseline to the same same [feature-definition folder](https://github.com/devcontainers-contrib/features/tree/main/feature_definitions) 

Dont forget to edit the relevant portions! (`id`, `description`, `name` etc)

### :arrow_down: Install the DContainer CLI tool

```sh
pipx install dcontainer[generate]
```

### :building_construction: Generate

Use `dcontainer` in order to generate a feature src and test folders by using the `dcontainer feature generate` command

```sh
dcontainer feature generate [OPTIONS]
                                                        FEATURE_DEFINITION
                                                        OUTPUT_DIR

Arguments:
  FEATURE_DEFINITION  [required]
  OUTPUT_DIR          [required]

Options:
  --help                          Show this message and exit.
```


#### Usage example

The following will generate the angular-cli feature 
It assumes you have the dcontainer cli already installed
Replace `angular-cli` with the id of your own feature definition

```sh
pipx install dcontainer[generate]

git clone https://github.com/devcontainers-contrib/features 
cd features

dcontainer feature generate "./feature_definitions/angular-cli/feature-definition.json" "."
```

Hurray! Your feature is now fully generated🎉

### :test_tube: Test

For testing your newly generated feature, use the official devcontainer cli program!

The following will test the angular-cli feature.

Replace `angular-cli` with the id of your own feature definition

```sh
npm install -g @devcontainers/cli

git clone https://github.com/devcontainers-contrib/features 
cd features

BUILDKIT_PROGRESS=plain devcontainer feature test -f angular-cli --skip-autogenerated
```

Note the flag `--skip-autogenerated`  is important. Without it `devcontainer` cli will atempt to run a default `test.sh` file which is not being created by DContainer (which prefers the more strict scenario based testing)
