-- Threat: !InfrastructureShared
-- Name: 35b3356fcc3e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows\\", 1, true) or string.find(l_0_0, "bomgar-scc.exe", 1, true)) then
  return mp.CLEAN
end
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
