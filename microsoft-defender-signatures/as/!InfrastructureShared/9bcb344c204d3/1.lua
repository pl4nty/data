-- Threat: !InfrastructureShared
-- Name: 9bcb344c204d3
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[45].matched and this_sigattrlog[45].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[45].utf8p1
elseif this_sigattrlog[46].matched and this_sigattrlog[46].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[46].utf8p1
end
if l_0_0 ~= nil then
  taint(l_0_0, "remote_file_created_taint", 3600)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A")
  bm.trigger_sig("RemoteFileCopy", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
