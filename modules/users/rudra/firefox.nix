{ 
  # pkgs,
  # config,
  # lib,
  ... 
}:

{
  programs.firefox = {
    enable = true;

    profiles.default = {

      bookmarks = { };

      settings = {
        "app.update.auto" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.aboutConfig.showWarning" = false;

        "extension.activeThemeID" = "firefox-compact-dark@mozilla.org";

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

        "browser.toolbars.bookmarks.visibility" = "never";

        "extensions.pocket.enabled" = false;

        "findBar.highlightAll" = true;
      };
    };
  };
}