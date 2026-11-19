-- Threat: !InfrastructureShared
-- Name: 287b3ed40b5e0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_mt2023", 300)
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.ppid == "" then
  return mp.CLEAN
end
local l_0_1 = GetTacticsTableForPid(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_3, l_0_4 in pairs(l_0_1) do
  if string.find(l_0_3, "mt2023", 1, true) then
    l_0_2 = l_0_2 + 1
  end
end
if 2 < l_0_2 then
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
