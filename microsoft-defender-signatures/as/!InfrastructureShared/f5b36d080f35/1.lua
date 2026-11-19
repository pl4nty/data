-- Threat: !InfrastructureShared
-- Name: f5b36d080f35
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if string.find(l_0_0, " -adminuser ", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_sysadminctl_secToken")
    return mp.INFECTED
  end
end
return mp.CLEAN
