-- Threat: !InfrastructureShared
-- Name: 4f2b3d118afa6
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[26].matched and this_sigattrlog[26].utf8p1 ~= nil and this_sigattrlog[26].ppid ~= nil then
  l_0_1 = this_sigattrlog[26].ppid
  l_0_0 = string.lower(this_sigattrlog[26].utf8p1)
end
if l_0_0 and l_0_1 then
  local l_0_2 = GetTacticsTableForPid(l_0_1)
  if l_0_2.winrshost_childproc or l_0_2.amsitampering or l_0_2.wsmprovhost_childproc or l_0_2.wmi_childproc or l_0_2.remotedropexe_childproc or l_0_2.python_childproc or l_0_2.rundll32_childproc or l_0_2.wscript_childproc or l_0_2.cscript_childproc or l_0_2.mshta_childproc or l_0_2.webshell_childproc or l_0_2.exec_remotedroppedscript_a or l_0_2.folderguard_blk or l_0_2.folderguard_folder_blk then
    bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
    TrackPidAndTechniqueBM(this_sigattrlog[26].ppid, "T1546.013", "posh_profile_create")
    return mp.INFECTED
  end
end
return mp.CLEAN
