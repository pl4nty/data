-- Threat: !InfrastructureShared
-- Name: 15ed759687e4c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2, l_0_3 = pcall(mp.GetParentProcInfo)
if l_0_2 and l_0_3 ~= nil then
  l_0_0 = l_0_3.ppid
  l_0_1 = l_0_3.image_path
  local l_0_4 = string.lower(l_0_1)
  local l_0_5 = l_0_4:match("([^\\]+)$")
  local l_0_6 = {
    ["net.exe"] = true,
    ["ng bailey image collector.exe"] = true,
    ["ltsvc.exe"] = true,
    ["explorer.exe"] = true
  }
  if l_0_6[l_0_5] then
    return mp.CLEAN
  end
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  if IsLegacyOrgMachine() then
    return mp.CLEAN
  end
  if IsPidExcluded(l_0_0) then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_0, "T1087", "account_discovery")
  if IsDetectionThresholdMet(l_0_0) then
    return mp.INFECTED
  end
  if IsTechniqueObservedForPid(l_0_0, "T1071") then
    return mp.INFECTED
  end
  local l_0_7 = GetTacticsTableForPid(l_0_3.ppid)
  if l_0_7.winrshost_childproc or l_0_7.wsmprovhost_childproc or l_0_7.wmi_childproc or l_0_7.remotedropexe_childproc or l_0_7.python_childproc or l_0_7.mshta_childproc or l_0_7.webshell_childproc or l_0_7.exec_remotedroppedscript_a then
    return mp.INFECTED
  end
end
return mp.CLEAN
