-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin32HopSkipJumpPayloadB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2, l_0_3 = (string.match)(l_0_1, "^(.*)\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" or l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "^(.*)%.exe$")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_2 .. "\\" .. l_0_4)
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
if (sysio.IsFileExists)(l_0_5) then
  (mp.ReportLowfi)(l_0_5, 892398022)
end
return mp.CLEAN

