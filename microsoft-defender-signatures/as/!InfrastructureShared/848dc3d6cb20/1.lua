-- Threat: !InfrastructureShared
-- Name: 848dc3d6cb20
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AMCleaner.Q")
  return mp.INFECTED
end
return mp.LOWFI
