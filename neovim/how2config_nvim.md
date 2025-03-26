# How to Config Neovim

1. Install vim-plug.

    ```bash
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p ~/.local/share/nvim/site/autoload/
    mv plug.vim ~/.local/share/nvim/site/autoload/
    ```

2. Put `init.vim` and `coc-settings.json` to ~/.config/nvim/

3. Install autopep8, jq, libxml2, libxml2-utils, node.js

    ```bash
    pip3 install autopep8
    apt install jq libxml2 libxml2-utils nodejs
    ```
4. Install yarn.

    ```bash
    npm install -g yarn
    ```

5. If node.js's version is too low for coc.nvim, install the higher version.

    ```bash
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    apt install nodejs
    ```

6. If neovim's version is too low, Install the higher version.

    ```bash
    sudo add-apt-repository ppa:neovim-ppa/unstable
    apt install neovim
    ```

7. If the tree's icons don't show rightly, install nerd-fonts.
