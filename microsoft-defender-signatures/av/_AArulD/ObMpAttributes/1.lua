-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_AArulD\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "google_update_checker.js" then
  return mp.INFECTED
end
if l_0_0 == "local_update_checker.js" then
  return mp.INFECTED
end
return mp.CLEAN

