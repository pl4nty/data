-- Threat: !InfrastructureShared
-- Name: 201b3092c6e3a
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[12].matched then
  local l_0_0
  if this_sigattrlog[12].utf8p2 ~= nil then
    l_0_0 = this_sigattrlog[12].utf8p2
  end
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  if string.find(l_0_0, " -G sudo ", 1, true) or string.find(l_0_0, " -G sudo,", 1, true) or string.find(l_0_0, " -G%s[%w]+,sudo%s", 1, false) or string.find(l_0_0, " -G%s[%w]+,sudo,", 1, false) or string.find(l_0_0, " -G%s[%w]+[,%w]+,sudo%s", 1, false) or string.find(l_0_0, " -G%s[%w]+[,%w]+,sudo,", 1, false) then
    TrackPidAndTechniqueBM("BM", "T1136", "Persistence_CreateAccount")
    return mp.INFECTED
  end
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1548.003", "PrivilegeEscalation")
TrackPidAndTechniqueBM("BM", "T1078.003", "Persistence")
return mp.INFECTED
