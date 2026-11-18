-- Threat: !InfrastructureShared
-- Name: 75b3717ec4c7
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil then
  l_0_1 = string.lower(string.sub(l_0_1, -21))
  if l_0_1 == "\\system32\\svchost.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
