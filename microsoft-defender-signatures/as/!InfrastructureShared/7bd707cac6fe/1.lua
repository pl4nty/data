-- Threat: !InfrastructureShared
-- Name: 7bd707cac6fe
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "java.exe") or string.find(l_0_1, "javaw.exe") then
    return mp.CLEAN
  else
    TrackPidAndTechnique("CMDHSTR", "T1057", "discovery_lsass", 86400)
    return mp.INFECTED
  end
end
return mp.CLEAN
