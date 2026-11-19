-- Threat: !InfrastructureShared
-- Name: 22fd7eeaf9fcb
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and string.lower(string.sub(l_0_0.image_path, -8)) == "w3wp.exe" then
  local l_0_1 = l_0_0.ppid
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetProcessCommandLine(l_0_1)
  if l_0_2 == "" or l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "-ap \"sharepoint", 1, true) then
    TrackPidAndTechnique(l_0_1, "T1505.003", "webshell_parent_sp", 604800)
    return mp.INFECTED
  end
end
return mp.CLEAN
