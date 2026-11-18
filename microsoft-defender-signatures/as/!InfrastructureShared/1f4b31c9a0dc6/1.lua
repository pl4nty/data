-- Threat: !InfrastructureShared
-- Name: 1f4b31c9a0dc6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  "\\code.exe",
  "\\cursor.exe",
  "\\windsurf.exe",
  "\\node.exe",
  "\\python.exe",
  "\\pythonw.exe",
  "\\git.exe",
  "\\notepad.exe",
  "\\notepad++.exe",
  "\\sublime_text.exe",
  "\\devenv.exe",
  "\\rider64.exe",
  "\\idea64.exe",
  "\\webstorm64.exe",
  "\\pycharm64.exe",
  "\\goland64.exe",
  "\\clion64.exe",
  "\\phpstorm64.exe",
  "\\rustrover64.exe",
  "\\studio64.exe",
  "\\fleet.exe",
  "\\zed.exe",
  "\\pwsh.exe",
  "\\explorer.exe",
  "\\fabric.exe",
  "\\claude.exe",
  "\\tar.exe",
  "\\antigravity.exe",
  "\\codex.exe",
  "\\onedrive.exe",
  "\\veeamagent.exe",
  "\\obsidian.exe",
  "\\code - insiders.exe",
  "\\copilot.exe"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1565.001", "Impact")
add_parents()
return mp.INFECTED
