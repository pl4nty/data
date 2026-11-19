-- Threat: !InfrastructureShared
-- Name: 7e78745bf732
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("inetpub\\solarwinds", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
