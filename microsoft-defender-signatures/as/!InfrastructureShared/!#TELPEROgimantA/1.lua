-- Threat: !InfrastructureShared
-- Name: !#TELPER:Ogimant.A
-- Type: 9

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("appdata\\roaming\\wget\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
