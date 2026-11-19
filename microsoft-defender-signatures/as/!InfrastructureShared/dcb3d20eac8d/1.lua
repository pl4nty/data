-- Threat: !InfrastructureShared
-- Name: dcb3d20eac8d
-- Type: 21

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p1)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  if mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  if not this_sigattrlog[6].ppid then
    return mp.CLEAN
  end
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[6].ppid)
  if l_0_1 and l_0_1.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
