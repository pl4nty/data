-- Threat: !InfrastructureShared
-- Name: 25b35e056280
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
if l_0_1.IntegrityLevel > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_2 = string.lower(string.sub(bm.get_imagepath(), -13))
if l_0_2 == "\\explorer.exe" then
  return mp.CLEAN
end
return mp.INFECTED
