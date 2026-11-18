-- Threat: !InfrastructureShared
-- Name: !#LUA:AIDiscovery_vscodetasks_json
-- Type: 24
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:VscodeTasksFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = "ai_discovery_scan"
local l_0_3 = "ai_vscode_tasks_json"
local l_0_4 = "ai_vscode_tasks_json_" .. l_0_1
local l_0_5 = 86400
local l_0_6 = mp.getfilesize()
if 1024000 < l_0_6 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = tostring(mp.readfile(0, l_0_6))
mp.readprotection(true)
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = safeJsonDeserialize(l_0_7)
if not l_0_8 then
  return mp.CLEAN
end
if not l_0_8.tasks or not l_0_8.tasks[1] then
  return mp.CLEAN
end
local l_0_9 = l_0_8.tasks[1]
if not l_0_9.runOptions or not l_0_9.runOptions.runOn then
  return mp.CLEAN
end
local l_0_10 = l_0_8
local l_0_11 = safeJsonSerialize(l_0_10)
local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKVNamespaced, l_0_3, l_0_2)
if l_0_12 and l_0_13 ~= nil then
  for l_0_14, l_0_15 in pairs(l_0_13) do
    if l_0_14 == l_0_4 and l_0_15 == l_0_11 then
      return mp.CLEAN
    end
  end
end
AppendToRollingQueueNamespaced(l_0_3, l_0_2, l_0_4, l_0_11, l_0_5, 100)
local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_16 then
  MpCommon.BmTriggerSig(l_0_16, "AIDiscovery_vscode_tasks_json", l_0_11)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
