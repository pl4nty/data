-- Threat: !InfrastructureShared
-- Name: 17d0861757af
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.getfilesize()
if l_0_0 < 8192 or 13631488 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(4096, 4096)
if mp.readu_u32(l_0_1, 1) ~= 1852400232 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_1, 113) ~= 1414483794 then
  return mp.CLEAN
end
if string.find(l_0_1, "\000SAM\000", 1, true) then
  mp.set_mpattribute("BM_REGHIVE_SAM")
elseif string.find(l_0_1, "\000Cache\000", 1, true) then
  mp.set_mpattribute("BM_REGHIVE_SECURITY")
elseif string.find(l_0_1, "ActivationBroker", 1, true) then
  mp.set_mpattribute("BM_REGHIVE_SYSTEM")
else
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 and IsKeyInRollingQueue("PPIDRollingQueue", l_0_2, true) then
  mp.set_mpattribute("PPIDRollingQueueMatched")
end
return mp.INFECTED
