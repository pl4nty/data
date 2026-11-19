-- Threat: !InfrastructureShared
-- Name: 4878a626e6b4
-- Type: 21

local l_0_0 = mp.getfilesize()
if 90112 <= l_0_0 and l_0_0 <= 98304 and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 5 and mp.get_mpattribute("NID:Hupigon.A!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
