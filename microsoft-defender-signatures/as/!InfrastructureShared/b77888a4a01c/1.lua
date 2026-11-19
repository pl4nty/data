-- Threat: !InfrastructureShared
-- Name: b77888a4a01c
-- Type: 21

local l_0_0 = mp.getfilesize()
if hstrlog[3].matched and 163840 <= l_0_0 and l_0_0 <= 196608 then
  return mp.INFECTED
end
if peattributes.no_security == true and 163840 <= l_0_0 and l_0_0 <= 176128 and pehdr.NumberOfSections >= 6 and pehdr.NumberOfSections <= 8 and mp.get_mpattribute("NID:Emotet.PB!MSR!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
