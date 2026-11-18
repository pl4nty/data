-- Threat: !InfrastructureShared
-- Name: 2db30bcbee3c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
else
  return mp.CLEAN
end
if l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
TrackFileAndTechnique(l_0_1, "T1574.001:printnotify_dll_hijack")
TrackPidAndTechniqueBM("BM", "T1543.003", "printnotify_svc_hijack")
return mp.INFECTED
