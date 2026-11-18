-- Threat: !InfrastructureShared
-- Name: 198b351ac8c65
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  local l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  if string.find(l_0_0, " -a ", 1, true) and string.find(l_0_0, "admin", 1, true) then
    TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_dseditgroup")
    return mp.INFECTED
  end
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_dscl")
return mp.INFECTED
