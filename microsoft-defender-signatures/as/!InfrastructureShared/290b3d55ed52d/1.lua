-- Threat: !InfrastructureShared
-- Name: 290b3d55ed52d
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = "cmd.exe"
elseif this_sigattrlog[6].matched then
  l_0_0 = "wscript.exe"
elseif this_sigattrlog[7].matched then
  l_0_0 = "cscript.exe"
elseif this_sigattrlog[8].matched then
  l_0_0 = "mshta.exe"
elseif this_sigattrlog[9].matched then
  l_0_0 = "regsvr32.exe"
elseif this_sigattrlog[10].matched then
  l_0_0 = "rundll32.exe"
elseif this_sigattrlog[11].matched then
  l_0_0 = "certutil.exe"
elseif this_sigattrlog[12].matched then
  l_0_0 = "bitsadmin.exe"
elseif this_sigattrlog[13].matched then
  l_0_0 = "powershell.exe"
elseif this_sigattrlog[14].matched then
  l_0_0 = "pwsh.exe"
else
  return mp.CLEAN
end
bm.add_related_string("winrm_lolbin", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLolbinExec")
TrackPidAndTechniqueBM("BM", "T1059", "WinRMLolbinExec")
add_parents()
return mp.INFECTED
