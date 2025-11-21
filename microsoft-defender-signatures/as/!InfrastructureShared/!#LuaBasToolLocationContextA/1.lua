-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaBasToolLocationContextA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
do
  if l_0_0 then
    local l_0_1, l_0_2 = IsBasToolLocationContext(l_0_0)
    if not l_0_1 then
      return mp.CLEAN
    end
    if l_0_2 ~= nil and #l_0_2 > 0 and l_0_2 ~= "any" then
      (mp.set_mpattribute)("Lua:Context/BasToolLocationContext.A!" .. l_0_2)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

