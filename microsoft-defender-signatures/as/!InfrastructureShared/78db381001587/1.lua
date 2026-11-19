-- Threat: !InfrastructureShared
-- Name: 78db381001587
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if l_0_4 and sysio.IsFileExists(l_0_4) and isTainted(l_0_4, "remote_file_created_taint") then
    addRelatedProcess()
    reportRelatedBmHits()
    TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandandScriptingInterpreter_RemoteScriptExecution")
    return mp.INFECTED
  end
end
return mp.CLEAN
