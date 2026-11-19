-- Threat: !InfrastructureShared
-- Name: 80d79814bc85
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, "\\startup\\", 1, true) and not string.find(l_0_1, ".hta", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path or "")
  if string.find(l_0_3, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("CMDHSTR", "T1218.005", "mshta_startup_exec")
TrackPidAndTechniqueBM("CMDHSTR", "T1547.001", "startup_persistence_hta")
return mp.INFECTED
