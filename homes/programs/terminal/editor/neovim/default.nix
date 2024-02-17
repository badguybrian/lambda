
{ config,
  pkgs, 
  inputs,
  ... 
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim  = {
    enable = true;
    options = {
      number = true;
      relativenumber = true;
      };
      
  colorschemes = {
     catppuccin = {
       enable = true;
       background = {
        dark = "frappe";
       };
      flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      disableBold = false;
      disableItalic = false;
      disableUnderline = false;
      transparentBackground = true;
      integrations = {
        cmp = true;
        noice = true;
        notify = true;
        harpoon = true;
        gitsigns = true;
        which_key = true;
        illuminate = {
          enabled = true;
        };
        treesitter = true;
        treesitter_context = true;
        telescope.enabled = true;
        indent_blankline.enabled = true;
        mini.enabled = true;
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          underlines = {
            errors = [ "underline" ];
            hints = [ "underline" ];
            information = [ "underline" ];
            warnings = [ "underline" ];
          };
        };
      };
    };
  };

   keymaps = [
    {
     action = "<cmd>NvimTreeToggle<CR>";
     key = "f";
    }
    {
     action = "<cmd>Telescope find_files<CR>";
     key = "t";
    }
  ];

  plugins = {


    alpha =
    {
      enable = true;
      theme = null;
      iconsEnabled = true;
      layout =
        let
          padding = val: {
            type = "padding";
            inherit val;
          };
        in
        [
          (padding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              " nixos nixos nixos nixos nixos nixos nixos  "
              " linux linux linux linux linux linux linux  "
              " funny funny funny funny funny funny funny  "
              "                                            "
              "          git@github.com:badguybrian        "
              " THE END IS NEVER THE END IS NEVER THE END  "
            ];
          }
          (padding 2)
          {
            type = "button";
            val = "  Find File";
            on_press.raw = "require('NvimTree.builtin').Toggle";
            opts = {
              # hl = "comment";
              keymap = [ "n" "f" ":NvimTreeToggle <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "f";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  New File";
            on_press.__raw = "function() vim.cmd[[ene]] end";
            opts = {
              # hl = "comment";
              keymap = [ "n" "n" ":ene <BAR> startinsert <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "󰈚  Recent Files";
            on_press.raw = "require('telescope.builtin').oldfiles";
            opts = {
              # hl = "comment";
              keymap = [ "n" "r" ":Telescope oldfiles <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "r";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "󰈭  Find Word";
            on_press.raw = "require('telescope.builtin').live_grep";
            opts = {
              # hl = "comment";
              keymap = [ "n" "g" ":Telescope live_grep <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "g";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Restore Session";
            on_press.raw = "require('persistence').load()";
            opts = {
              # hl = "comment";
              keymap = [ "n" "s" ":lua require('persistence').load()<cr>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "s";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Quit Neovim";
            on_press.__raw = "function() vim.cmd[[qa]] end";
            opts = {
              # hl = "comment";
              keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "q";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
    };

    conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [ [ "prettierd" "prettier" ] ];
      css = [ [ "prettierd" "prettier" ] ];
      javascript = [ [ "prettierd" "prettier" ] ];
      javascriptreact = [ [ "prettierd" "prettier" ] ];
      typescript = [ [ "prettierd" "prettier" ] ];
      typescriptreact = [ [ "prettierd" "prettier" ] ];
      java = [ "google-java-format" ];
      python = [ "black" ];
      lua = [ "stylua" ];
      nix = [ "nixpkgs_fmt" ];
      markdown = [ [ "prettierd" "prettier" ] ];
      rust = [ "rustfmt" ];
    };
  };

  trouble = {
    enable = true;
    autoClose = true;
  };
     bufferline = {
       enable = true;
       separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
       offsets = [
         {
          filetype = "nvim-tree";
          text = "nvim-tree";
          highlight = "Directory";
          text_align = "left";
         }
       ];
     };

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
      mini.enable = true;
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
    alwaysDivideMiddle = true;
    globalstatus = true;
    ignoreFocus = [ "neo-tree" ];
    extensions = [ "fzf" ];
    theme = "auto";
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = "|"; # 
      right = "|"; # 
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        { name = "branch"; icon = ""; }
        "diff"
        "diagnostics"
      ];
      lualine_c = [ "filename" ];
      lualine_x = [ "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ ''" " .. os.date("%R")'' ];
    };
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
