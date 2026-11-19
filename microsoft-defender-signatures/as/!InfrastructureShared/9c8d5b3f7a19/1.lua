-- Threat: !InfrastructureShared
-- Name: 9c8d5b3f7a19
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:SpyMe.C")
  return mp.INFECTED
end
return mp.LOWFI
