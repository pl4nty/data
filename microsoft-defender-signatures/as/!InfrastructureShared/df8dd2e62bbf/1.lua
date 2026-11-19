-- Threat: !InfrastructureShared
-- Name: df8dd2e62bbf
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  mp.set_mpattribute("PUA:Block:MacBooster.F")
  return mp.INFECTED
end
return mp.LOWFI
