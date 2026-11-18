-- Threat: !InfrastructureShared
-- Name: 221b30e2ae6fd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = false
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if 450 < #l_0_2 then
  return mp.CLEAN
end
if #l_0_2 < 70 then
  return mp.CLEAN
end
if StringEndsWith(l_0_2, "\\powershell.exe\"") then
  return mp.CLEAN
end
if StringEndsWith(l_0_2, "\\powershell_ise.exe\"") then
  return mp.CLEAN
end
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.image_path ~= nil and mp.bitand(l_0_6.reason_ex, 1) == 1 and string.lower(string.sub(l_0_6.image_path, -13)) == "\\explorer.exe" then
    l_0_1 = true
    break
  end
end
if not l_0_1 then
  return mp.CLEAN
end
if contains(l_0_2, {
  "host.ui.rawui.windowtitle",
  ".ps1",
  ".hta",
  "Update.exe",
  "msedge",
  "\\pwsh.exe",
  "iexplore",
  "slack",
  "chrome",
  "acrord32",
  "loom.exe",
  "excel",
  "onenote",
  "winword",
  "powerpnt",
  "onenote",
  "outlook",
  "signal",
  "start menu",
  "program files",
  "embedhook-x86.exe",
  "canva",
  "synccontroller",
  "acrobat",
  "firefox",
  "accenture",
  "articulate",
  "bluestacks",
  "explorer",
  "install-win.ps1"
}) then
  return mp.CLEAN
end
return mp.INFECTED
