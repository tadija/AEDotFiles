local M = {}

M.hyperKeymaps = {
  ["`"] = "Ghostty",
  a = "Activity Monitor",
  b = { name = "Arc", bundle = "company.thebrowser.Browser", fallbackHide = true },
  c = "ChatGPT",
  d = "Disk Utility",
  e = "toggleEmojiPicker",
  f = "Finder",
  g = "Fork",
  h = "Home",
  i = "Instapaper",
  k = "Claude",
  l = "Launchpad",
  m = "Music",
  n = "Notes",
  o = "Obsidian",
  p = "Copilot",
  r = "reloadHammerspoon",
  s = "Safari",
  t = "Terminal",
  u = "Sublime Text",
  v = { name = "Visual Studio Code", bundle = "com.microsoft.VSCode" },
  w = "Windows App",
  x = "Xcode",
  y = "Spotify",
  z = "Zed",
}

M.hyperSpaceKeymaps = {
  m = "toggleMute",
  d = "toggleDarkMode",
  h = "hideAllApps",
  l = hs.caffeinate.lockScreen,
  q = "quitAllApps",
}

M.hyperTabKeymaps = {
  a = "AppCleaner",
  b = "Books",
  c = "Console",
  d = "Developer",
  f = "Freeform",
  h = "HazeOver",
  i = "iPhone Mirroring",
  k = "Keynote",
  l = "LinearMouse",
  m = "Mail",
  n = "Numbers",
  o = "OpenVPN Connect",
  p = "Pages",
  r = "Reminders",
  s = "Sketch",
  t = "TablePlus",
  w = "Weather",
  x = "xScope",
  y = "System Settings",
  z = "Zoom",
}

return M

