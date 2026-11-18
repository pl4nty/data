-- Threat: !InfrastructureShared
-- Name: 25b310fb4a16
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "fsprocsvc.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(bm.get_current_process_startup_info)
if l_0_1 and l_0_2 ~= nil then
  local l_0_3 = l_0_2.ppid
  if l_0_3 ~= nil and IsTechniqueObservedForPid(l_0_3, "T1036") then
    TrackPidAndTechniqueBM("BM", "T1059", "masqamsi")
    return mp.INFECTED
  end
end
return mp.CLEAN
