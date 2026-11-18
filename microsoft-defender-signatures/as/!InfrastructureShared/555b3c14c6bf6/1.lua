-- Threat: !InfrastructureShared
-- Name: 555b3c14c6bf6
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) then
  return mp.CLEAN
end
if IsTrustedWinRMSession("BM") then
  return mp.CLEAN
end
local l_0_0 = "PSRemoting"
if this_sigattrlog[3] ~= nil and this_sigattrlog[3].matched then
  l_0_0 = "WinRS"
end
WinRMSessionTrackProcess("BM", l_0_0, "HostedShell")
local l_0_1, l_0_2, l_0_3
if this_sigattrlog[20] and this_sigattrlog[20].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[20], "host_lsass_handle", "T1003.001"
elseif this_sigattrlog[16] and this_sigattrlog[16].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[16], "host_load_temp_dll", "T1620"
elseif this_sigattrlog[17] and this_sigattrlog[17].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[17], "host_load_appdata_dll", "T1620"
elseif this_sigattrlog[18] and this_sigattrlog[18].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[18], "host_load_programdata_dll", "T1620"
elseif this_sigattrlog[19] and this_sigattrlog[19].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[19], "host_load_public_dll", "T1620"
elseif this_sigattrlog[4] and this_sigattrlog[4].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[4], "host_drop_temp_exe", "T1105"
elseif this_sigattrlog[5] and this_sigattrlog[5].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[5], "host_drop_temp_dll", "T1105"
elseif this_sigattrlog[6] and this_sigattrlog[6].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[6], "host_drop_temp_ps1", "T1105"
elseif this_sigattrlog[7] and this_sigattrlog[7].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[7], "host_drop_appdata_exe", "T1105"
elseif this_sigattrlog[8] and this_sigattrlog[8].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[8], "host_drop_appdata_dll", "T1105"
elseif this_sigattrlog[9] and this_sigattrlog[9].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[9], "host_drop_appdata_ps1", "T1105"
elseif this_sigattrlog[10] and this_sigattrlog[10].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[10], "host_drop_programdata_exe", "T1105"
elseif this_sigattrlog[11] and this_sigattrlog[11].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[11], "host_drop_programdata_dll", "T1105"
elseif this_sigattrlog[12] and this_sigattrlog[12].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[12], "host_drop_programdata_ps1", "T1105"
elseif this_sigattrlog[13] and this_sigattrlog[13].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[13], "host_drop_public_exe", "T1105"
elseif this_sigattrlog[14] and this_sigattrlog[14].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[14], "host_drop_public_dll", "T1105"
elseif this_sigattrlog[15] and this_sigattrlog[15].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[15], "host_drop_public_ps1", "T1105"
elseif this_sigattrlog[22] and this_sigattrlog[22].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[22], "host_runkey_persist", "T1547.001"
elseif this_sigattrlog[23] and this_sigattrlog[23].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[23], "host_runonce_persist", "T1547.001"
elseif this_sigattrlog[24] and this_sigattrlog[24].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[24], "host_winrm_service_config", "T1021.006"
elseif this_sigattrlog[25] and this_sigattrlog[25].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[25], "host_wsman_config", "T1021.006"
elseif this_sigattrlog[21] and this_sigattrlog[21].matched then
  l_0_1, l_0_2, l_0_3 = this_sigattrlog[21], "host_outbound_connect", "T1105"
else
  return mp.CLEAN
end
local l_0_4 = l_0_1.utf8p1
if not isnull(l_0_4) then
  local l_0_5 = string.lower(l_0_4)
  if string.find(l_0_5, "\\windows\\ccm\\", 1, true) or string.find(l_0_5, "\\intunemanagementextension\\", 1, true) or string.find(l_0_5, "\\ansible\\", 1, true) or string.find(l_0_5, "\\windows defender\\", 1, true) or string.find(l_0_5, "__psscriptpolicytest_", 1, true) then
    return mp.CLEAN
  end
  bm.add_related_string("WinRMHost_artifact", l_0_5, bm.RelatedStringBMReport)
  if string.find(l_0_2, "host_drop", 1, true) or string.find(l_0_2, "host_load", 1, true) then
    bm.add_related_file(l_0_4)
    WinRMSessionTrackFile(l_0_4, l_0_0, "DeliveredFile")
    mp.set_mpattribute("Lua:Context/WinRMSessionDroppedFile.A")
  end
end
bm.add_related_string("WinRMHost_reason", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("WinRMHost_tool", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("winrm_context", "WinRMSessionTracking", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMHostActivity")
TrackPidAndTechniqueBM("BM", l_0_3, "WinRMHostActivity")
add_parents()
return mp.INFECTED
