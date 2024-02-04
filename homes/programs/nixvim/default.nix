
{ config,
  pkgs, 
  inputs,
  ... 
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./stuff.nix
  ];

 programs.nixvim = {
  enable = true;

    extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "neocord";
      version = "2024-01-11";
      src = pkgs.fetchFromGitHub {
        owner = "IogaMaster";
        repo = "neocord";
        rev = "9b624d5189f699ab454e9515262c13965395b8dd";
        sha256 = "0kvii7w1yqrzfidwky4ljmmsr33pciz1rw9v3kqf0ck36clqqxhy";
      };
    })
  ];

  extraConfigLua = ''
    require("neocord").setup({
        -- General options
        auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        logo                = "https://repository-images.githubusercontent.com/325421844/ecb73f47-cb89-4ee0-a0fd-9743c2f3569a", -- "auto" or url
        logo_tooltip        = "Nixvim", -- nil or string
        main_image          = "logo", -- "language" or "logo"
        client_id           = "1157438221865717891",       -- Use your own Discord application client id (not recommended)
        log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number  = false,                      -- Displays the current line number instead of the current project
        blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time           = true,                       -- Show the timer
        global_timer        = false,

        -- Rich Presence text options
        editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "I use nixos btw",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.
    })
    '';

  colorschemes = {
     catppuccin = {
       enable = true;
       background = {
        light = "macchiato";
        dark = "mocha";
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
              " confused as heck can someone tell me whats "
              " we never die do we? why am i even alive... "
              " welp we're all stuck inside of this timeli "
              " ne... wait is that me above? i don't even  "
              " know anymore i wan't to escape but i can't "
              "                                            "
              "          git@github.com:badguybrian        "
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
