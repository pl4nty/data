-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a47c_589.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 > 16410 and l_0_1 ~= nil and l_0_2 ~= nil and ((string.find)(l_0_1, "/tmp", 1, true) or (string.find)(l_0_1, "/home", 1, true) or (string.find)(l_0_1, "/dev/shm", 1, true) or (string.find)(l_0_1, "/var/crash", 1, true)) and l_0_2 == "java" then
  return mp.INFECTED
end
return mp.CLEAN

