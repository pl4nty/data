-- Threat: !InfrastructureShared
-- Name: !#LUA:PowerShell:CmdProc:Exception
-- Type: 8
-- MpAttributes: MpNewlyCreatedHint & Lua:DLLExt

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "powershell.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if string.find(string.lower(l_0_2), "\\microsoft\\windows defender advanced threat protection\\", 1, true) and (string.find(l_0_3, "\\windows\\systemtemp\\", 1, true) or string.find(l_0_3, "\\windows\\temp\\", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
