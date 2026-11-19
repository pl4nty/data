-- Threat: !InfrastructureShared
-- Name: b4780b19c35c
-- Type: 21

if mp.get_mpattribute("pea_hasappendeddata") then
  return mp.INFECTED
end
return mp.CLEAN
