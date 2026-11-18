-- Threat: !InfrastructureShared
-- Name: 151b32947c6e3
-- Type: 21
-- Includes: LuaFuncHelper

if not IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_min", true) or not IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_max", true) then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[7].utf8p2
local l_0_1 = this_sigattrlog[7].ppid
local l_0_2
_, _, l_0_2 = string.find(l_0_0, "vmbaseaddress:(%d+);")
l_0_2 = tonumber(l_0_2)
local l_0_3 = tonumber(GetRollingQueueKeyValue("KernelCallBackAddress", "fn_AddressRange_min"))
local l_0_4 = tonumber(GetRollingQueueKeyValue("KernelCallBackAddress", "fn_AddressRange_max"))
if not (l_0_2 and l_0_4) or not l_0_3 then
  return mp.CLEAN
end
if l_0_2 <= l_0_4 and l_0_2 >= l_0_3 then
  bm.add_related_process(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
