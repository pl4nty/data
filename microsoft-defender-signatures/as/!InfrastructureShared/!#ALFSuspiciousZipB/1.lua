-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFSuspiciousZipB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 30 then
  return mp.CLEAN
end
local l_0_1 = (mp.readheader)(8, 2)
if l_0_1 ~= "\000\000" then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if (string.find)(l_0_2, ".cpack", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

