-- Threat: !InfrastructureShared
-- Name: c8b3625932d2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 then
  local l_0_2 = string.match(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
  if l_0_2 then
    TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RemoteDirMount")
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
