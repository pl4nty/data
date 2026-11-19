-- Threat: !InfrastructureShared
-- Name: 1d3b3e4ede7e9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if isTainted(l_0_0, "remote_file_created_taint") then
  TrackPidAndTechniqueBM("BM", "T1083", "Discovery_FileAndDirectoryDiscovery")
  TrackPidAndTechniqueBM("BM", "T1005", "Collection_DatafromLocalSystem")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
if string.sub(l_0_0, 0, 5) == "/tmp/" or string.sub(l_0_0, 0, 9) == "/var/tmp/" or string.sub(l_0_0, 0, 9) == "/dev/shm/" then
  TrackPidAndTechniqueBM("BM", "T1083", "Discovery_FileAndDirectoryDiscovery")
  TrackPidAndTechniqueBM("BM", "T1005", "Collection_DatafromLocalSystem")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
