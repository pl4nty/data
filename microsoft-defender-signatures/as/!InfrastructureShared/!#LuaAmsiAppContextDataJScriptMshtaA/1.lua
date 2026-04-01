-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAmsiAppContextDataJScriptMshtaA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Lua:AmsiAppContextDataJScriptMshta.A") then
  return mp.CLEAN
end
if (mp.get_mpattributesubstring)("PACKED_WITH:[MshtaJScript]") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "%->%[MshtaJScript%]") then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("Lua:AmsiAppContextData:File:javascript:")
if l_0_1 ~= nil and #l_0_1 ~= 0 then
  if #l_0_1[1] < 200 then
    return mp.CLEAN
  end
  local l_0_2 = (l_0_1[1]):match("javascript:(.+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  ;
  (mp.vfo_add_buffer)(l_0_2, "[MshtaJScript]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

