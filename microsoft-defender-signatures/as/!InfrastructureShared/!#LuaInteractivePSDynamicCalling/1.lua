-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaInteractivePSDynamicCalling\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 > 1000 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if not (string.find)(l_0_3, "explorer.exe", 1, true) and not (string.find)(l_0_3, "windowsterminal.exe", 1, true) then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(tostring(headerpage))
local l_0_5 = "(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*)?\\$(?:[A-Za-z_][A-Za-z0-9_]*|\\{[A-Za-z_][A-Za-z0-9_]*\\}|(?:global|script|local|private):[A-Za-z_][A-Za-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t\\r\\n;(]|$)"
if (MpCommon.StringRegExpSearch)(l_0_5, l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN

