-- Threat: !InfrastructureShared
-- Name: 98b30a2cbd27
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and (string.find(l_0_0, "*.db", 1, true) or string.find(l_0_0, "*.txt", 1, true) or string.find(l_0_0, "*.doc", 1, true) or string.find(l_0_0, "*.pdf", 1, true) or string.find(l_0_0, "*.xls", 1, true) or string.find(l_0_0, "*.sh", 1, true) or string.find(l_0_0, "*.c", 1, true)) and (string.find(l_0_0, "/root/", 1, true) or string.find(l_0_0, "/root ", 1, true) or string.find(l_0_0, "/home/", 1, true) or string.find(l_0_0, "/home ", 1, true) or string.find(l_0_0, " / ", 1, true)) then
  TrackPidAndTechniqueBM("BM", "T1083", "Discovery_FileAndDirectoryDiscovery")
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  addRelatedProcess()
  reportRelatedBmHits()
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN
