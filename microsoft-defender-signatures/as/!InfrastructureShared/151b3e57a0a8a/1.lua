-- Threat: !InfrastructureShared
-- Name: 151b3e57a0a8a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "\\msmpeng.exe" then
  return mp.CLEAN
elseif string.sub(l_0_0, -10) == "\\mpcmd.exe" then
  return mp.CLEAN
elseif string.sub(l_0_0, -13) == "\\mpcmdrun.exe" then
  return mp.CLEAN
elseif string.sub(l_0_0, -12) == "\\svchost.exe" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_gp")
return mp.INFECTED
