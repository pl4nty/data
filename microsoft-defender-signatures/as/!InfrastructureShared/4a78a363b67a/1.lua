-- Threat: !InfrastructureShared
-- Name: 4a78a363b67a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 917504 <= l_0_0 and l_0_0 <= 958464 and pehdr.NumberOfSections >= 4 and pehdr.NumberOfSections <= 6 and mp.get_mpattribute("NID:GerWiper.A!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
