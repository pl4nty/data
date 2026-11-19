-- Threat: !InfrastructureShared
-- Name: 67782a1d767a
-- Type: 21

if mp.get_mpattribute("pea_hasappendeddata") then
  return mp.SUSPICIOUS
end
return mp.CLEAN
