-- Threat: !InfrastructureShared
-- Name: !#SLFPER:InstallCore.F
-- Type: 8

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "downloadmanager.exe" or l_0_0:find("^dmgr2%..+%.exe$") then
  return mp.INFECTED
end
return mp.CLEAN
