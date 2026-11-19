-- Threat: !InfrastructureShared
-- Name: ffb3970b5603
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = ""
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
taint(l_0_0, "remote_file_created_taint", 3600)
mp.ReportLowfi(l_0_0, 3672992343)
bm.add_related_file(l_0_0)
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_RemoteFileCopyELF")
return mp.INFECTED
