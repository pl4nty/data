-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileModuleNotInCleanContextA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exclusion:IsPotentialSideLoad.A") == true then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 and #l_0_0 < 3 then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_0) == false then
  return mp.INFECTED
end
return mp.CLEAN

