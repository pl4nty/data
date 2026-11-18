-- Threat: !InfrastructureShared
-- Name: 6bd7c23db808
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if IsKeyInRollingQueue("BmProcessSearchOrderHijackB", l_0_2, true) then
  return mp.INFECTED
end
return mp.CLEAN
