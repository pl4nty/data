-- Threat: !InfrastructureShared
-- Name: 3978947b3a27
-- Type: 21

local l_0_0 = mp.getfilesize()
if 491520 <= l_0_0 and l_0_0 <= 499712 and pehdr.NumberOfSections >= 7 and pehdr.NumberOfSections <= 8 and mp.get_mpattribute("NID:Emotet.GU!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
