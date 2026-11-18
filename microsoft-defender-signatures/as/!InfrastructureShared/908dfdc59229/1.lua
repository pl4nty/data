-- Threat: !InfrastructureShared
-- Name: 908dfdc59229
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacBooster.O")
  return mp.INFECTED
end
return mp.LOWFI
