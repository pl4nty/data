-- Threat: !InfrastructureShared
-- Name: !#SLF:JS/MacOSVSCodeExtension
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.sub(l_0_0, -12) ~= "package.json" then
  return mp.CLEAN
end
local l_0_1 = string.find(l_0_0, "/.vscode/extensions/", 1, true) or string.find(l_0_0, "/.cursor/extensions/", 1, true) or string.find(l_0_0, "/.windsurf/extensions/", 1, true) or string.find(l_0_0, "/.trae/extensions/", 1, true) or string.find(l_0_0, "/.antigravity/extensions/", 1, true) or string.find(l_0_0, "/claude extensions/", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
