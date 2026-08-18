-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFJSPWebShellz\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if #l_0_1 == 20 and (string.match)(l_0_1, "^%x+%.jsp$") and ((string.find)(l_0_0, "/windchill/login/", 1, true) or (string.find)(l_0_0, "/windchill/codebase/login/", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN

