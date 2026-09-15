{
  vim = {
    utility = {
      snacks-nvim = {
        setupOpts = {
          picker = {
            enabled = true;
            formatters = {
              file = {
                filename_first = true;
                truncate = 100;
                icon_width = 2;
                git_status_hl = true;
              };
            };
            # layout = { preset = "dropdown", preview = false, layout = { width = 0.7 } };
            sources = {
              explorer = {
                auto_close = true;
                hidden = true;
                ignored = true;
                layout = "right";
              };
              files = {
                hidden = true;
              };
              buffers = {
                focus = "list";
                hidden = true;
                current = false;
              };
              grep = {
                hidden = true;
              };
            };
          };
          explorer.enabled = true;
        };
      };
    };
    keymaps = [
      # Top Pickers & Explorer
      {
        key = "<leader> ";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        desc = "Buffers";
      }
      {
        key = "<C-n>";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.explorer()<cr>";
        desc = "File Explorer";
      }
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lines()<cr>";
        desc = "Buffer Lines";
      }

      # Find
      {
        key = "<leader>sf";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.files()<cr>";
        desc = "Find Files";
      }
      {
        key = "<leader>sp";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.projects()<cr>";
        desc = "Projects";
      }
      {
        key = "<leader>s:";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.command_history()<cr>";
        desc = "Command History";
      }
      {
        key = "<leader>sn";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.notifications()<cr>";
        desc = "Notification History";
      }

      # Grep
      {
        key = "<leader>sg";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep()<cr>";
        desc = "Grep";
      }
      {
        key = "<leader>st";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.todo_comments()<cr>";
        desc = "Todos";
      }
      {
        key = "<leader>sw";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.grep_word()<cr>";
        desc = "Visual selection or word";
      }
      {
        key = "<leader>sr";
        mode = "n";
        silent = true;
        action = "<cmd>nohlsearch<cr>";
        desc = "Reset search";
      }

      # LSP
      {
        key = "gd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
        desc = "Goto Definition";
      }
      {
        key = "gD";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_declarations()<cr>";
        desc = "Goto Declaration";
      }
      {
        key = "gr";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
        desc = "References";
        nowait = true;
      }
      {
        key = "gI";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
        desc = "Goto Implementation";
      }
      {
        key = "gy";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
        desc = "Goto Type Definition";
      }
      {
        key = "<leader>ss";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
        desc = "LSP Symbols";
      }
      {
        key = "<leader>sS";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>";
        desc = "LSP Workspace Symbols";
      }
    ];
  };
}
