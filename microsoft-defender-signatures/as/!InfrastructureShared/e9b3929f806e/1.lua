-- Threat: !InfrastructureShared
-- Name: e9b3929f806e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  if l_0_0 ~= "" and l_0_0 ~= nil then
    local l_0_1 = l_0_0:match("^tar%s+(%S+)")
    if l_0_1 and string.find(l_0_1, "c", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_ArchiveViaUtility")
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_ArchiveViaUtility")
return mp.INFECTED
