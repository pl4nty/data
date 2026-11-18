-- Threat: !InfrastructureShared
-- Name: !#SLFPER:Dexphot.B
-- Type: 8

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "installer_mi.exe" then
  return mp.INFECTED
end
return mp.CLEAN
