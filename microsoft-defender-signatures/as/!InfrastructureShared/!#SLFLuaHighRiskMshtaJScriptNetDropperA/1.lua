-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaHighRiskMshtaJScriptNetDropper.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "mshta.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = MpCommon.QueryPersistContext(l_0_1, "Lua:ExeDroppedByJsc")
if not l_0_2 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:MshtaJScriptNet.A")
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_4 = mp.GetProcessCommandLine(l_0_3)
if l_0_4 ~= nil then
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
    if sysio.IsFileExists(l_0_7) and MpCommon.QueryPersistContext(l_0_7, "Lua:HighRiskHtaWebVector") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
