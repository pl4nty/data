-- Threat: !InfrastructureShared
-- Name: !#SLF:Ransom:Win32/Robbinhood
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_0 == nil or l_0_0 ~= nil and 3600 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 ~= "services.exe" then
  return mp.CLEAN
end
local l_0_2 = string.lower(MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)))
if string.find(l_0_2, "\\windows\\system32\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.sub(l_0_3, -26) == "\\windows\\temp\\winlogon.exe" then
  return mp.INFECTED
else
  if string.find(string.lower(MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))), "\\windows\\temp\\", 1, true) == nil then
    return mp.CLEAN
  end
  mp.ReportLowfi(l_0_3, 3621311303)
end
return mp.CLEAN
