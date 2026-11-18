-- Threat: !InfrastructureShared
-- Name: 65b304bed217
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and l_0_0.image_path ~= "" and string.find(l_0_0.image_path, "services.exe", 1, true) then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.001", "credentialdumping", 86400)
  return mp.INFECTED
end
return mp.CLEAN
