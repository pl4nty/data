-- Threat: !InfrastructureShared
-- Name: 41b311eff19c
-- Type: 21

if not mp.get_mpattribute("WPADProcess") then
  return mp.CLEAN
end
mp.set_mpattribute("WPADExploitAttempt.seen")
mp.set_mpattribute("WPADSuspCacheFile")
if this_sigattrlog[3].matched then
  local l_0_0 = MpCommon.PathToWin32Path(this_sigattrlog[3].utf8p1)
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
end
return mp.INFECTED
