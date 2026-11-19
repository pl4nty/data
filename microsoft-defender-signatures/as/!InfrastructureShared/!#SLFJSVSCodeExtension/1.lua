-- Threat: !InfrastructureShared
-- Name: !#SLF:JS/VSCodeExtension
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.sub(l_0_0, -12) ~= "extension.js" then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, "\\", "/")
local l_0_1 = string.find(l_0_0, "/.vscode/extensions/", 1, true) or string.find(l_0_0, "/.cursor/extensions/", 1, true) or string.find(l_0_0, "/.windsurf/extensions/", 1, true) or string.find(l_0_0, "/.trae/extensions/", 1, true)
if not l_0_1 then
  return mp.CLEAN
end
if string.find(l_0_0, "/dist/", 1, true) ~= nil then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
