-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Typhon.E!dha
-- Type: 24
-- MpAttributes: HSTR:PyInstallerFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("typhon_windows", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
