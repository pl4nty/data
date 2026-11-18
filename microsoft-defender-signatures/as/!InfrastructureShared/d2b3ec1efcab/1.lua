-- Threat: !InfrastructureShared
-- Name: d2b3ec1efcab
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 then
  local l_0_2 = string.match(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
  if l_0_2 then
    local l_0_3 = "queue_remotedir_mount"
    local l_0_4 = "dir_name"
    local l_0_5 = StringSplit(l_0_1, " ")
    if l_0_5 == nil or #l_0_5 < 4 then
      return mp.CLEAN
    end
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if 1 < l_0_6 and l_0_7 ~= nil and sysio.IsFolderExists(l_0_7) then
        if not IsKeyValuePairInRollingQueue(l_0_3, l_0_4, l_0_7) then
          AppendToRollingQueue(l_0_3, l_0_4, l_0_7, 3600)
        end
        addRelatedProcess()
        reportRelatedBmHits()
        TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_SuspiciousMount")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
