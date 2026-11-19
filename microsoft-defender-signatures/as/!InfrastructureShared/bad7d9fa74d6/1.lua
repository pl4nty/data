-- Threat: !InfrastructureShared
-- Name: bad7d9fa74d6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_0.ppid
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1:find("beremote.exe", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("bpbkar32.exe", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("caagstart.exe", 1, true) then
    return mp.CLEAN
  end
  if l_0_2 ~= "" and l_0_2 ~= nil then
    TrackPidAndTechnique(l_0_2, "T1003.002", "credentialdumping")
    if IsTechniqueObservedForPid(l_0_2, "iis_exch_web") or IsTechniqueObservedForPid(l_0_2, "iis_exch_childproc") or IsTechniqueObservedForPid(l_0_2, "webshell_parent") then
      return mp.INFECTED
    end
  end
  local l_0_3 = GetTacticsTableForPid(l_0_0.ppid)
  if l_0_3.winrshost_childproc or l_0_3.wsmprovhost_childproc or l_0_3.wmi_childproc or l_0_3.remotedropexe_childproc or l_0_3.python_childproc or l_0_3.rundll32_childproc or l_0_3.wscript_childproc or l_0_3.cscript_childproc or l_0_3.mshta_childproc or l_0_3.webshell_childproc or l_0_3.exec_remotedroppedscript_a then
    return mp.INFECTED
  end
end
return mp.LOWFI
