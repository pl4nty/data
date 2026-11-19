-- Threat: !InfrastructureShared
-- Name: 291b356eeeddc
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and (this_sigattrlog[5] == nil or not this_sigattrlog[5].matched) and (this_sigattrlog[6] == nil or not this_sigattrlog[6].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = "sam_hive"
elseif this_sigattrlog[8].matched then
  l_0_0 = "security_hive"
elseif this_sigattrlog[9].matched then
  l_0_0 = "ntds_dit"
elseif this_sigattrlog[10].matched then
  l_0_0 = "lsass_dump_create"
elseif this_sigattrlog[11].matched then
  l_0_0 = "lsass_dump"
else
  return mp.CLEAN
end
bm.add_related_string("winrm_credaccess", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMCredentialAccess")
TrackPidAndTechniqueBM("BM", "T1003", "WinRMCredentialAccess")
add_parents()
return mp.INFECTED
