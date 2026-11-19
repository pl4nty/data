-- Threat: !InfrastructureShared
-- Name: 858c5b544180
-- Type: 21

local l_0_0 = mp.getfilesize()
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if 16410 < l_0_0 and l_0_1 ~= nil and l_0_2 ~= nil and (string.find(l_0_1, "/tmp", 1, true) or string.find(l_0_1, "/home", 1, true) or string.find(l_0_1, "/dev/shm", 1, true) or string.find(l_0_1, "/var/crash", 1, true)) and l_0_2 == "java" then
  return mp.INFECTED
end
return mp.CLEAN
