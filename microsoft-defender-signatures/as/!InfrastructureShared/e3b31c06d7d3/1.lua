-- Threat: !InfrastructureShared
-- Name: e3b31c06d7d3
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -12))
  if l_0_0 == "\\svchost.exe" then
    local l_0_1 = bm.get_current_process_startup_info()
    if l_0_1.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
