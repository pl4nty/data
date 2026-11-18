-- Threat: !InfrastructureShared
-- Name: 11978f5c13307
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.hasappendeddata and mp.get_mpattribute("pea_no_security") and 2097152 <= l_0_0 and l_0_0 <= 8388608 then
  return mp.INFECTED
end
return mp.CLEAN
