-- Threat: !InfrastructureShared
-- Name: bbb3603f208e
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  local l_0_1 = string.lower(bm.get_imagepath())
  if not string.find(l_0_1, "packages\\canonicalgrouplimited.ubuntu", 1, true) and not string.find(l_0_1, "packages\\thedebianproject.debiangnulinux", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
