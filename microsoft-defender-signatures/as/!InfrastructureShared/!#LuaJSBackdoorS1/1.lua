-- Threat: !InfrastructureShared
-- Name: !#Lua:JS.Backdoor.S1
-- Type: 13
-- MpAttributes: AGGR:BD_JS.SA

local l_0_0 = mp.enum_mpattributesubstring("SCRT:BD_JS")
if 3 <= #l_0_0 and #l_0_0 <= 10 then
  mp.set_mpattribute("Lua:JS.BD.Bad")
elseif #l_0_0 == 2 then
  mp.set_mpattribute("Lua:JS.BD.Susp")
end
return mp.CLEAN
