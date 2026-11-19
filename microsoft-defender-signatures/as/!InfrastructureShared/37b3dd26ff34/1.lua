-- Threat: !InfrastructureShared
-- Name: 37b3dd26ff34
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("antimalware_provider.+\\frhook") then
    return mp.CLEAN
  end
  if l_0_1:find("c:\\sophrm\\invoke-blkeyescrow.ps1", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("c:\\vpc10\\applicationupdate\\sub_settings_defender.vbs", 1, true) then
    return mp.CLEAN
  end
  if (l_0_1:find(":\\program files\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true)) and (l_0_1:find("checkpoint", 1, true) or l_0_1:find("fortinet", 1, true)) then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
