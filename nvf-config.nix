{ pkgs, lib, ... }:

{
  config.vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    statusline.lualine.enable = true;

    telescope = {
      enable = true;
      mappings = {
        diagnostics = "<leader>gD";
        lspDefinitions = "<leader>gd";
        lspImplementations = "<leader>gi";
        lspReferences = "<leader>gr";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
    };

    autocomplete.nvim-cmp.enable = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
    };

    keymaps = [
      {
        key = "<C-n>";
        mode = "n";
        silent = true;
        action = "<cmd>:Ex<CR>";
      }
      {
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        action = ":Telescope oldfiles<CR>";
      }
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = ":lua vim.diagnostic.open_float()<CR>";
      }
    ];

    lsp.enable = true;

    languages = {
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        lsp.server = "nixd";
        lsp.package = pkgs.nixd;
      };
      python.enable = true;
      java.enable = true;
      yaml.enable = true;
      markdown.enable = true;
    };
  };
}
