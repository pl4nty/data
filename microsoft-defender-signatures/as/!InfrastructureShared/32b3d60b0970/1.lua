-- Threat: !InfrastructureShared
-- Name: 32b3d60b0970
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -12))
if l_0_0 == "\\msiexec.exe" then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
return mp.INFECTED
