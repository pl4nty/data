-- Threat: !InfrastructureShared
-- Name: !#TEL:PUA:Win32/TorExecutable
-- Type: 24
-- MpAttributes: HEUR:TorExecutable

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and l_0_0:find("tor.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
