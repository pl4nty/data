-- Threat: !InfrastructureShared
-- Name: 9b8b3b7dc55a0
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[5].matched then
  l_0_0, l_0_1 = "reg_save_hive", "T1003.002"
elseif this_sigattrlog[6].matched then
  l_0_0, l_0_1 = "vssadmin_shadow", "T1003.003"
elseif this_sigattrlog[7].matched then
  l_0_0, l_0_1 = "wmic_shadow", "T1003.003"
elseif this_sigattrlog[8].matched then
  l_0_0, l_0_1 = "net_user_add", "T1136.001"
elseif this_sigattrlog[9].matched then
  l_0_0, l_0_1 = "net_group_admin_add", "T1098"
elseif this_sigattrlog[10].matched then
  l_0_0, l_0_1 = "psexec_child", "T1569.002"
elseif this_sigattrlog[11].matched then
  l_0_0, l_0_1 = "bitsadmin_transfer", "T1197"
elseif this_sigattrlog[12].matched then
  l_0_0, l_0_1 = "certutil_urlcache", "T1105"
elseif this_sigattrlog[13].matched then
  l_0_0, l_0_1 = "nltest_dclist", "T1018"
elseif this_sigattrlog[14].matched then
  l_0_0, l_0_1 = "nltest_trusts", "T1482"
elseif this_sigattrlog[15].matched then
  l_0_0, l_0_1 = "whoami", "T1033"
elseif this_sigattrlog[16].matched then
  l_0_0, l_0_1 = "hostname", "T1082"
elseif this_sigattrlog[17].matched then
  l_0_0, l_0_1 = "ipconfig", "T1016"
elseif this_sigattrlog[18].matched then
  l_0_0, l_0_1 = "systeminfo", "T1082"
elseif this_sigattrlog[19].matched then
  l_0_0, l_0_1 = "tasklist", "T1057"
elseif this_sigattrlog[20].matched then
  l_0_0, l_0_1 = "netstat", "T1049"
elseif this_sigattrlog[21].matched then
  l_0_0, l_0_1 = "route", "T1016"
elseif this_sigattrlog[22].matched then
  l_0_0, l_0_1 = "arp", "T1016"
elseif this_sigattrlog[23].matched then
  l_0_0, l_0_1 = "nslookup", "T1018"
elseif this_sigattrlog[24].matched then
  l_0_0, l_0_1 = "dsquery", "T1087.002"
elseif this_sigattrlog[25].matched then
  l_0_0, l_0_1 = "quser", "T1033"
elseif this_sigattrlog[26].matched then
  l_0_0, l_0_1 = "query", "T1033"
elseif this_sigattrlog[27].matched then
  l_0_0, l_0_1 = "qwinsta", "T1033"
elseif this_sigattrlog[28].matched then
  l_0_0, l_0_1 = "klist", "T1558"
elseif this_sigattrlog[29].matched then
  l_0_0, l_0_1 = "cmdkey", "T1555"
elseif this_sigattrlog[30].matched then
  l_0_0, l_0_1 = "cmd", "T1059.003"
elseif this_sigattrlog[31].matched then
  l_0_0, l_0_1 = "powershell", "T1059.001"
elseif this_sigattrlog[32].matched then
  l_0_0, l_0_1 = "pwsh", "T1059.001"
elseif this_sigattrlog[33].matched then
  l_0_0, l_0_1 = "mshta", "T1218.005"
elseif this_sigattrlog[34].matched then
  l_0_0, l_0_1 = "rundll32", "T1218.011"
elseif this_sigattrlog[35].matched then
  l_0_0, l_0_1 = "regsvr32", "T1218.010"
elseif this_sigattrlog[36].matched then
  l_0_0, l_0_1 = "cscript", "T1059.005"
elseif this_sigattrlog[37].matched then
  l_0_0, l_0_1 = "wscript", "T1059.005"
elseif this_sigattrlog[38].matched then
  l_0_0, l_0_1 = "schtasks", "T1053.005"
elseif this_sigattrlog[39].matched then
  l_0_0, l_0_1 = "sc", "T1543.003"
elseif this_sigattrlog[40].matched then
  l_0_0, l_0_1 = "wevtutil", "T1070.001"
elseif this_sigattrlog[41].matched then
  l_0_0, l_0_1 = "bcdedit", "T1490"
elseif this_sigattrlog[42].matched then
  l_0_0, l_0_1 = "curl", "T1105"
elseif this_sigattrlog[43].matched then
  l_0_0, l_0_1 = "wget", "T1105"
elseif this_sigattrlog[44].matched then
  l_0_0, l_0_1 = "procdump", "T1003.001"
elseif this_sigattrlog[45].matched then
  l_0_0, l_0_1 = "comsvcs_minidump", "T1003.001"
elseif this_sigattrlog[46].matched then
  l_0_0, l_0_1 = "robocopy", "T1105"
elseif this_sigattrlog[47].matched then
  l_0_0, l_0_1 = "xcopy", "T1105"
elseif this_sigattrlog[48].matched then
  l_0_0, l_0_1 = "esentutl", "T1003.003"
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if not isnull(l_0_2) then
  bm.add_related_string("winrm_lateral_actor", string.lower(l_0_2), bm.RelatedStringBMReport)
end
bm.add_related_string("winrm_lateral_primitive", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("winrm_context", "WinRMSessionTracking", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLateralToolingChild")
TrackPidAndTechniqueBM("BM", l_0_1, "WinRMLateralToolingChild")
return mp.INFECTED
