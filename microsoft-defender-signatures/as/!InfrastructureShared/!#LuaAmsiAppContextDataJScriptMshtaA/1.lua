-- Threat: !InfrastructureShared
-- Name: !#Lua:AmsiAppContextDataJScriptMshta.A
-- Type: 13
-- MpAttributes: Lua:AmsiAppContextData:Proc:JScript & Lua:AmsiAppContextData:ProcName:mshta.exe

if mp.get_mpattribute("Lua:AmsiAppContextDataJScriptMshta.A") then
  return mp.CLEAN
end
if mp.get_mpattributesubstring("PACKED_WITH:[MshtaJScript]") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if string.find(l_0_0, "%->%[MshtaJScript%]") then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Lua:AmsiAppContextData:File:javascript:")
if l_0_1 ~= nil and #l_0_1 ~= 0 then
  if #l_0_1[1] < 200 then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1[1]:match("javascript:(.+)")
  if not l_0_2 then
    return mp.CLEAN
  end
  mp.vfo_add_buffer(l_0_2, "[MshtaJScript]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN
