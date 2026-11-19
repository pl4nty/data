-- Threat: !InfrastructureShared
-- Name: 7329bbe74f77
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.FILEPATH_QUERY_FULL)):lower()
if l_0_0:find("kali", 1, true) or l_0_0:find("nethunter", 1, true) or l_0_0:find("exploitdb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
