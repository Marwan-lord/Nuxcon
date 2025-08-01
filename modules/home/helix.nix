{ lib, config, ... }:

{

  options = {
    home.helix.enable = lib.mkEnableOption "enables helix";
  };

  config = lib.mkIf config.home.helix.enable {
    programs.helix.enable = true;

    # stylix.targets.helix.enable = false;
    programs.helix.settings = {

      keys.normal = {
        space.w = ":w";
        space.q = ":q";
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
      };
      # theme = "gruvbox";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        auto-pairs = false;
        # lsp.display-inlay-hints = true;
      };
      editor.auto-completion = false;
      editor.color-modes = true;
      editor.cursorline = true;
      editor.bufferline = "multiple";

      editor.indent-guides = {
        render = true;
        character = "▏";
        skip-levels = 1;
      };
    };
    programs.helix.languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }

        {
          name = "rust";
          formatter = {
            command = "rustfmt";
          };
          auto-format = true;
        }

        {
          name = "kotlin";
          formatter = {
            command = "ktfmt";

          };
          auto-format = true;
        }
      ];
    };
  };
}
