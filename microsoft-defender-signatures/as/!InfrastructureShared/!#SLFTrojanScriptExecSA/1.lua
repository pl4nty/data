-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/Exec.SA
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile & (RPF:AnyFileHasIOAVURL | Lua:HasMotw)

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "cscript.exe" and l_0_0 ~= "wscript.exe " then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("\\downloads\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
