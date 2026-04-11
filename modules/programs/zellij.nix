{ ... }:
{
  nix-config.defaultTags = {
    dev = false;
    zellij = false;
  };
  nix-config.apps.zellij = {
    tags = [ "dev" "zellij" ];
    home = { ... }: {
      programs.zellij.enable = true;

      home.file.".config/zellij/config.kdl".text = ''
        default_layout "compact"
        pane_frames false
        show_startup_tips false
        show_release_notes false

        keybinds clear-defaults=true {
            locked {
                bind "Ctrl g" { SwitchToMode "normal"; }
            }
            pane {
                bind "left"  { MoveFocus "left"; }
                bind "down"  { MoveFocus "down"; }
                bind "up"    { MoveFocus "up"; }
                bind "right" { MoveFocus "right"; }
                bind "h" { MoveFocus "left"; }
                bind "j" { MoveFocus "down"; }
                bind "k" { MoveFocus "up"; }
                bind "l" { MoveFocus "right"; }
                bind "n" { NewPane; SwitchToMode "normal"; }
                bind "d" { NewPane "down"; SwitchToMode "normal"; }
                bind "r" { NewPane "right"; SwitchToMode "normal"; }
                bind "f" { ToggleFocusFullscreen; SwitchToMode "normal"; }
                bind "z" { TogglePaneFrames; SwitchToMode "normal"; }
                bind "w" { ToggleFloatingPanes; SwitchToMode "normal"; }
                bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "normal"; }
                bind "x" { CloseFocus; SwitchToMode "normal"; }
                bind "Ctrl p" { SwitchToMode "normal"; }
            }
            tab {
                bind "left"  { GoToPreviousTab; }
                bind "right" { GoToNextTab; }
                bind "h" { GoToPreviousTab; }
                bind "l" { GoToNextTab; }
                bind "n" { NewTab; SwitchToMode "normal"; }
                bind "x" { CloseTab; SwitchToMode "normal"; }
                bind "tab" { ToggleTab; }
                bind "1" { GoToTab 1; SwitchToMode "normal"; }
                bind "2" { GoToTab 2; SwitchToMode "normal"; }
                bind "3" { GoToTab 3; SwitchToMode "normal"; }
                bind "4" { GoToTab 4; SwitchToMode "normal"; }
                bind "5" { GoToTab 5; SwitchToMode "normal"; }
                bind "Ctrl t" { SwitchToMode "normal"; }
                bind "r" { TabNameInput 0; }
                bind "s" { ToggleActiveSyncTab; }
            }
            resize {
                bind "h" { Resize "Increase left"; }
                bind "j" { Resize "Increase down"; }
                bind "k" { Resize "Increase up"; }
                bind "l" { Resize "Increase right"; }
                bind "H" { Resize "Decrease left"; }
                bind "J" { Resize "Decrease down"; }
                bind "K" { Resize "Decrease up"; }
                bind "L" { Resize "Decrease right"; }
                bind "+" { Resize "Increase"; }
                bind "-" { Resize "Decrease"; }
                bind "Ctrl n" { SwitchToMode "normal"; }
            }
            scroll {
                bind "j" { ScrollDown; }
                bind "k" { ScrollUp; }
                bind "d" { HalfPageScrollDown; }
                bind "u" { HalfPageScrollUp; }
                bind "Ctrl c" { ScrollToBottom; SwitchToMode "normal"; }
                bind "s" { SwitchToMode "entersearch"; SearchInput 0; }
                bind "Ctrl s" { SwitchToMode "normal"; }
            }
            entersearch {
                bind "enter" { SwitchToMode "search"; }
                bind "esc"   { SwitchToMode "scroll"; }
                bind "Ctrl c" { SwitchToMode "scroll"; }
            }
            search {
                bind "n" { Search "down"; }
                bind "p" { Search "up"; }
                bind "c" { SearchToggleOption "CaseSensitivity"; }
                bind "w" { SearchToggleOption "Wrap"; }
            }
            session {
                bind "d" { Detach; }
                bind "Ctrl o" { SwitchToMode "normal"; }
            }
            shared_except "locked" {
                bind "Ctrl g" { SwitchToMode "locked"; }
                bind "Ctrl q" { Quit; }
                bind "Alt h" { MoveFocusOrTab "left"; }
                bind "Alt l" { MoveFocusOrTab "right"; }
                bind "Alt j" { MoveFocus "down"; }
                bind "Alt k" { MoveFocus "up"; }
                bind "Alt n" { NewPane; }
                bind "Alt f" { ToggleFloatingPanes; }
                bind "Alt +" { Resize "Increase"; }
                bind "Alt -" { Resize "Decrease"; }
                bind "Ctrl p" { SwitchToMode "pane"; }
                bind "Ctrl t" { SwitchToMode "tab"; }
                bind "Ctrl n" { SwitchToMode "resize"; }
                bind "Ctrl s" { SwitchToMode "scroll"; }
                bind "Ctrl o" { SwitchToMode "session"; }
            }
            shared_except "normal" "locked" "entersearch" {
                bind "enter" { SwitchToMode "normal"; }
            }
            shared_except "normal" "locked" "entersearch" "renametab" "renamepane" {
                bind "esc" { SwitchToMode "normal"; }
            }
        }
      '';
    };
  };
}
