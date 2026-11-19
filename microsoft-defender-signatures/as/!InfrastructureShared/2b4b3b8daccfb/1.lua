-- Threat: !InfrastructureShared
-- Name: 2b4b3b8daccfb
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p1
end
if l_0_0 ~= nil then
  taint(l_0_0, "remote_file_created_taint_specific", 3600)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A")
  bm.trigger_sig("RemoteFileCopy", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
