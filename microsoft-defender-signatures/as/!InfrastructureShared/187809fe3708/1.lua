-- Threat: !InfrastructureShared
-- Name: 187809fe3708
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("pea_hasappendeddata") and l_0_0 < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
