-- Threat: !InfrastructureShared
-- Name: 22eb38f3f2989
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
end
if l_0_0 ~= nil and (isTainted(l_0_0, "new_script_file_created_hint") or isTainted(l_0_0, "new_archive_file_created_hint") or isTainted(l_0_0, "new_elf_file_created_hint")) then
  taint(l_0_0, "remote_file_created_taint", 3600)
  mp.ReportLowfi(l_0_0, 3672992343)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer__RemoteFileCopy.A")
  bm.trigger_sig("RemoteFileCopy", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
