-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!JumplumpC!dha\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
do
  if l_0_0:find("\\system32\\spool\\drivers\\color\\", 1, true) then
    local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_1:find("applicationframe", 1, true) or l_0_1:find("wmiprvsd", 1, true) or l_0_1:find("wuapi", 1, true) or l_0_1:find("propsys", 1, true) or l_0_1:find("wbemprox", 1, true) or l_0_1:find("actioncenter", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

