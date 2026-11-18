-- Threat: !InfrastructureShared
-- Name: 114d7034e0595
-- Type: 21
-- Flags: 1
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\programdata\\microsoft\\azurewatson\\0\\awdumpifeo.exe", 1, true) or string.find(l_0_1, "\\windows\\system32\\werfault.exe", 1, true) or string.find(l_0_1, "\\windows\\syswow64\\werfault.exe", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1003.001", "credentialdumping_concrete", 86400)
return mp.INFECTED
