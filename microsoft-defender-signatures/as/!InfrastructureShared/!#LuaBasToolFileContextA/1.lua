-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaBasToolFileContextA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = IsBasToolFilenameContext(l_0_0)
if l_0_1 then
  if l_0_2 ~= nil and #l_0_2 > 0 and l_0_2 ~= "any" then
    (mp.set_mpattribute)("Lua:Context/BasToolFileContext.A!" .. l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN

