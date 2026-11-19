-- Threat: !InfrastructureShared
-- Name: !#SLF:Prifou.D
-- Type: 13

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if (l_0_1 == "setup.log" or l_0_1 == "info.dat" or l_0_1 == "untitled.png" or l_0_1 == "message.") and l_0_0:find("\\appdata\\local\\{........%-....%-....%-....%-............}") then
  return mp.INFECTED
end
return mp.CLEAN
