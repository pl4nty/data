-- Threat: !InfrastructureShared
-- Name: !#Lua:Polinrider.ST1
-- Type: 13
-- MpAttributes: SCRT.Polinrider.S03 | SCRT.Polinrider.S05 | SCRT.Polinrider.S08

local l_0_0 = mp.enum_mpattributesubstring("SCRT.Polinrider.S")
if #l_0_0 == 8 then
  mp.set_mpattribute("Lua:Polinrider.Mal")
elseif 6 <= #l_0_0 then
  mp.set_mpattribute("Lua:Polinrider.Sus")
elseif 4 <= #l_0_0 then
  mp.set_mpattribute("Lua:Polinrider.Tel")
end
return mp.CLEAN
