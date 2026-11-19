-- Threat: !InfrastructureShared
-- Name: 15ad793d4a6a2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("microsoft.ad.platform.commandagent", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("wsmprovhost.exe", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechnique("CMDHSTR", "T1129", "mklink")
return mp.LOWFI
