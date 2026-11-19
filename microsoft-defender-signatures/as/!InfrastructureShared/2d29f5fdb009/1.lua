-- Threat: !InfrastructureShared
-- Name: 2d29f5fdb009
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "\\splunkuniversalforwarder\\", 1, true) ~= nil then
  return mp.LOWFI
end
return mp.INFECTED
