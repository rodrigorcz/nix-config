{ pkgs, config, lib, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      { # Devicons
        plugin = nvim-web-devicons;
        type = "lua";
        config =
          ''
            require('nvim-web-devicons').setup{}
          '';
      }

      { # Treesitter
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config =
          ''
            require('nvim-treesitter.configs').setup{
              highlight = { enable = true },
              indent = { enable = true },
            }
          '';
      }

      /*{ # Nvim-tree
        plugin = nvim-tree-lua;
        type = "lua";
        config =
          ''
            require('nvim-tree').setup{
              view = {
                width = 30,
                side = 'left',
                mappings = {
                  list = {
                    { key = {"l", "<CR>", "o"}, cb = require'nvim-tree.config'.nvim_tree_callback("edit") },
                    { key = "h", cb = require'nvim-tree.config'.nvim_tree_callback("close_node") },
                  }
                }
              },
              renderer = {
                icons = {
                  glyphs = {
                    default = '',
                    symlink = '',
                    git = {
                      unstaged = "✗",
                      staged = "✓",
                      unmerged = "",
                      renamed = "➜",
                      untracked = "★",
                      deleted = "",
                      ignored = "◌"
                    },
                    folder = {
                      default = "",
                      open = "",
                      empty = "",
                      empty_open = "",
                      symlink = "",
                      symlink_open = "",
                    },
                  }
                }
              }
            }

            vim.keymap.set('n', '<C-n>', ':NvimTreeFindFile<CR>')
          '';
      }*/

      { # Telescope
        plugin = telescope-nvim;
        type = "lua";
        config =
          ''
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.setup{
              defaults = {
                prompt_prefix = "> ",
                selection_caret = "> ",
                mappings = {
                  i = {
                    ["<C-n>"] = "move_selection_next",
                    ["<C-p>"] = "move_selection_previous",
                  },
                },
                color_devicons = true,
              },
              pickers = {
                find_files = {
                  theme = "dropdown",
                },
                live_grep = {
                  theme = "dropdown",
                },
              },
            }

          vim.keymap.set('n', '<C-p>', builtin.find_files, {})
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
          vim.keymap.set({'n', 'v'}, '<leader>fs', builtin.grep_string, {})
          vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

          '';
      }

      { # Plenary
        plugin = plenary-nvim;
        type = "lua";
      }

      { # Gruvbox
        plugin = gruvbox;
        config = ''
          vim.cmd([[colorscheme gruvbox]])
        '';
      }
    ];
  };
}