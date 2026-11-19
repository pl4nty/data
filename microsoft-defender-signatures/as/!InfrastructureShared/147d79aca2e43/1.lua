-- Threat: !InfrastructureShared
-- Name: 147d79aca2e43
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
TrackPidAndTechnique("CMDHSTR", "T1218.005", "mshta-parent")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = {
    ["svchost.exe"] = true,
    ["taskhostw.exe"] = true
  }
  local l_0_3 = l_0_1:match("([^\\]+)$")
  if l_0_2[l_0_3] then
    return mp.INFECTED
  end
end
return mp.CLEAN
