-- Threat: !InfrastructureShared
-- Name: 22db3c3c91883
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_excl_sys32_dll")
return mp.INFECTED
