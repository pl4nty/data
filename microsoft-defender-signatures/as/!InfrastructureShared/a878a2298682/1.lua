-- Threat: !InfrastructureShared
-- Name: a878a2298682
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and mp.get_mpattribute("NID:Win64/IcedId.PAE!MTB") and 241664 < l_0_0 and l_0_0 < 249856 then
  return mp.INFECTED
end
return mp.CLEAN
