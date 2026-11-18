-- Threat: !InfrastructureShared
-- Name: c1d7e8e0f5ab
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
if not string.find(l_0_1, "\\startup\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, ".vbs", 1, true) or string.find(l_0_1, ".vbe", 1, true) or string.find(l_0_1, ".js", 1, true) or string.find(l_0_1, ".jse", 1, true) or string.find(l_0_1, ".wsf", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path or "")
  if string.find(l_0_4, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("CMDHSTR", "T1059.005", "cscript_startup_exec")
TrackPidAndTechniqueBM("CMDHSTR", "T1547.001", "startup_persistence_script")
return mp.INFECTED
