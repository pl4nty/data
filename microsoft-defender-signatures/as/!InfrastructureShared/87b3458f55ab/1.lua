-- Threat: !InfrastructureShared
-- Name: 87b3458f55ab
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or not this_sigattrlog[2].utf8p2 then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
if not string.find(l_0_0, "--silent", 1, true) then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
bm.add_related_string("INSTALL_CMDLINE", this_sigattrlog[2].utf8p2, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1219", "SuspAnydeskInstall.A!ofn")
return mp.INFECTED
