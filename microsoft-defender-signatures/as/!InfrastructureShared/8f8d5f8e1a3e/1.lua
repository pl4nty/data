-- Threat: !InfrastructureShared
-- Name: 8f8d5f8e1a3e
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:MacReviver.D")
  return mp.INFECTED
end
return mp.LOWFI
