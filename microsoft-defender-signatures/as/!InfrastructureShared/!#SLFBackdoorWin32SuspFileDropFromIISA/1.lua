-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:Win32/SuspFileDropFromIIS.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & Lua:NewFileContextDataPresent

if not mp.get_mpattribute("Lua:NewFileContextData:ProcName!w3wp.exe") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\microsoft.net\\framework64\\v4.0.30319\\temporary asp.net files\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 ~= nil then
  local l_0_2 = GetTacticsTableForPid(l_0_1)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_2.webshell_parent then
    return mp.INFECTED
  end
end
return mp.CLEAN
