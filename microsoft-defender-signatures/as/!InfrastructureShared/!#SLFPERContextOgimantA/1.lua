-- Threat: !InfrastructureShared
-- Name: !#SLFPER:ContextOgimant.A
-- Type: 9

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == "msi.exe" and string.sub(l_0_0, -10) == "\\microsoft" then
  return mp.INFECTED
end
return mp.CLEAN
