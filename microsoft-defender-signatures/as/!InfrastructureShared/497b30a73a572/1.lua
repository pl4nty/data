-- Threat: !InfrastructureShared
-- Name: 497b30a73a572
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  if not string.match(l_0_0, "delete%-snapshot") and not string.match(l_0_0, "delete%-volume") then
    return mp.CLEAN
  end
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  if not string.match(l_0_0, "snapshot delete") and not string.match(l_0_0, "disk delete") then
    return mp.CLEAN
  end
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  if not string.match(l_0_0, "snapshots delete") and not string.match(l_0_0, "disks delete") then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1490", "Impact_InhibitSystemRecovery")
return mp.INFECTED
