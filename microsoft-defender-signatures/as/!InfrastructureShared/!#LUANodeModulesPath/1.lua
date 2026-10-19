-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUANodeModulesPath\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  l_0_0 = (string.gsub)(l_0_0, "/", "\\")
  if (string.find)(l_0_0, "\\node_modules\\", 1, true) ~= nil then
    return mp.INFECTED
  end
end
;
(mp.set_mpattribute)("//LUA:NonNodeModulesPath")
return mp.CLEAN

