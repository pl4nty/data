-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFJSVSCodeExtension\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.sub)(l_0_0, -12) ~= "extension.js" then
  return mp.CLEAN
end
l_0_0 = (string.gsub)(l_0_0, "\\", "/")
do
  if not (string.find)(l_0_0, "/.vscode/extensions/", 1, true) and not (string.find)(l_0_0, "/.cursor/extensions/", 1, true) and not (string.find)(l_0_0, "/.windsurf/extensions/", 1, true) then
    local l_0_1 = (string.find)(l_0_0, "/.trae/extensions/", 1, true)
  end
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "/dist/", 1, true) ~= nil then
    (mp.set_mpattribute)("MpIsExhaustiveScriptScan")
    return mp.INFECTED
  end
  return mp.CLEAN
end

