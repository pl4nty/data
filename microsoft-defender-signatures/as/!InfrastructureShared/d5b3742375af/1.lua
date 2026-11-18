-- Threat: !InfrastructureShared
-- Name: d5b3742375af
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
local l_0_2 = l_0_0.ppid
if l_0_1 ~= nil and l_0_2 ~= nil then
  if IsPidExcluded(l_0_2) then
    return mp.CLEAN
  end
  if StringStartsWith(l_0_1, "%") then
    return mp.CLEAN
  end
  bm.DisableSignature()
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_1)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if l_0_5 ~= nil then
      local l_0_6 = string.lower(l_0_5)
      if IsKeyInRollingQueue("SuspFileDroppedViaSMB", l_0_6, true) then
        bm.trigger_sig("T1570", "exec_remotedroppedscript_a", l_0_2)
        return mp.INFECTED
      end
      if IsKeyInRollingQueue("DroppedByPossibleRemotelyCreatedProc", l_0_6, true) then
        bm.trigger_sig("T1570", "exec_remotedroppedscript_b", l_0_2)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
