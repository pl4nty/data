-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaIronPyPackedResourceA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:TopLevelFileExt.A!exe") or (mp.get_mpattribute)("Lua:TopLevelFileExt.A!dll") then
  local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_1 = l_0_0:match("->%[msilres:ipdll.(.-)%]")
  if l_0_1 ~= nil and l_0_1 ~= "" then
    (mp.set_mpattribute)("Lua:FePyCompiledResourcePresent")
    ;
    (mp.set_mpattribute)("Lua:FePyCompiledRes!" .. l_0_1)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

