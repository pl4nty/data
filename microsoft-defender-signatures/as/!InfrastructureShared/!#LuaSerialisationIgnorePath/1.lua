-- Threat: !InfrastructureShared
-- Name: !#Lua:SerialisationIgnorePath
-- Type: 13
-- MpAttributes: AGGR:TextFormattingRunProperties.B64 | SCPT:BinaryFormatterSerialisedHeader.B64

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("kali", 1, true) or l_0_0:find("nethunter", 1, true) or l_0_0:find("exploitdb", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
