# Pkl Workshop: Using Pkl to tame your configuration web

> [!NOTE]
> This repository holds materials for attendees of the Pkl Workshop at KubeCon NA 2026.
> We are not looking for pull requests or any other contributions.

Welcome to the Pkl workshop, we're excited to have you!

You will need to set up your machine to be able to follow along with our presentation.
By the end of setup, you should have this repository opened in an editor, with the Pkl plugin installed.

## 1. Clone this repo

We will be working off of this repository.
To start, first clone this repo into your local machine.

```bash
git clone https://github.com/apple/pkl-workshop.git
```

## 2. Install the `pkl` CLI

The Pkl CLI can be downloaded in one of many ways.
Here are some commons ways to do it:

```bash
# install using Homebrew
brew install pkl

# install using Mise
mise use -g apple/pkl

# install using Windows Package Manager
winget install Apple.Pkl
```

For more installation options, see https://pkl-lang.org/main/current/pkl-cli/index.html#installation.

## 3. Install editor tooling

For the best experience, we recommend using a JetBrains editor (IntelliJ, GoLand, Webstorm, etc), with our Pkl plugin.

### JetBrains editor

To install the Pkl plugin in a JetBrains editor, follow these steps:

1. Select Settings › Plugins › ⚙ › Manage Plugin Repositories.
2. Add the url https://github.com/apple/pkl-intellij/releases/latest/download/updatePlugins.xml to the list of custom plugin repositories.
3. Select Settings › Plugins › Marketplace.
4. Search for and install the pkl plugin.

### Visual Studio Code

To install the Pkl plugin in Visual Studio Code, follow these steps:

1. Download the latest version of the .vsix file from https://github.com/apple/pkl-vscode/releases/latest/
2. Run `code --install-extension pkl-vscode-0.24.0.vsix`

#### Java requirement

The Visual Studio Code extension requires at least Java 22 or higher to be on the machine.
We recommend using Java 25, the current LTS.

Java can be installed in many ways.

```bash 
# Installs Temurin, a variant of OpenJDK published by the Adoptium group
brew install --cask temurin@25
```

Alternatively, you can use a Java installer published by a vendor.
Here are some options for OpenJDK vendors:

* [Temurin](https://adoptium.net/temurin/releases)
* [Azul](https://www.azul.com/downloads/?package=jdk#zulu)
* [Corretto](https://aws.amazon.com/corretto/)

If you have Java installed, but it isn't on your machine's `PATH`, you can point the plugin to its installation location:

1. Open user preferences in VS Code: <kbd>⌘</kbd> + <kbd>,</kbd> (macOS), or <kbd>Ctrl</kbd> + <kbd>,</kbd> (Windows/Linux)
2. Type `pkl.lsp.java.path` in the search input bar
3. In the resulting input box, write the path to the `java` command.

### Other editors

It's possible to get Pkl support in many other editors, thanks to the Pkl Language Server.
For usage instructions for the Pkl Language Server, see https://pkl-lang.org/lsp/current/index.html.
