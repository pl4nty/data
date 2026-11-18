-- Threat: !InfrastructureShared
-- Name: 35b35bfce2ac
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows\\", 1, true) or string.find(l_0_0, "\\deepl\\", 1, true) or string.find(l_0_0, "rocketleague.exe", 1, true) or string.find(l_0_0, "blackopscoldwar.exe", 1, true)) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1056.001", "keylog")
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
