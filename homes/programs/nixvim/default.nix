
{ config,
  pkgs, 
  inputs,
  ... 
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

 programs.nixvim = {
  enable = true;
  colorschemes = {
     catppuccin = {
      enable = true;
      background.dark = "mocha";
     };
    };

   keymaps = [
    {
     action = "<cmd>NvimTreeToggle<CR>";
     key = "f";
    }
  ];

   plugins = {
      nvim-tree.enable = true;
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      telescope.enable = true;
      oil.enable = true;
      luasnip.enable = true;
      presence-nvim.enable = true;
      toggleterm.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      nvim-colorizer.enable = true;
      neo-tree.enable = true;
      markdown-preview.enable = true;
      auto-save.enable = true;
      lsp-format.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          pylsp.enable = true;
          nixd.enable = true;
          clangd.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          zls.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          bashls.enable = true; 
        };
      };
      nvim-cmp.enable = true;
      lualine = {
        enable = true;
        iconsEnabled = true;
      };
      # Cmp
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-omni.enable = true;
      cmp-pandoc-nvim.enable = true;
      cmp-pandoc-references.enable = true;
      cmp-path.enable = true;
      cmp-rg.enable = true;
      cmp-snippy.enable = true;

      cmp-spell.enable = true;
      cmp-tabnine.enable = true;
      cmp-tmux.enable = true;
      cmp-treesitter.enable = true;
      cmp-vim-lsp.enable = true;
      cmp-vimwiki-tags.enable = true;
      cmp-vsnip.enable = true;
      cmp-zsh.enable = true;
     };
    };
   } 
