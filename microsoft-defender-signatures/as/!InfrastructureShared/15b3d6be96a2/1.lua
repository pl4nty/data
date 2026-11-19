-- Threat: !InfrastructureShared
-- Name: 15b3d6be96a2
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -18))
  if string.find(l_0_0, "\\werfault.exe", 1, true) or string.find(l_0_0, "\\wmiprvse.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
return mp.INFECTED
