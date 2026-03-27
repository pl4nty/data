-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFJSMacOSVSCodeExtension\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.sub)(l_0_0, -12) ~= "package.json" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/.vscode/extensions/", 1, true) or (string.find)(l_0_0, "/.cursor/extensions/", 1, true) or (string.find)(l_0_0, "/.windsurf/extensions/", 1, true) or (string.find)(l_0_0, "/.trae/extensions/", 1, true) or (string.find)(l_0_0, "/.antigravity/extensions/", 1, true) or not (string.find)(l_0_0, "/claude extensions/", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

