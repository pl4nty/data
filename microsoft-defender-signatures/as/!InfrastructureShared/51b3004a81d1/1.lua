-- Threat: !InfrastructureShared
-- Name: 51b3004a81d1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
else
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.ppid
local l_0_3, l_0_4, l_0_5 = l_0_0:match("[^>](.-)([^\\/]-%.?([^%.\\/]*))$")
if l_0_4 == nil then
  return mp.CLEAN
end
if isTainted(l_0_0, "remote_file_created_taint") and checkFilePathInProcessCommandline(l_0_2, l_0_4, true) then
  reportRelatedBmHits()
  addRelatedProcess()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_GpgEncryption")
  return mp.INFECTED
end
if (string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/") and checkFilePathInProcessCommandline(l_0_2, l_0_4, true) then
  reportRelatedBmHits()
  addRelatedProcess()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_GpgEncryption")
  return mp.INFECTED
end
return mp.CLEAN
