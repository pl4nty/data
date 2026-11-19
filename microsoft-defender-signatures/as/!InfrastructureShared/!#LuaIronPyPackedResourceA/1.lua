-- Threat: !InfrastructureShared
-- Name: !#Lua:IronPyPackedResource.A
-- Type: 12
-- MpAttributes: (!RPF:TopLevelFile)

if mp.get_mpattribute("Lua:TopLevelFileExt.A!exe") or mp.get_mpattribute("Lua:TopLevelFileExt.A!dll") then
  local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_1 = l_0_0:match("->%[msilres:ipdll.(.-)%]")
  if l_0_1 ~= nil and l_0_1 ~= "" then
    mp.set_mpattribute("Lua:FePyCompiledResourcePresent")
    mp.set_mpattribute("Lua:FePyCompiledRes!" .. l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
