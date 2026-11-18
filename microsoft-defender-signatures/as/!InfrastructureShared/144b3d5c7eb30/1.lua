-- Threat: !InfrastructureShared
-- Name: 144b3d5c7eb30
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and l_0_0.image_path:lower():find("mousocoreworker.exe") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003", "credapi_wuauclt")
add_parents()
reportSessionInformation()
return mp.INFECTED
