-- Threat: !InfrastructureShared
-- Name: 4bb34f810227
-- Type: 21

local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 and l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\appdata\\local\\packages", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(bm.get_imagepath())
  if not string.find(l_0_2, "packages\\canonicalgrouplimited.ubuntu", 1, true) and not string.find(l_0_2, "packages\\thedebianproject.debiangnulinux", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
