-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39d7957f5f9a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)((MpCommon.PathToWin32Path)(l_0_1))
if l_0_2 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("BmProcessSearchOrderHijackA", l_0_2, true) then
  return mp.INFECTED
end
return mp.CLEAN

