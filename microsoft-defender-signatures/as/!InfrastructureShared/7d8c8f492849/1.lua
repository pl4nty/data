-- Threat: !InfrastructureShared
-- Name: 7d8c8f492849
-- Type: 21

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil or l_0_0 == "" or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/tmp/", 1, true) == 1 or string.find(l_0_0, "/var/tmp/", 1, true) == 1 or string.find(l_0_0, "/root/", 1, true) == 1 or string.find(l_0_0, "/home/", 1, true) == 1 or string.find(l_0_0, "/run/shm/", 1, true) == 1 or string.find(l_0_0, "/dev/shm/", 1, true) == 1 or string.find(l_0_1, ".", 1, true) == 1 then
  return mp.INFECTED
end
return mp.CLEAN
