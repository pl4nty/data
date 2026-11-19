-- Threat: !InfrastructureShared
-- Name: 6a7805aeaad6
-- Type: 21

if mp.get_mpattribute("pea_hasappendeddata") == false then
  return mp.INFECTED
end
return mp.LOWFI
